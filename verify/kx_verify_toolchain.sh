#!/bin/sh
#
# KaarPux: http://kaarpux.kaarposoft.dk
#
# Copyright (C) 2013: Henrik Kaare Poulsen
#
# License: http://kaarpux.kaarposoft.dk/license.html
#

#
# Verify that the toolchain is working
#


set -o nounset
set -o errexit

test $(id -u) -ne 0 || { echo "Script [$0] must NOT be run as root"; exit 1; }

exec_one () {
	echo ""
	echo ">>> Executing [" "$@" "]"
	if "$@"; then
	echo ""
	echo "OK [" "$@" "] completed successfully"
	else
	RC=$?
	echo ""
	echo "*** WHOOPS [" "$@" "] FAILED ***"
	exit $RC
	fi
}

cd $(dirname "$0")/verify_toolchain
exec_one autoreconf --install
exec_one ./configure
exec_one make clean
exec_one make
RUNTESTFLAGS="$@"; export RUNTESTFLAGS
exec_one make check

