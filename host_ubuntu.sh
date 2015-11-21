#!/bin/sh
#
# KaarPux: http://kaarpux.kaarposoft.dk
#
# Copyright (C) 2014: Henrik Kaare Poulsen
#
# License: http://kaarpux.kaarposoft.dk/license.html
#

# ============================================================
# Install required packages for an Ubuntu host
# ============================================================

set -o nounset
set -o errexit


if test $(id -u) -ne 0; then
	echo "Script [$0] must be run as root"
	exit 1
fi


apt-get update

apt-get --yes install libyaml-tiny-perl
apt-get --yes install xz-utils
apt-get --yes install autotools-dev
apt-get --yes install autoconf
apt-get --yes install build-essential
apt-get --yes install bison
apt-get --yes install gawk
apt-get --yes install gettext
apt-get --yes install texinfo
apt-get --yes install time
apt-get --yes install sysstat
apt-get --yes install openssh-server
apt-get --yes install parallel

