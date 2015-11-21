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

chroot "${KX_MNT}" \
	"${KX_TOOLS}/bin/env" -i \
	HOME="/root" TERM="${TERM:-no}" PS1='tools# ' \
	PATH="/bin:/usr/bin:/sbin:/usr/sbin:${KX_TOOLS}/bin" \
	sh -l
