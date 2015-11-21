#!/bin/sh
#
# KaarPux: http://kaarpux.kaarposoft.dk
#
# Copyright (C) 2012-2014: Henrik Kaare Poulsen
#
# License: http://kaarpux.kaarposoft.dk/license.html
#

set -o nounset
set -o errexit

KX_BASE="$(cd $(dirname "$0")/..; pwd -P)"
. "${KX_BASE}/shinc/bootstrap.shinc"
. "${KX_BASE}/shinc/uid_gid.shinc"
kx_ensure_runas_root


kx_echo "preparing temporary directory"

S="$(cd $(dirname "$0"); pwd -P)"

T=$(mktemp -d)
chown kaarpux:kaarpux "$T"


kx_echo "identifying target kernel"

# We want to run this script in chroot in bootstrap 8.
# In this case, we are running on a different kernel (the host kernel)
# than the one we are installing the systemtap module for.
# There should only be modules for one kernel version in
# /lib/modules (in the chroot): the kernel we are going to boot with.
# so we take the kernel identifier from /lib/modules/<kernel>
#
# However, if we later recompile the kernel, we want to be able
# to run the script again under the target system linux.
# In this case, we can use the kernel identifier from $(uname -r)
# if there is more than one kernel version in /lib/modules

N=$(ls -1 /lib/modules | wc -l)

case $N in
	0)	kx_error_exit "No kernel modules found in /lib/modules"
		;;
	1)	K=$(ls -1 /lib/modules/)
		;;
	*)	K=$(uname -r)
		;;
esac

kx_echo "Kernel ID: $K"


kx_echo "compiling systemtap script"

D1="-D MAXSTRINGLEN=4096"
D2="-D STP_NO_OVERLOAD=1"
D3="-D MAXTRYLOCK=16384"
D4="-D MAXACTION=16384"
D5="-D MAXMAPENTRIES=16384"
D6="-D INTERRUPTIBLE=0"
P="--privilege=stapsys"
SHE="--suppress-handler-errors"

su -l kaarpux -c "cd '$T'; stap -v -p4 $S/kx_open.stp -r $K -m kx_open $D1 $D2 $D3 $D4 $D5 $D6 $P $SHE"


kx_echo "moving systemtap script to module location"

D="/lib/modules/$K/systemtap"
test -d "$D" || mkdir "$D"
chown 0:0 "$T/kx_open.ko"
mv "$T/kx_open.ko" "$D"
rmdir "$T"


kx_echo "adding kaarpux to systemtap groups"
usermod -a -G stapusr kaarpux
usermod -a -G stapsys kaarpux
