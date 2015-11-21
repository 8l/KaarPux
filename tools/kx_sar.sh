#!/bin/sh
#
# KaarPux: http://kaarpux.kaarposoft.dk
#
# Copyright (C) 2014: Henrik Kaare Poulsen
#
# License: http://kaarpux.kaarposoft.dk/license.html
#

# ============================================================

set -o nounset
set -o errexit

# ============================================================
# 	ANALYSE SYSSTAT RESULTS
# ============================================================

usage () {
	local S
	S=$(basename $0)
	cat << EOF >> /dev/stderr
usage:
	$S [-s] [-p] [-d] [-g] <filename>

	-s	SUMMARY
	-p	PERCENTILES
	-d	DISK IO
	-g	GRAPHS
EOF
}

# ============================================================

err_usage () {
	echo "*** $@" >> /dev/stderr
	usage
	exit 1
}

# ============================================================
# 	AWK FUNCTIONS
# ============================================================

awk_avg () {
	EXP="${1:-}"
	awk "{ s+=\$1 }; END { printf \"${FFMT_FLOAT}\n\", s/NR${EXP} }"
}

# ============================================================

awk_max () {
	EXP="${1:-}"
	awk "{ if (\$1>s) s=\$1 }; END { printf \"${FFMT_FLOAT}\n\", s${EXP} }"
}

# ============================================================

awk_min () {
	EXP="${1:-}"
	awk "BGEIN { s=+NaN; } { if (\$1<s) s=\$1 }; END { printf \"${FFMT_FLOAT}\n\", s${EXP} }"
}

# ============================================================

awk_entries () {
	awk '{ s+=$2 } END { OFS="\t"; print "entries", NR, s, s/60 }'
}

# ============================================================

awk_cpus () {
	awk ' { if ($6 != "all") cpus[$6] = $8 }; END { for (c in cpus) { n++; s+=cpus[c]; }; OFS="\t"; print "CPUs", n, s, s/n }'
}

# ============================================================

awk_stats () {
	FMT="${1:-7.2f}"
	EXPR="${2:-}"
	awk -e "{ s[NR-1]=\$1; t+=\$1 } END { printf \"${FMT}\t\", t/NR${EXPR}; split(\"0.0_0.10_0.25_0.50_0.75_0.90_1.0\", pct, \"_\");  for (p in pct) printf \"${FMT}\t\", s[int(NR*pct[p]-0.5)]${EXPR}; print \"\" }"
}

# ============================================================
# 	SAR FUNCTIONS
# ============================================================

sadf_extract () {
	OPT=$1
	TAG=$2
	shift; shift
	echo $(sadf -p -- ${OPT} "$FILE" | awk "/\t${TAG}\t/" | cut -f6 | "$@")
}

# ============================================================
# 	PERCENTILES
# ============================================================

percentiles () {
	OPT="$1"
	NAME="$2"
	PAT="$3"
	NOT="$4"
	FMT="$5"
	EXP="$6"
	printf '%-15s\t%7s\t%7s\t%7s\t%7s\t%7s\t%7s\t%7s\t%7s\n' "${NAME}" avg min 10pct 25pct 50pct 75pct 90pct max
	for STAT in $(sadf -p -- ${OPT} "$FILE" | awk /${PAT}/ | cut -f5 | sort | uniq | grep -v "${NOT}"); do
		printf "%-15s\t" "${STAT}"
		sadf -p -- ${OPT} "$FILE" | awk /${PAT}/ | grep "${STAT}" | cut -f6 |  sort -n | awk_stats "${FMT}" "${EXP}" | sort
	done
}

# ============================================================

do_percentiles () {

	echo ""
	percentiles "-u ALL" "cpu_state" "." "^foobar" "%7.1f" "*${N_CPUS}"

	echo ""
	percentiles "-I SUM" "interrupt" "." "^%" "%'7.0f" ""

	echo ""
	percentiles "-r" "memory MB" "." "^%" "%'7.0f" "/1024"

	echo ""
	percentiles "-S" "swap MB" "." "^%" "%'7.0f" "/1024"

	echo ""
	percentiles "-W" "swapping Kpages" "." "^%" "%'7.1f" "/1024"

	echo ""
	percentiles "-B" "paging Kpages" "." "^%" "%'7.0f" "/1024"

	echo ""
	percentiles "-n IP" "IP" "." "^%" "%'7.0f" ""

	echo ""
	percentiles "-q" "load" "." "^%" "%'7.0f" ""

	echo ""
	percentiles "-b" "IO" "." "^%" "%'7.0f" ""
}

# ============================================================
# 	DISK
# ============================================================

do_disk () {
	echo ""
	percentiles "-b" "IO" "." "^%" "%'7.0f" ""

	for DEV in $(sadf -p -- -d "$FILE" | cut -f4 | sort -n | uniq); do
		echo ""
		percentiles "-d" "${DEV}" "\t${DEV}\t" "^foobar" "%'7.0f" ""
	done
}

# ============================================================
# 	GRAPH
# ============================================================

one_plot () {
	local F T P

	F="$1"
	T="$2"
	P="$3"
	gnuplot <<-EOF >> "$F.png"
		set terminal pngcairo
		set key off
		set title "$T"
		plot "$F.txt" using ($P) with lines lw 3
	EOF
	F=$(basename "$F")
	echo  "<img src='$F.png'>" >> "${HTML}"
}


# ============================================================

two_plots () {
	local F T P

	F="$1"
	T="$2"
	P="$3"
	one_plot "$F" "$T" "$P"
	sort -rn < "${F}.txt" > "${F}_pareto.txt"
	one_plot "${F}_pareto" "$T pareto" "$P"
}

# ============================================================

do_graph() {

	local TMP HTML

	printf "\n"

	TMP=$(mktemp -d)
	HTML="${TMP}/${FBASE}.html"

	echo  "<!DOCTYPE html>" > "${HTML}"
	echo  "<html>" >> "${HTML}"
	echo  "<h1>${FBASE}</h1>" >> "${HTML}"


	sadf -p -U -- -u "$FILE" | grep "%idle" | cut -f6 > "${TMP}/cpu.txt"
	two_plots "${TMP}/cpu" "CPU util" "100-column(1)"

	sadf -p -U -- -u "$FILE" | grep "%iowait" | cut -f6  > "${TMP}/iow.txt"
	two_plots "${TMP}/iow" "iowait" "column(1)"

	sadf -p -U -- -b "$FILE" | grep "wtps" | cut -f6 > "${TMP}/wtps.txt"
	two_plots "${TMP}/wtps" "wtps" "column(1)"

	sadf -p -U -- -b "$FILE" | grep "rtps" | cut -f6 > "${TMP}/rtps.txt"
	two_plots "${TMP}/rtps" "rtps" "column(1)"

	echo  "</html>" >> "${HTML}"

	echo "Plot files in [${TMP}]. Try:"
	echo "firefox ${HTML}"
}

# ============================================================
# 	SUMMARY
# ============================================================

stats () {
	STAT=$1

	ISTAT=$STAT
	test $ISTAT = awk_max && ISTAT=awk_min

	IDLE=$(sadf -p -- -u "$FILE" | grep "%idle" | cut -f6 | ${ISTAT} )
	IDLE2=$(sadf -p -- -u "$FILE" | grep "%idle" | cut -f6 | ${ISTAT} "*${N_CPUS}")

	UTIL=$(echo "100 - $IDLE" | tr -d , | bc)
	UTIL2=$(echo "100*$N_CPUS - $IDLE2"  | tr -d , | bc)

	printf "${FMT_F}"	"CPU util"	"@100%"		${UTIL}
	printf "${FMT_F}"	"CPU util"	"@${N_CPUS}00%" ${UTIL2}
	printf "${FMT_S}"	"CPU iowait"	"@${N_CPUS}00%" \
		$(sadf_extract "-u" "%iowait" ${STAT} "*${N_CPUS}")
	printf "${FMT_S}"	"Mem used"	"MB" \
		$(sadf_extract "-r" "kbmemused" ${STAT} "/1024")
	printf "${FMT_S}"	"Mem committed"	"MB" \
		$(sadf -p -- -r "$FILE" | grep "kbcommit" | cut -f6 | ${STAT} "/1024")
	printf "${FMT_S}"	"Swap used"	"MB" \
		$(sadf -p -- -S "$FILE" | grep "kbswpused" | cut -f6 | ${STAT} "/1024")
	printf "${FMT_S}"	"Swapout"	"pg/sec" \
		$(sadf -p -- -W "$FILE" | grep "pswpout/s" | cut -f6 | ${STAT})
	printf "${FMT_S}"	"IO read"	"t/sec" \
		$(sadf -p -- -b "$FILE" | awk "/\trtps\t/" | cut -f6 | ${STAT} )
	printf "${FMT_S}"	"IO write"	"t/sec" \
		$(sadf -p -- -b "$FILE" | awk "/\twtps\t/" | cut -f6 | ${STAT} )
	printf "${FMT_S}"	"IO blocked"	"tasks" \
		$(sadf -p -- -q "$FILE" | grep "blocked" | cut -f6 | ${STAT} )
	printf "${FMT_S}"	"runq-sz"	"tasks" \
		$(sadf -p -- -q "$FILE" | grep "runq-sz" | cut -f6 | ${STAT} )
	printf "${FMT_S}"	"plist"		"tasks" \
		$(sadf -p -- -q "$FILE" | grep "plist" | cut -f6 | ${STAT} )
}

# ============================================================

do_summary () {
	FMT_HEAD="%-7s\t\t%s\n"
	FMT_N="%-15s\t%-7s\t%12d\n"
	FMT_F="%-15s\t%-7s\t%15.2f\n"
	FMT_S="%-15s\t%-7s\t%15s\n"

	FFMT_FLOAT="%15.2f"

	ENTRIES=$(sadf -p -- -m CPU "$FILE" | awk_entries)
	read DUMMY N_ENTRIES N_SECONDS N_MINUTES <<-EOF
		${ENTRIES}
	EOF

	printf "\n"
	printf "${FMT_HEAD}"	"FILE" 			"$(basename ${FILE%.sar})"
	printf "${FMT_N}"	"N entries"	" "	${N_ENTRIES}
	printf "${FMT_F}"	"Period"	"sec"	${N_SECONDS}
	printf "${FMT_F}"	"Period"	"min"	${N_MINUTES}

	AVG_MEMFREE=$(sadf -p -- -r "$FILE" | grep "kbmemfree" | cut -f6 | awk_avg "/1024")
	AVG_MEMUSED=$(sadf -p -- -r "$FILE" | grep "kbmemused" | cut -f6 | awk_avg "/1024")
	AVG_BUFFERS=$(sadf -p -- -r "$FILE" | grep "kbbuffers" | cut -f6 | awk_avg "/1024")
	AVG_MEMCOMMIT=$(sadf -p -- -r "$FILE" | grep "kbcommit" | cut -f6 | awk_avg "/1024")
	MEMTOT=$(echo "${AVG_MEMUSED} + ${AVG_MEMFREE} + ${AVG_BUFFERS}" | bc)

	printf "\n"
	printf "${FMT_HEAD}"	"HW"			"$(basename ${FILE%.sar})"
	printf "${FMT_N}"	"N CPUs"	" "	${N_CPUS}
	printf "${FMT_F}"	"Clock per CPU"	"MHz"	${AVG_MHZ}
	printf "${FMT_F}"	"Clock all CPUs" "MHz"	${TOT_MHZ}
	printf "${FMT_F}"	"Memory"	"MB"	${MEMTOT}

	printf "\n"
	printf "${FMT_HEAD}"	"AVERAGE" 			"$(basename ${FILE%.sar})"
	stats awk_avg

	printf "\n"
	printf "${FMT_HEAD}"	"MAX" 			"$(basename ${FILE%.sar})"
	stats awk_max

	printf "\n"

}

# ============================================================
# 	MAIN
# ============================================================

DO_SUMMARY=false
DO_PERCENTILES=false
DO_DISK=false
DO_GRAPH=false
FILE=

for ARG in "$@"; do
	if test x"${ARG}" = x"-s"; then
		DO_SUMMARY=true
	elif test x"${ARG}" = x"-p"; then
		DO_PERCENTILES=true
	elif test x"${ARG}" = x"-d"; then
		DO_DISK=true
	elif test x"${ARG}" = x"-g"; then
		DO_GRAPH=true
	elif test -n "$FILE"; then
		err_usage "No more than one <filename> can be specificed"
	else
		FILE="$ARG"
	fi
done

if test -z "$FILE"; then
	err_usage "Please specify exactly one <filename>"
fi

FBASE="$(basename ${FILE%.sar})"

# SUMMARY is default
${DO_PERCENTILES} || ${DO_DISK} || ${DO_GRAPH} || DO_SUMMARY=true

# CPU info used by many
CPUS=$(sadf -p -P ALL -- -m CPU "$FILE" | awk_cpus)
read DUMMY N_CPUS TOT_MHZ AVG_MHZ  <<-EOF
	${CPUS}
EOF

${DO_PERCENTILES}	&& do_percentiles
${DO_DISK}		&& do_disk
${DO_GRAPH}		&& do_graph
${DO_SUMMARY}		&& do_summary


