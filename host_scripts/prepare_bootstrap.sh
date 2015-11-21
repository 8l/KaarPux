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
. "${KX_BASE}/shinc/common_functions.shinc"
. "${KX_BASE}/shinc/definitions.shinc"
kx_ensure_runas_root

# ============================================================
kx_log KX_PKG_INFO "Making tools link"

rm -f "${KX_TOOLS}"
T="${KX_MNT}/tools"
mkdir -pv "${T}"
rm -rf "${T}/*"

ln -sv "${T}" "${KX_TOOLS}"

chown kaarpux: "${T}"

