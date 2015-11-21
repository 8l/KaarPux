#!/bin/sh
#
# KaarPux: http://kaarpux.kaarposoft.dk
#
# Copyright (C) 2012: Henrik Kaare Poulsen
#
# License: http://kaarpux.kaarposoft.dk/license.html
#

set -o nounset
set -o errexit

KX_BASE="$(cd $(dirname "$0")/..; pwd -P)"
. "${KX_BASE}/shinc/common_functions.shinc"
. "${KX_BASE}/shinc/definitions.shinc"
kx_ensure_runas_root

kx_step_echo "Trying to unmount (to be reentrant)"

umount ${KX_MNT}/dev/pts 2>/dev/null || true
umount ${KX_MNT}/dev 2>/dev/null || true
umount ${KX_MNT}/proc 2>/dev/null || true
umount ${KX_MNT}/sys 2>/dev/null || true
umount ${KX_MNT}/run 2>/dev/null || true
echo "Done"

kx_step_echo "Mounting host /dev"
mount -v --bind /dev ${KX_MNT}/dev

kx_step_echo "Mounting Virtual Kernel File Systems"
mount -vt tmpfs -o size=4194304 tmpfs ${KX_MNT}/run
mount -vt devpts devpts ${KX_MNT}/dev/pts
mount -vt proc proc ${KX_MNT}/proc
mount -vt sysfs sysfs ${KX_MNT}/sys

