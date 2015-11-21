#!/bin/sh
#
# KaarPux: http://kaarpux.kaarposoft.dk
#
# Copyright (C) 2014: Henrik Kaare Poulsen
#
# License: http://kaarpux.kaarposoft.dk/license.html
#

# ============================================================
# SHOW PACKAGES SORTED BY THE DATE THEY HAVE BEEN UPDATED
# ============================================================

set -o nounset
set -o errexit

KX_BASE="$(cd $(dirname "$0")/../..; pwd -P)"

{
cd ${KX_BASE}/master/packages
for F in ?/*.yaml; do
	git log --grep="UPD:" --format="tformat:%at%x09%ai%x09$F" $F | head -1
	git log --format="tformat:%at%x09%ai%x09$F" $F | tail -1
done;
} | uniq -f4 | sort -n | cut -f2-
