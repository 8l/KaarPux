#!/bin/sh
#
# KaarPux: http://kaarpux.kaarposoft.dk
#
# Copyright (C) 2015: Henrik Kaare Poulsen
#
# License: http://kaarpux.kaarposoft.dk/license.html
#

set -o nounset
set -o errexit

cp -v /etc/skel/.bashrc /etc/skel/.bash_profile /home/kaarpux
chown kaarpux:kaarpux /home/kaarpux/.bashrc /home/kaarpux/.bash_profile
