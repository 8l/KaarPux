#!/bin/sh
#
# KaarPux: http://kaarpux.kaarposoft.dk
#
# Copyright (C) 2014: Henrik Kaare Poulsen
#
# License: http://kaarpux.kaarposoft.dk/license.html
#

set -o nounset
set -o errexit

# ============================================================

if test "$#" -ne 0; then
cat <<EOF

List names of KaarPux packages which do not seem to be used.

First find the packages which are not used at build time.
Then filter this list to show packages which have not been used since
KaarPux was build.

WARNING:
(1) Just because a package has not been used since KaarPux was build,
    it does not mean that it might not be needed in the future.
(2) Packages which where not used during build might be needed
    for testing.
(3) If the systemtap script collecting build time dependencies is not
    reliable, a package may be listed as unused even if it WAS 
    actually used.
(4) If the build.log file has been tampered with, we get the wrong
    impression of when KaarPux was build.
(5) If filesystems are mounted with 'noatime' all bets are off.
(6) If filesystems are mounted with 'relatime', run the script at least
    24 hours after building KaarPux

SO: USE WITH CARE!

EOF
exit 1
fi

# ============================================================

# Where are we
KX_BASE="$(cd $(dirname "$0")/../..; pwd -P)"

# Work in temporary directory
T=$(mktemp -d -t unused_packages.XXXXXX)
cd $T

# When was KaarPux build?
B=$(stat --dereference --format="%Y" ${KX_BASE}/build.log)

# ============================================================

# Check whether any file installed by package has been accessed
check_one () {
	PKG=$1
	for F in $({ grep "${PKG}\$" ${KX_BASE}/dependencies/installed_files.txt || true; } | cut -f1); do
		test -e $F || continue
		S=$(stat --dereference --format="%X $B -p" $F | dc)
		test $S -gt 0 && return 0
	done
	echo $PKG
}

# ============================================================

# All packages (which depends on something)
cut -f1 < ${KX_BASE}/dependencies/build_depends.txt | sort | uniq > x1.txt

# All packages on which something depends
cut -f2 < ${KX_BASE}/dependencies/build_depends.txt | sort | uniq > x2.txt

# All packages on which nothing depends
diff x1.txt x2.txt | grep "^<" | cut -f2- -d ' ' > x3.txt

# x3.txt is now the list of packges on which nothing depends on BUILD time

# Of those packages, list package if no files have been accessed
for F in $(cat x3.txt); do
	check_one $F
done

# Clean up
cd ..
rm -rf $T
