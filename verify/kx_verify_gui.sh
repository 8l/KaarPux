#!/bin/sh
#
# KaarPux: http://kaarpux.kaarposoft.dk
#
# Copyright (C) 2013: Henrik Kaare Poulsen
#
# License: http://kaarpux.kaarposoft.dk/license.html
#

set -o nounset
set -o errexit

KX_VERIFY_GUI="$(cd $(dirname "$0")/verify_gui; pwd -P)"

if test "${1:-unset}" = "RECURSIVE_SH"; then
	shift
else
	exec "$0" "RECURSIVE_SH" "$@" 2>&1 | tee "${KX_VERIFY_GUI}/kx_verify_gui.log"
	exit
fi

echo "Compiling kx_gui_test"
cd "${KX_VERIFY_GUI}"
cc -g -Wall $(pkg-config --cflags --libs glib-2.0 gobject-2.0 atspi-2) kx_gui_test.c -o kx_gui_test
echo "kx_gui_test OK"

# Make sure applications are turning on AT-SPI
export GNOME_ACCESSIBILITY=1
export GTK_MODULES=gail:atk-bridge

echo "Testing:"
N_OK=0
N_FAIL=0
cd tests
TESTS="$@"
test -n "${TESTS}" || TESTS=$(ls *.test)
for TST in ${TESTS}; do
	T="${TST%.test}"
	printf "Testing $T ... "
	if ../kx_gui_test < $TST > $T.log 2>&1; then
		echo "OK"
		N_OK=$((N_OK + 1))
	else
		echo "FAIL"
		N_FAIL=$((N_FAIL + 1))
	fi
done
printf "OK:\t$N_OK\n"
printf "FAIL:\t$N_FAIL\n"
echo

if test $N_FAIL -gt 0; then
	echo "*** *** TEST FAILED"
	exit 1
else
	echo "TEST PASSED"
	exit 0
fi
