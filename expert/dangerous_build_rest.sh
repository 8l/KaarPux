#!/bin/sh
#
# KaarPux: http://kaarpux.kaarposoft.dk
#
# Copyright (C) 2013-2014: Henrik Kaare Poulsen
#
# License: http://kaarpux.kaarposoft.dk/license.html
#

set -o nounset
set -o errexit

if test "${1:-unset}" = "RECURSIVE_SH"; then
	shift
else

	test $(id -u) -eq 0 || { echo "*** *** This script must be run as root" >&2; exit 1; }

	if test -t 0 -a x"${1:-}" != x"--yes"; then

		cat <<EOF

------------------------------------------------------------
This script will build the linux and opt phases of KaarPux system.
It *WILL* mess with your system directories.
The script is intended to be run inside a virtual machine.
You are advised to read through the script before executing.
Also modify settings in the top of the script as appropriate.
------------------------------------------------------------
EOF

		systemd-detect-virt --quiet --vm || { echo "*** You are NOT running in a virtual machine"; }

		read -r -p "Are you REALLY sure you want to continue? " DOIT
		case $DOIT in
			[yY][eE][sS]|[yY]) 
				;;
			*)
				echo "Aborting...."
				exit
			;;
		esac
		echo ""

	fi
	test x"${1:-}" = x"--yes" && shift

	"time" --verbose "$0" "RECURSIVE_SH" "$@"

	exit

fi


# ============================================================

# Device containing downloads
DDEV=/dev/vdb

# Where are we?
HERE=$(pwd)

# ============================================================

build_linux () {
	local PHASE=$1
	echo ------------------------------------------------------------
	echo "Build linux ${PHASE}"
	mount -t tmpfs -o size=32G tmpfs /home/kaarpux/kaarpux/linux/build/linux
	chown kaarpux:kaarpux /home/kaarpux/kaarpux/linux/build/linux
	cd /home/kaarpux/kaarpux/
	linux/scripts/complete_linux_${PHASE}.sh
	df -h >> /home/kaarpux/kaarpux/build.log
	uptime >> /home/kaarpux/kaarpux/build.log
	umount /home/kaarpux/kaarpux/linux/build/linux
	echo "done"
}

# ============================================================

build_opt () {
	local PHASE=$1
	echo ------------------------------------------------------------
	echo "Build opt ${PHASE}"
	mount -t tmpfs -o size=48G tmpfs /home/kaarpux/kaarpux/linux/build/opt
	chown kaarpux:kaarpux /home/kaarpux/kaarpux/linux/build/opt
	cd /home/kaarpux/kaarpux/
	su -l kaarpux <<EOF
set -o nounset
set -o errexit
cd /home/kaarpux/kaarpux/
linux/scripts/complete_opt_${PHASE}.sh
EOF
	df -h >> /home/kaarpux/kaarpux/build.log
	uptime >> /home/kaarpux/kaarpux/build.log
	umount /home/kaarpux/kaarpux/linux/build/opt
	echo "done"
}


# ============================================================

echo ------------------------------------------------------------
echo "Improved scheduling; errors are not fatal"

MULT=10
sysctl -w kernel.sched_min_granularity_ns=$(( MULT * 3000000)) || true
sysctl -w kernel.sched_latency_ns=$(( MULT * 24000000)) || true
sysctl -w kernel.sched_wakeup_granularity_ns=$(( MULT * 4000000)) || true
sysctl -w kernel.sched_migration_cost_ns=$(( MULT * 500000)) || true
sysctl -w kernel.sched_shares_window_ns=$(( MULT * 10000000)) || true
sysctl -w kernel.sched_child_runs_first=0 || true
sysctl -w kernel.sched_autogroup_enabled=0 || true

# batch scheduling
chrt -a -b -p 0 $$ || true

for F in $(ls /sys/block/sd*/queue/scheduler /sys/block/vd*/queue/scheduler 2>/dev/null); do
	echo $F
	echo deadline > $F || true
done

# do not let systemd intercept coredumps if we run with testing
T="$(
. /home/kaarpux/kaarpux/kaarpux.conf
echo ${KX_DISABLE_TEST:-}
)"
test -n "$T" || echo "core.%p" > /proc/sys/kernel/core_pattern

# ============================================================

echo ------------------------------------------------------------
echo "Changing ownership of log files"
touch /home/kaarpux/kaarpux/build.log && chown kaarpux:kaarpux /home/kaarpux/kaarpux/build.log


# ============================================================

echo ------------------------------------------------------------
echo "Downloading All Packages"
fsck -a ${DDEV}
mount ${DDEV} /home/kaarpux/kaarpux/downloads
echo deadline > /sys/block/${DDEV#/dev/}/queue/scheduler

echo
echo I $(date +%F_%T) KX_DLD_STRT Downloading and verifying all packages
su  kaarpux <<EOF
/home/kaarpux/kaarpux/linux/download_packages_2.sh > /home/kaarpux/kaarpux/linux/log/download.log 2>&1
EOF
echo I $(date +%F_%T) KX_DLD_DONE All packages downloaded and verified
echo

# ============================================================

build_linux base
build_linux xorg


# ============================================================

# Dummy X11 server for testing packages

export DISPLAY=:42
T=$(mktemp -d)
chown kaarpux:kaarpux $T
su kaarpux <<EOF
mkfifo $T/fifo
cat > ~/.xinitrc <<EOF2
dbus-launch --sh-syntax --exit-with-session > $T/fifo
exec xterm
EOF2
(xinit -- /bin/Xvfb :42 -screen 0 1680x1024x24 2>&1 | logger --tag Xvfb42 )&
echo \$! > $T/pid
EOF
# dbus-launch writes export commands to stdout, ie. the fifo
. $T/fifo


# ============================================================

build_linux gnome_pre
build_linux gnome
build_linux gnome_post


# ============================================================

build_opt desktop
build_opt libreoffice
build_opt programming
build_opt coins
build_opt closed_source

# ============================================================

# http://stackoverflow.com/a/3211182
killtree() {
	local _pid=$1
	local _sig=${2:--TERM}
	kill -stop ${_pid} # needed to stop quickly forking parent from producing children between child killing and parent killing
	for _child in $(ps -o pid --no-headers --ppid ${_pid}); do
		killtree ${_child} ${_sig}
	done
	kill -${_sig} ${_pid}
}

killtree $(cat $T/pid) KILL
rm -r $T

echo ------------------------------------------------------------
echo "We are done"
echo ""


