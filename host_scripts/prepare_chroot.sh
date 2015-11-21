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
. "${KX_BASE}/shinc/common_functions.shinc"
. "${KX_BASE}/shinc/definitions.shinc"
kx_ensure_runas_root

kx_step_echo "Creating dev, proc, sys File Systems"
mkdir -pv ${KX_MNT}/dev
mkdir -pv ${KX_MNT}/proc
mkdir -pv ${KX_MNT}/sys
mkdir -pv ${KX_MNT}/run
mkdir -pv ${KX_MNT}/run/shm

kx_step_echo "Creating Initial Device Nodes"
test -c "${KX_MNT}/dev/console" || mknod -m 600 "${KX_MNT}/dev/console" c 5 1
test -c "${KX_MNT}/dev/null" || mknod -m 666 "${KX_MNT}/dev/null" c 1 3
test -d "${KX_MNT}/dev/pts" || mkdir -pv ${KX_MNT}/dev/pts

kx_step_echo "Copying and adjusting passwd, group, nsswitch.conf, ld.so.conf"
mkdir -pv "${KX_MNT}/etc"
cp "${KX_BASE}/../master/files/etc/passwd" "${KX_MNT}/etc/passwd"
cp "${KX_BASE}/../master/files/etc/group" "${KX_MNT}/etc/group"

cp "${KX_BASE}/../master/files/etc/nsswitch.conf" "${KX_MNT}/etc/nsswitch.conf"
cp "${KX_BASE}/../master/files/etc/ld.so.conf" "${KX_MNT}/etc/ld.so.conf"

kx_step_echo "Linking DASH"
mkdir -pv "${KX_MNT}/bin"
ln -svf "${KX_TOOLS}/bin/dash" "${KX_MNT}/bin/dash"
ln -svf "${KX_TOOLS}/bin/dash" "${KX_MNT}/bin/sh"

kx_step_echo "Linking BASH"
ln -svf "${KX_TOOLS}/bin/bash" "${KX_MNT}/bin/bash"

