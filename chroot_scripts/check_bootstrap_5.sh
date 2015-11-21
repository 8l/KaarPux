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
. "${KX_BASE}/shinc/bootstrap.shinc"
. "${KX_BASE}/shinc/packages.shinc"
kx_ensure_chroot

kx_error_exit () {
	echo "*** *** $1"
	exit 1
	}

kx_step_echo "Checking ToolChain"

cd /tmp
TEST_DIR="tool_chain_check_5"
rm -rf "${TEST_DIR}"
mkdir "${TEST_DIR}"
cd "${TEST_DIR}"
echo 'main(){}' > dummy.c
cc dummy.c -v -Wl,--verbose > dummy.log 2>&1 || { cat dummy.log; kx_error_exit "Compilation failed"; }

echo "OK"

kx_step_echo "Checking Requesting program interpreter"

readelf -l a.out | grep "Requesting program interpreter" > check1.txt || kx_error_exit "No program interpreter"
cat check1.txt
grep -E "Requesting program interpreter: /lib(64)?/ld-linux" check1.txt || kx_error_exit "Wrong program interpreter"

echo "OK"

kx_step_echo "Checking crt startfiles"

for c in crt1.o crti.o crtn.o; do
	if grep -q "^attempt to open /lib.*/$c succeeded$" dummy.log; then
		echo "$c OK"
	else
		kx_error_exit "$c not found"
	fi
done

kx_step_echo "Checking header files"

grep -B3 -A1 '^ /include$' dummy.log > check3.txt  || kx_error_exit "No headerfiles"

echo "----------------------------------------"
cat check3.txt
echo "----------------------------------------"
sed -i 's:gcc/[0-9a-z_-]\+/[0-9.]\+/:gcc/T/V/:' check3.txt
cat check3.txt
echo "----------------------------------------"
echo ""

diff -b -w check3.txt - <<EOF3 || kx_error_exit "Wrong headerfiles"
#include <...> search starts here:
 /lib/gcc/T/V/include
 /usr/local/include
 /include
 /lib/gcc/T/V/include-fixed
EOF3

echo "OK"

kx_step_echo "Checking search path"

grep 'SEARCH.*/lib' dummy.log > check4.txt|| kx_error_exit "No search path"
sed -i 's|; |\n|g' check4.txt

echo "----------------------------------------"
cat check4.txt
echo "----------------------------------------"
sed -i '/lib64/d' check4.txt
sed -i 's:"/[0-9a-z_-]\+-linux-[0-9a-z_-]\+/lib:"/T:' check4.txt
cat check4.txt
echo "----------------------------------------"
echo ""

diff -b check4.txt - <<EOF4 || kx_error_exit "Wrong search path"
SEARCH_DIR("/T")
SEARCH_DIR("/usr/local/lib")
SEARCH_DIR("/lib")
SEARCH_DIR("/usr/lib");
EOF4

echo "OK"

kx_step_echo "Checking for libc"

grep "/lib.*/libc.so.6 " dummy.log  > check5.txt || kx_error_exit "No libc"
cat check5.txt
grep -q "^attempt to open /lib/libc.so.6 succeeded$" check5.txt || kx_error_exit "Wrong libc"

echo "OK"

kx_step_echo "Checking for dynamic linker"

grep "found" dummy.log > check6.txt || kx_error_exit "No Dynamic linker"
cat check6.txt
grep -Eq '^found ld-linux-?[a-z0-9]*-?[a-z0-9]*.so.2 at /lib/ld-linux-?[a-z0-9]*-?[a-z0-9]*.so.2$' check6.txt || kx_error_exit "Wrong Dynamic linker"

echo "OK"
echo ""

kx_echo "SUCCESS"

