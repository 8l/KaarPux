#!/bin/sh
#
# KaarPux: http://kaarpux.kaarposoft.dk
#
# Copyright (C) 2014, 2015: Henrik Kaare Poulsen
#
# License: http://kaarpux.kaarposoft.dk/license.html
#

# ============================================================
# Process Common Vulnerabilities and Exposures
# ============================================================

set -o nounset
set -o errexit

KX_MASTER="$(cd $(dirname "$0")/..; pwd -P)"

YEARS="2014 2015"
TMPDIR="/run/user/$(id -u)/cve"
CVELIST="${KX_MASTER}/cve_list.txt"
PKGDIR="${KX_MASTER}/packages/"

# ============================================================
wget_dialog () {
	echo 0 > $TMPDIR/wget_rc.txt
	{ wget --no-check-certificate --timestamping --directory-prefix=$TMPDIR $1$2 2>&1 || echo $? > $TMPDIR/wget_rc.txt; } | \
	dialog --backtitle "Common Vulnerabilities and Exposures" --title "Downloading $2" --progressbox 20 80
RC=$(cat $TMPDIR/wget_rc.txt)
	test $RC = 0 || {
		echo
		echo
		echo "*** DOWNLOAD ERROR $RC"
		echo
		exit $RC
	}

}


# ============================================================
wget_files () {
	for YEAR in $YEARS; do
		wget_dialog https://cve.mitre.org/data/downloads/ allitems-cvrf-year-$YEAR.xml
	done
	wget_dialog http://nvd.nist.gov/download/ nvd-rss-analyzed.xml
}

# ============================================================
create_xslt_year () {
	cat > $TMPDIR/year.xslt <<EOF
<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet
	version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:v="http://www.icasi.org/CVRF/schema/vuln/1.1"
	xmlns="http://www.icasi.org/CVRF/schema/cvrf/1.1">

	<xsl:output method="text"/>

	<xsl:template match="text()" />

	<xsl:template match="v:Vulnerability">
		<xsl:value-of select="v:Title" />
		<xsl:text>&#x9;</xsl:text>
		<xsl:value-of select="translate(v:Notes/v:Note[@Type='Description'],'&#xA;',' ')" />
		<xsl:text>&#xa;</xsl:text>
	</xsl:template>

</xsl:stylesheet>
EOF
}

# ============================================================
create_xslt_rss () {
	cat > $TMPDIR/rss.xslt <<EOF
<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet
	version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:p="http://purl.org/rss/1.0/"
	xmlns="http://purl.org/rss/1.0/">

	<xsl:output method="text"/>

	<xsl:template match="text()" />

	<xsl:template match="p:item">
		<xsl:value-of select="p:title" />
		<xsl:text>&#x9;</xsl:text>
		<xsl:value-of select="translate(p:description,'&#xA;',' ')" />
		<xsl:text>&#xa;</xsl:text>
	</xsl:template>

</xsl:stylesheet>
EOF
}

# ============================================================
create_grep_patterns () {
	cat > $TMPDIR/grep.txt <<EOF
	\*\* RESERVED \*\*
	\*\* REJECT \*\*
EOF
sed -e s':^\(CVE[0-9\-]\+\)\t.*:\1\t:' < $CVELIST >> $TMPDIR/grep.txt
}

# ============================================================
create_packages () {
	PACKAGES=$(
		cd $PKGDIR; \
		find -name "*.yaml" -exec echo "{}" . \; |\
		cut -c3- | sort )
}

# ============================================================
kx_comment () {
	dialog --backtitle "$1" --title "$3" --inputbox "Comment" 0 0 "$4" 2> $TMPDIR/comment.txt
	echo "$1\t$4\t$3\t$(cat $TMPDIR/comment.txt)" >> $CVELIST
}

# ============================================================
kx_commit () {
	GIT=$(
		cd $PKGDIR; \
		git log --format="%H %f" $2
	)
	dialog --backtitle "$1" --menu "Select Commit" 0 0 0 $GIT 2> $TMPDIR/git.txt || RC=$?
	case $RC in
		0)
			TXT="COMMIT $(cat $TMPDIR/git.txt)"
			;;
 		1|255)
			TXT=""
			;;
		*)
			echo
			echo
			echo "*** ERROR $RC"
			echo
			exit $RC
			;;
	esac

	dialog --backtitle "$1" --title "$3" --inputbox "Comment" 0 0 "$TXT" 2> $TMPDIR/comment.txt
	echo "$1\t$4\t$3\t$(cat $TMPDIR/comment.txt)" >> $CVELIST
}

# ============================================================
process_kaarpux_package () {
	dialog --backtitle "$1" --title "$2" --exit-label "OK" --textbox $PKGDIR/$2 0 0
	PKG=$(basename -s .yaml $2)
	dialog --backtitle "$1" --title "$PKG" --menu "Status" 0 0 0 \
		"n/a"	"Not applicable" \
		"open"	"Open" \
		"fixed"	"Fixed" \
		2> $TMPDIR/status.txt
	STATUS=$(cat $TMPDIR/status.txt)
	case $STATUS in
		n/a)
			kx_comment "$1" "$2" "$PKG" "$STATUS"
			;;
		open)
			kx_comment "$1" "$2" "$PKG" "$STATUS"
			;;
		fixed)
			kx_commit "$1" "$2" "$PKG" "$STATUS"
			;;
	esac
}

# ============================================================
process_kaarpux () {
	RC=0
	touch $TMPDIR/pkg.txt
	dialog --backtitle "$1" --menu "Select package" 0 0 0 $PACKAGES 2> $TMPDIR/pkg.txt || RC=$?
	PKG=$(cat $TMPDIR/pkg.txt)
	case $RC in
		0)
			process_kaarpux_package "$1" "$PKG"
			;;
		1)
			# CANCEL => skip package
			return
			;;
		*)
			echo
			echo
			echo "*** ERROR $RC"
			echo
			exit $RC
			;;
	esac
}

# ============================================================
process_one () {
	RC=0
	dialog --backtitle "$1" --title "$1" \
		--yes-label "Ignore" --no-label "KaarPux" \
		--yesno "$2" 0 0 \
		|| RC=$?
	case $RC in
		0)	echo "$1\tignore" >> $CVELIST
			;;
		1)
			process_kaarpux "$1"
			;;
		*)
			echo
			echo
			echo "*** ERROR $RC"
			echo
			exit $RC
			;;
	esac
}

# ============================================================
process_all () {
	while read LINE; do
		T=$(printf "%s" "$LINE" | cut -f1)
		D=$(printf "%s" "$LINE" | cut -f2-)
		process_one "$T" "$D"
	done
}

# ============================================================
process () {
	xsltproc $1 $2 | \
	sed -e s':^\(CVE[0-9\-]\+\) \((.*)\)\t:\1\t\2 :' | \
	grep -v -f $TMPDIR/grep.txt | \
	process_all
}

# ============================================================
sort_list () {
	cp $CVELIST $TMPDIR/cve_list.txt
	sort $TMPDIR/cve_list.txt > $CVELIST
}

# ============================================================

mkdir -pv $TMPDIR
wget_files
create_xslt_year
create_xslt_rss
dialog --backtitle "Common Vulnerabilities and Exposures" --title "Processing" --infobox "Processing CVEs ..." 5 40
create_grep_patterns
create_packages
for YEAR in $YEARS; do
	process $TMPDIR/year.xslt $TMPDIR/allitems-cvrf-year-$YEAR.xml
done
process $TMPDIR/rss.xslt $TMPDIR/nvd-rss-analyzed.xml
sort_list
