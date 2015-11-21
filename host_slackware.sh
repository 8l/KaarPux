#!/bin/sh
#
# KaarPux: http://kaarpux.kaarposoft.dk
#
# Copyright (C) 2014: Henrik Kaare Poulsen
#
# License: http://kaarpux.kaarposoft.dk/license.html
#

# ============================================================
# Install required packages for an Slackware host
# ============================================================

set -o nounset
set -o errexit


if test $(id -u) -ne 0; then
	echo "Script [$0] must be run as root"
	exit 1
fi

echo yes | cpan install YAML::Tiny

cd /tmp
wget ftp://ftp.gnu.org/gnu/parallel/parallel-20140422.tar.bz2
tar xf parallel-20140422.tar.bz2
cd parallel-20140422
./configure
make
make install
