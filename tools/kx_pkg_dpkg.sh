#!/bin/sh
#
# KaarPux: http://kaarpux.kaarposoft.dk
#
# Copyright (C) 2014: Henrik Kaare Poulsen
#
# License: http://kaarpux.kaarposoft.dk/license.html
#

# ============================================================
# replace KaarPux package names with Fedora dpkg names
# ============================================================

# List of potential package renamings created with:
#
# for x in 0 2 3 4 6 9 a b c d e f g h i j k l m n o p q r s t u v w x y z; do wget http://mirrors.telianet.dk/fedora//development/rawhide/x86_64/os/Packages/$x; done
# for x in 0 2 3 4 6 9 a b c d e f g h i j k l m n o p q r s t u v w x y z; do grep -o '".*rpm"' $x | sed s':-[0-9]\+.*$::' | cut -b2- >> pkgs.txt; done
# grep -e '- pkg:' master.yaml | sed -e s'| *- pkg: ||' -e s'|PERLMODULE_|perl-|' -e s'|HASKELLMODULE_|ghc-|' | sort | uniq > p.txt
# grep -v -x -F -f pkgs.txt p.txt > px.txt
#
# Then looked at px.txt manually to identify dpkg names

# ============================================================

sed \
-e s":PERLMODULE_:perl-:" \
-e s":HASKELLMODULE_:ghc-:" \
-e s":^ii  acpica :ii  acpica-tools :" \
-e s":^ii  apache-ant :ii  ant :" \
-e s":^ii  berkeley-db :ii  libdb :" \
-e s":^ii  dbus-python-2 :ii  dbus-python :" \
-e s":^ii  dejavu-fonts-ttf :ii  dejavu-fonts :" \
-e s":^ii  docbook-sgml :ii  docbook-dtds :" \
-e s":^ii  docbook-xsl :ii  docbook-style-xsl :" \
-e s":^ii  foomatic-db-engine. :ii  foomatic :" \
-e s":^ii  ghostscript-fonts-std :ii  ghostscript-fonts :" \
-e s":^ii  glibmm :ii  glibmm24 :" \
-e s":^ii  gnome-control-center :ii  control-center :" \
-e s":^ii  gptfdisk :ii  gdisk :" \
-e s":^ii  grub :ii  grub2 :" \
-e s":^ii  gst-plugins-bad :ii  gstreamer-plugins-bad-free :" \
-e s":^ii  gst-plugins-base :ii  gstreamer-plugins-base :" \
-e s":^ii  gst-plugins-good :ii  gstreamer-plugins-good :" \
-e s":^ii  gtkhtml :ii  gtkhtml3 :" \
-e s":^ii  gtkmm :ii  gtkmm30 :" \
-e s":^ii  iproute2 :ii  iproute :" \
-e s":^ii  linux :ii  kernel :" \
-e s":^ii  linux-pam :ii  pam :" \
-e s":^ii  MesaLib :ii  mesa :" \
-e s":^ii  python-markupsafe  :ii  python-markupsafe  :" \
-e s":^ii  pkg-config :ii  pkgconfig :" \
-e s":^ii  py2cairo :ii  pycairo :" \
-e s":^ii  pyatspi3 :ii  pyatspi :" \
-e s":^ii  pycups :ii  python-cups :" \
-e s":^ii  pycurl :ii  python-pycurl :" \
-e s":^ii  pygobject :ii  pygobject2 :" \
-e s":^ii  pygobject33 :ii  pygobject3 :" \
-e s":^ii  pygtk :ii  pygtk2 :" \
-e s":^ii  Python :ii  python3 :" \
-e s":^ii  Python2 :ii  python :" \
-e s":^ii  wxWidgets :ii  wxGTK3 :" \
-e s":^ii  shadow :ii  shadow-utils :" \
-e s":^ii  wireless_tools :ii  wireless-tools :" \
-e s":^ii  xorg-server :ii  xorg-x11-server :" \
-e s":^ii  yaml :ii  yaml-cpp :" \
-e s":^ii  gnupg :ii  gnupg2 :"
