#!/bin/sh
#
# KaarPux: http://kaarpux.kaarposoft.dk
#
# Copyright (C) 2014: Henrik Kaare Poulsen
#
# License: http://kaarpux.kaarposoft.dk/license.html
#

# ============================================================
# Install required packages for a Fedora host
# ============================================================

set -o nounset
set -o errexit


if test $(id -u) -ne 0; then
	echo "Script [$0] must be run as root"
	exit 1
fi


yum makecache
yum  --assumeyes groupinstall "Development Tools"
yum  --assumeyes groupinstall "C Development Tools and Libraries"
yum  --assumeyes install patch
yum  --assumeyes install perl-YAML-Tiny
yum  --assumeyes install wget
yum  --assumeyes install openssh-server
yum  --assumeyes install sysstat
yum  --assumeyes install gnupg

# Install rawhide repository (newest packages)
yum install fedora-release-rawhide

# Install newest version of parallel
# Up to Fedora 20, the default version borked
yum  --assumeyes --enablerepo=rawhide install parallel

