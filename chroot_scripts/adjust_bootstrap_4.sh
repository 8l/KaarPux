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

kx_step_echo "Adjusting ToolChain"

mv -v /tools/bin/ld /tools/bin/ld-old
mv -v /tools/$(gcc -dumpmachine)/bin/ld /tools/$(gcc -dumpmachine)/bin/ld-old
mv -v /tools/bin/ld-new /tools/bin/ld
ln -sv /tools/bin/ld /tools/$(gcc -dumpmachine)/bin/ld

SPECS=`dirname $(gcc -print-libgcc-file-name)`/specs

gcc -dumpspecs | sed -e 's@/tools@@g' \
    -e '/\*startfile_prefix_spec:/{n;s@.*@/usr/lib/ @}' \
    -e '/\*cpp:/{n;s@$@ -isystem /usr/include@}' > "${SPECS}" 

kx_echo "--- --- New specs file is [${SPECS}]"
