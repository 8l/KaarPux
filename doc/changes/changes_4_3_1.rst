.. 
   KaarPux: http://kaarpux.kaarposoft.dk
   Copyright (C) 2015: Henrik Kaare Poulsen
   License: http://kaarpux.kaarposoft.dk/license.html

.. _changes_4_3_1:


================================
Changes in KaarPux version 4.3.1
================================


:program:`KaarPux` version ``4.3.1`` released on ``2014-may-26``

- Support for Laptop

- Building KaarPux under X11

- Packages added; packages updated

- Bugs fixed; minor changes


Support for Laptop
##################

- ADD: dhcpcd; prereq for NetworkManager
  (Commit `a2265be6 <http://sourceforge.net/p/kaarpux/code/ci/a2265be652d8b9c10631c22ec1e775e622851939/>`_)

- IMPROVE: linux: Support for Broadcom B43xx Wireless
  (Commit `1a2c4b6c <http://sourceforge.net/p/kaarpux/code/ci/1a2c4b6c1c8cf6c5afb4a707eb2d719534a9d0b1/>`_)

- ADD: b43-fwcutter broadcom-wl: Firmware for Broadcom B43xx Wireless
  (Commit `eb02d782 <http://sourceforge.net/p/kaarpux/code/ci/eb02d782e1b1ac15a0b1645d60776814f3b7600d/>`_)

- FIX: broadcom-wl: no signature checking
  (Commit `1d8453ea <http://sourceforge.net/p/kaarpux/code/ci/1d8453ea356c906f0c21da4449820e75db998a6f/>`_)

- ADD: wpa_supplicant: support for WPA and WPA2
  (Commit `4a6a6e5b <http://sourceforge.net/p/kaarpux/code/ci/4a6a6e5b6d0278551e66bbaf24dc3626044878d4/>`_)

- ADD: wireless_tools
  (Commit `429f0ad3 <http://sourceforge.net/p/kaarpux/code/ci/429f0ad3a875cd3826efe6db294e0792a9ac05ea/>`_)

- DOC: networking: how to enable NetworkManager instead of systemd-networkd
  (Commit `35aa34ab <http://sourceforge.net/p/kaarpux/code/ci/35aa34ab316f62d2c2a1e96d4720e2b5d492a4fc/>`_)


Building KaarPux under X11
##########################

- DOC: www: running under X11 is only required for testing
  (Commit `59085784 <http://sourceforge.net/p/kaarpux/code/ci/59085784a83e3b2b9e8365ce9e90369eb87e3ec8/>`_)

- ADD: xf86-video-dummy: dummy video driver for X11
  (Commit `a2676c76 <http://sourceforge.net/p/kaarpux/code/ci/a2676c76d824c9190c10a0954fc16c0f8fbb865f/>`_)

- IMPROVE: KxBuild: start dummy X11 server and dbus; needed for many 'make check'
  (Commit `3e960e6c <http://sourceforge.net/p/kaarpux/code/ci/3e960e6cb464f9f1d5cf1f469e9243e5eb5d746f/>`_)

- IMPROVE: KxBuild: dangerous_build_rest to really kill dummy X11 server at last
  (Commit `f712e144 <http://sourceforge.net/p/kaarpux/code/ci/f712e144e5510f154c81dbfae9ead4ae1d91d25e/>`_)


Bugs fixed
##########

- FIX: mutter: patch for cogl 18.*
  (Commit `aeca246f <http://sourceforge.net/p/kaarpux/code/ci/aeca246fcb46196c84e0f5f9aa6cd5233e8c81cc/>`_)

- FIX: KxBuild: if download file has size zero, download again
  (Commit `512d0baf <http://sourceforge.net/p/kaarpux/code/ci/512d0bafad1d065d67b8ee7ec8c25d2022e768d3/>`_)

- FIX: groff: make_repeat
  (Commit `1515c1cf <http://sourceforge.net/p/kaarpux/code/ci/1515c1cf5779fb07c5f03733c80ca35454c38caa/>`_)


Packages added
##############

- ADD: xf86-video-qxl; includes Xspice
  (Commit `7e75f700 <http://sourceforge.net/p/kaarpux/code/ci/7e75f700db127492fcb3e6826aac51784dd32c81/>`_)


Packages updated
################

- UPD: gst*: v 1.3.1
  (Commit `9ec421a9 <http://sourceforge.net/p/kaarpux/code/ci/9ec421a95bd91a632079bd9f0438d34fd944a523/>`_)

- UPD: cogl: v 1.18.0
  (Commit `d5605809 <http://sourceforge.net/p/kaarpux/code/ci/d5605809bcd94cebcef46035de8ec427b8551122/>`_)

- UPD: xorg-server: v 1.15.1
  (Commit `e6cb6204 <http://sourceforge.net/p/kaarpux/code/ci/e6cb620403d0c6d8d58b4b14e292f3e1daf9836e/>`_)

- UPD: clutter: v 1.18.2
  (Commit `e4a64234 <http://sourceforge.net/p/kaarpux/code/ci/e4a64234e80ba324fc6a10e9093fe465def30f8c/>`_)

- UPD: shadow: v 4.2.1
  (Commit `c28b4eca <http://sourceforge.net/p/kaarpux/code/ci/c28b4eca08c5b6f7e6a866175020e7f7e9710643/>`_)

- UPD: linux: v 3.14.4
  (Commit `3017e83b <http://sourceforge.net/p/kaarpux/code/ci/3017e83bd79629da361ab9d2e9e154d51c475ddb/>`_)

- UPD: flash_player_11: v 11.2.202.359
  (Commit `a1c980d7 <http://sourceforge.net/p/kaarpux/code/ci/a1c980d76f0a5bed1d5cf84613c44fa6bbe97d90/>`_)

- UPD: libXfont: v 1.4.8: CVE-2014-0209 -0210 -0211
  (Commit `7b2c4540 <http://sourceforge.net/p/kaarpux/code/ci/7b2c45404b94807f1d10e99b7d9415700fe55887/>`_)


Minor Changes and Documentation Changes
#######################################

- IMPROVE: xorg-server: do not install with setuid (we have KMS)
  (Commit `1e8b3d63 <http://sourceforge.net/p/kaarpux/code/ci/1e8b3d6318bfe93c91be23dbc52df327300347b0/>`_)

- MINOR: xorg-server: do not enable xephyr (not build anyway as prereqs are missing)
  (Commit `1212072b <http://sourceforge.net/p/kaarpux/code/ci/1212072b60596b07430b8ebba8f00475be27e1a9/>`_)

- MINOR: xorg-server: vendor is KaarPux
  (Commit `ef9578ef <http://sourceforge.net/p/kaarpux/code/ci/ef9578efc853797fc53ef533c5bde31447661987/>`_)

- IMPROVE: KxBuild: move valgrind earlier (useful for some 'make check')
  (Commit `01dd56ff <http://sourceforge.net/p/kaarpux/code/ci/01dd56ffc03112ce2f90ee5c82d785bed159b475/>`_)

- IMPROVE: neon: check_ignore
  (Commit `bdc67270 <http://sourceforge.net/p/kaarpux/code/ci/bdc67270928f7aa6857e319d7452ff2a6e7c5065/>`_)

- IMPROVE: udisks: check_ignore
  (Commit `54c53b76 <http://sourceforge.net/p/kaarpux/code/ci/54c53b765d9f44cdb770365daadb708c33d4383d/>`_)

- IMPROVE: vim: disable test; fails when redirected to files
  (Commit `8c1a157e <http://sourceforge.net/p/kaarpux/code/ci/8c1a157ecf80a6b96af8060f1787fd02ac34ab60/>`_)

- IMPROVE: KxBuild: use -usb -device usb-audio in kvm for libgusb tests
  (Commit `57d05a53 <http://sourceforge.net/p/kaarpux/code/ci/57d05a530e8f148735ec79c0d7fbb1d6053b82fa/>`_)

- IMPROVE: KxBuild: do not barf if we cannot find gpg
  (Commit `b95bd5b3 <http://sourceforge.net/p/kaarpux/code/ci/b95bd5b37aad13739554171779f0e5b090786c2e/>`_)

- IMPROVE: linux: CONFIG_VETH and CONFIG_DEVPTS_MULTIPLE_INSTANCES for lxc
  (Commit `6ba1b101 <http://sourceforge.net/p/kaarpux/code/ci/6ba1b10169d42053ef9e2e4167b086958e927fae/>`_)

- IMPROVE: KxBuild: slightly improved performance
  (Commit `46e3b404 <http://sourceforge.net/p/kaarpux/code/ci/46e3b4043798d29897e86c878648e87e9bde45c2/>`_)

- IMPROVE: KxBuild: possibly better malloc settings (for performance)
  (Commit `3f3b0519 <http://sourceforge.net/p/kaarpux/code/ci/3f3b0519a571f4e0c1fbab5a17c287c1c0c93d96/>`_)

- MINOR: KxBuild: quiet warnings from lsb_release
  (Commit `506aaab4 <http://sourceforge.net/p/kaarpux/code/ci/506aaab408d6711dbab3cf4426eb7bd04096d5af/>`_)

- DOC: www: improved instructions for copying KaarPux to another machine
  (Commit `16bd620d <http://sourceforge.net/p/kaarpux/code/ci/16bd620d30be8498e39f286350f3172dff02d59a/>`_)

- DOC: www: Unpack KaarPux tarball with --numeric-owner
  (Commit `b5783584 <http://sourceforge.net/p/kaarpux/code/ci/b578358435901bdb79f94d9c7a01a1e69346cc16/>`_)

- DOC: KaarPux: updated CVE info
  (Commit `291bdae7 <http://sourceforge.net/p/kaarpux/code/ci/291bdae79acf12f3382c7b0cb46030636e48f972/>`_)

- DOC: www: command for loop mounting image
  (Commit `073068ee <http://sourceforge.net/p/kaarpux/code/ci/073068ee88e04ae14f96869a822cdabe64765b3a/>`_)


