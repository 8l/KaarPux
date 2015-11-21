#!/bin/sh
#
# KaarPux: http://kaarpux.kaarposoft.dk
#
# Copyright (C) 2015: Henrik Kaare Poulsen
#
# License: http://kaarpux.kaarposoft.dk/license.html
#

set -o nounset
set -o errexit

KX_BASE="$(cd $(dirname "$0")/..; pwd -P)"
. "${KX_BASE}/shinc/bootstrap.shinc"
kx_ensure_chroot

SRC="${KX_BASE}/../master/files/etc/pam.d"
DST="/etc/pam.d"
mv "${DST}" "${DST}.ORIG"
mkdir -pv "${DST}"

for F in system-auth login passwd su sudo other; do
cp "${SRC}/$F" "${DST}"
  install -v -m644 "${SRC}/$F" "${DST}/$F"
done

for PROGRAM in chfn chgpasswd chpasswd chsh groupadd groupdel \
             groupmems groupmod newusers useradd userdel usermod
do
  install -v -m644 "${SRC}/chage" "${DST}/$PROGRAM"
done

