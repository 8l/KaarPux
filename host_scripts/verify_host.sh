#!/bin/sh
#
# KaarPux: http://kaarpux.kaarposoft.dk
#
# Copyright (C) 2012: Henrik Kaare Poulsen
#
# License: http://kaarpux.kaarposoft.dk/license.html
#

set -o errexit
set -o nounset

verify_awk () {
	# Must have GNU version of gawk
	_AWK_TITLE=`awk -W version 2>&1 | head -1`
	_AWK_VERSION=`echo ${_AWK_TITLE} | cut -d " " -f 1`
	if test x"${_AWK_VERSION}" != xGNU; then
	echo "*** *** Building glibc requres the GNU version of awk: gawk"
	echo "*** *** Looks like you have [${_AWK_TITLE}] instead"
	return false
	fi
	echo "awk OK"
}

# TODO: Verify other build tools: autoconf, gcc, ....

verify_awk

