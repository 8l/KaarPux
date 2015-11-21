#!/bin/sh
#
# KaarPux: http://kaarpux.kaarposoft.dk
#
# Copyright (C) 2012: Henrik Kaare Poulsen
#
# License: http://kaarpux.kaarposoft.dk/license.html
#

# ============================================================
# Make a .tar.gz distribution file
# ============================================================

set -o nounset
set -o errexit

KX_BASE="$(cd $(dirname "$0"); pwd -P)"
. "${KX_BASE}/shinc/common_functions.shinc"
kx_ensure_runas_nonroot

cd "${KX_BASE}"

kx_git_describe || { kx_error_echo "We do not seem to be in a git repo"; exit 1; }

mkdir -pv "${KX_BASE}/../dist"
cd "${KX_BASE}/../dist"
tar -cz -f kaarpux.tar.gz -C "${KX_BASE}/../" master current_version.txt

