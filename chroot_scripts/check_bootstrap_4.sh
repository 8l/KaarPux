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

kx_step_echo "Checking ToolChain"

cd /tmp
TEST_DIR="tool_chain_check_4"
rm -rf "${TEST_DIR}"
mkdir "${TEST_DIR}"
cd "${TEST_DIR}"
echo 'main(){}' > dummy.c
cc dummy.c -v -Wl,--verbose > dummy.log 2>&1 || { cat dummy.log; kx_error_exit "Compilation failed"; }

echo ""
echo "--- --- CHECK 1"
readelf -l a.out | grep "Requesting program interpreter" > check1.txt || kx_error_exit "No program interpreter"
cat check1.txt
grep -E "Requesting program interpreter: /lib(64)?/" check1.txt || kx_error_exit "Wrong program interpreter"

echo ""
echo "--- --- CHECK 2"
grep -o '/usr/lib.*/crt[1in].*succeeded' dummy.log > check2.txt || kx_error_exit "No startfiles"

echo ""
echo "----------------------------------------"
cat check2.txt
echo "----------------------------------------"
sed -i 's/\.\.\/lib64\///' check2.txt
cat check2.txt
echo "----------------------------------------"
echo ""

diff check2.txt - <<EOF2 || kx_error_exit "Wrong startfiles"
/usr/lib/crt1.o succeeded
/usr/lib/crti.o succeeded
/usr/lib/crtn.o succeeded
EOF2

echo ""
echo "--- --- CHECK 3"
grep -B1 '^ /usr/include' dummy.log > check3.txt  || kx_error_exit "No headerfiles"
cat check3.txt
diff check3.txt - <<EOF3 || kx_error_exit "Wrong headerfiles"
#include <...> search starts here:
 /usr/include
EOF3

echo ""
echo "--- --- CHECK 4"
echo "TODO"
#grep 'SEARCH.*/lib' dummy.log > check4.txt || kx_error_exit "No search path"
#sed -i 's|; |\n|g' check4.txt
#cat check4.txt
#diff check4.txt - <<EOF4 || kx_error_exit "Wrong search path"
#SEARCH_DIR("/tools/i686-pc-linux-gnu/lib")
#SEARCH_DIR("/lib");
#EOF4

echo ""
echo "--- --- CHECK 5"
grep "/lib.*/libc.so.6 " dummy.log  > check5.txt || kx_error_exit "No libc"
cat check5.txt
grep "^attempt to open /lib/libc.so.6 succeeded$" check5.txt || kx_error_exit "Wrong libc"

echo ""
echo "--- --- CHECK 6"
grep found dummy.log > check6.txt || kx_error_exit "No Dynamic linker"
cat check6.txt
grep -E "^found ld-linux(-x86-64)?.so.2 at /lib/ld-linux(-x86-64)?.so.2$" check6.txt || kx_error_exit "Wrong Dynamic linker"

echo ""
kx_echo "OK"

