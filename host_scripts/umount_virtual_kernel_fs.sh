#!/bin/sh
#
# KaarPux: http://kaarpux.kaarposoft.dk
#
# Copyright (C) 2012: Henrik Kaare Poulsen
#
# License: http://kaarpux.kaarposoft.dk/license.html
#

set -o nounset

KX_BASE="$(cd $(dirname "$0")/..; pwd -P)"
. "${KX_BASE}/shinc/common_functions.shinc"
. "${KX_BASE}/shinc/definitions.shinc"
kx_ensure_runas_root


kx_step_echo "un-mounting"
umount ${KX_MNT}/dev/pts
umount ${KX_MNT}/dev
umount ${KX_MNT}/proc
umount ${KX_MNT}/sys
umount ${KX_MNT}/run

