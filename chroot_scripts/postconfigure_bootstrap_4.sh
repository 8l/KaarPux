#!/bin/sh
#
# KaarPux: http://kaarpux.kaarposoft.dk
#
# Copyright (C) 2012-2013: Henrik Kaare Poulsen
#
# License: http://kaarpux.kaarposoft.dk/license.html
#

set -o nounset
set -o errexit

KX_BASE="$(cd $(dirname "$0")/..; pwd -P)"
. "${KX_BASE}/shinc/bootstrap.shinc"
kx_ensure_chroot
START_SECS=$(date +%s)

kx_step_echo "Installing locales"

mkdir -pv /usr/lib/locale
localedef -i cs_CZ -f UTF-8 cs_CZ.UTF-8
localedef -i de_DE -f ISO-8859-1 de_DE
localedef -i de_DE@euro -f ISO-8859-15 de_DE@euro
localedef -i de_DE -f UTF-8 de_DE.UTF-8
localedef -i en_HK -f ISO-8859-1 en_HK
localedef -i en_PH -f ISO-8859-1 en_PH
localedef -i en_US -f ISO-8859-1 en_US
localedef -i en_US -f UTF-8 en_US.UTF-8
localedef -i es_MX -f ISO-8859-1 es_MX
localedef -i fa_IR -f UTF-8 fa_IR
localedef -i fr_FR -f ISO-8859-1 fr_FR
localedef -i fr_FR@euro -f ISO-8859-15 fr_FR@euro
localedef -i fr_FR -f UTF-8 fr_FR.UTF-8
localedef -i it_IT -f ISO-8859-1 it_IT
localedef -i ja_JP -f EUC-JP ja_JP
localedef -i tr_TR -f UTF-8 tr_TR.UTF-8
localedef -i zh_CN -f GB18030 zh_CN.GB18030
${KX_LOCALEDEF}

kx_step_echo "Installing /etc/localtime"
ln -svf "/usr/share/zoneinfo/${KX_LOCALE}" /etc/localtime

