.. 
   KaarPux: http://kaarpux.kaarposoft.dk
   Copyright (C) 2015: Henrik Kaare Poulsen
   License: http://kaarpux.kaarposoft.dk/license.html

.. _changes_3_4_6:


================================
Changes in KaarPux version 3.4.6
================================


:program:`KaarPux` version ``3.4.6`` released on ``2013-mar-13``

- Upstream Security Fixes

- Linux Kernel Updated to v 3.8.2

- Improved verification framework and testcases

- Packages updated and bugs fixed

- Several (mostly minor) changes


Upstream Security Fixes
#######################

- UPD: icedtea: v 2.3.8
  (Commit `3b347c18 <http://sourceforge.net/p/kaarpux/code/ci/3b347c18ce196fa69c65cc4ce2f4ba09cc55d78a/>`_)

- UPD: flash_player_11: v 11.2.202.275
  (Commit `fdadc116 <http://sourceforge.net/p/kaarpux/code/ci/fdadc116abbdbea078a8aae9b1b4b78987654ead/>`_)

- UPD: xulrunner firefox: v 19.0.2
  (Commit `96ad332c <http://sourceforge.net/p/kaarpux/code/ci/96ad332c4f774452541fb07a01071ac106309383/>`_)

- UPD: ghostery: 2.9.2
  (Commit `9f40bd8d <http://sourceforge.net/p/kaarpux/code/ci/9f40bd8dc54d9036e39ea20e717e688f7283a2d5/>`_)

- UPD: noscript: v 2.6.5.8
  (Commit `c68e1c5b <http://sourceforge.net/p/kaarpux/code/ci/c68e1c5b8d2a643b5abd9acc3b86b63bdeef6e87/>`_)

- UPD: thunderbird: v 17.0.4
  (Commit `827b3267 <http://sourceforge.net/p/kaarpux/code/ci/827b32676b773849b593aa18b6dd10e84d21d4df/>`_)


Linux Kernel Updated
####################

- UPD: linux: v 3.8.2
  (Commit `5630b821 <http://sourceforge.net/p/kaarpux/code/ci/5630b8214da745afe7d8469995b10b7420835b32/>`_)


Bugs fixed
##########

- FIX: KaarPux: Correct systemd session handling
  (Commit `62a31463 <http://sourceforge.net/p/kaarpux/code/ci/62a314637e570c87e3dffab84c3d3cf4a22591fa/>`_)

- FIX: install_kx_open_stp: Temporary fix for http://sourceware.org/bugzilla/show_bug.cgi?id=15193
  (Commit `932cf5a6 <http://sourceforge.net/p/kaarpux/code/ci/932cf5a6230eb156001de67c25b05900c827677e/>`_)

- FIX: ghostscript-fonts-other: move to after ghostscript-fonts-std
  (Commit `28ddb673 <http://sourceforge.net/p/kaarpux/code/ci/28ddb67371799c6a051559304539486a5ed6ab92/>`_)

- FIX: KxBuild: Do not build dbus-python and dbus-python-2 in parallel
  (Commit `a8941be3 <http://sourceforge.net/p/kaarpux/code/ci/a8941be3e7fdd6086f9859b4db5bf72f47f75a36/>`_)

- FIX: KxBuild: gnome-vfs after gnome-mime-data
  (Commit `ffdf175f <http://sourceforge.net/p/kaarpux/code/ci/ffdf175f33b1b226762b5ee51a064989d652d0eb/>`_)

- FIX: dbus: Build dbus again after libX11 (so dbus-launch will work under Gnome
  (Commit `8894c7b4 <http://sourceforge.net/p/kaarpux/code/ci/8894c7b4f77fd21779adce76dcdd1381daaa7cc0/>`_)

- FIX: gnome-keyring gnome-shell rest: correct path to /etc/ssl/certs/ca-bundle.crt
  (Commit `534bc534 <http://sourceforge.net/p/kaarpux/code/ci/534bc534a77207f6187b3b24c55a869f61fe40cb/>`_)

- FIX: dbus: create dir /etc/X11/xinit/xinitrc.d/ before putting file into dir
  (Commit `c27cf2a5 <http://sourceforge.net/p/kaarpux/code/ci/c27cf2a5b746953936ff8dc5c101900234dde11c/>`_)

- FIX: ghostery: mozilla addons download location changed
  (Commit `6fa54fb7 <http://sourceforge.net/p/kaarpux/code/ci/6fa54fb7d061e30013fc07a0cb5486f933b52a5a/>`_)


Packages updated
################

- UPD: bash: 4.2.45
  (Commit `a1bb99e6 <http://sourceforge.net/p/kaarpux/code/ci/a1bb99e61036542b335e2000ad95024ef2d69800/>`_)

- UPD: pigz: v 2.3
  (Commit `80f9311a <http://sourceforge.net/p/kaarpux/code/ci/80f9311ae53d7f8246971958fecbf025a393d879/>`_)

- UPD: sudo: v 1.8.6
  (Commit `d836b915 <http://sourceforge.net/p/kaarpux/code/ci/d836b9155ef5637bc57fed5294e917726ad4dd6d/>`_)

- UPD: poppler: v 0.22.1
  (Commit `f608b364 <http://sourceforge.net/p/kaarpux/code/ci/f608b3644750830e7a9a4748782576d54f57987e/>`_)

- UPD: dhcpcd: v 5.6.7
  (Commit `2936ca5a <http://sourceforge.net/p/kaarpux/code/ci/2936ca5ad97065b9565e81e1666a472583b44b59/>`_)

- UPD: systemd: v 198
  (Commit `5dd431ee <http://sourceforge.net/p/kaarpux/code/ci/5dd431eebae0cc9a882e9f111c7f446bba6df8f1/>`_)

- UPD: procps-ng: procps -> procps-ng 3.3.6
  (Commit `ded75cc5 <http://sourceforge.net/p/kaarpux/code/ci/ded75cc5c2a9f4ba72323cd2d73aadb4758436f8/>`_,
  `1d2db83d <http://sourceforge.net/p/kaarpux/code/ci/1d2db83dbc3b956c7459904d395e9907980e7a8c/>`_)


Packages Added for GUI Verification
###################################

- ADD: pyatspi python-twisted zope.interface dbus-python-2 ldtp
  (Commit `e7406d6e <http://sourceforge.net/p/kaarpux/code/ci/e7406d6eaac88427ced5d2014630e2fb72293d24/>`_)

- ADD: \*: several gnome/python packages
  (Commit `6f14186c <http://sourceforge.net/p/kaarpux/code/ci/6f14186cf1bc79829a42d9d7f875a1d1ea1b8034/>`_)

- ADD: nose: nicer testing for python
  (Commit `0b945e9a <http://sourceforge.net/p/kaarpux/code/ci/0b945e9a99d20298edc3d1a0315987ac330f8d50/>`_)


Improved Verification
#####################

- IMPROVE: KaarPux: Add GUI test framework
  (Commit `e9c71e9e <http://sourceforge.net/p/kaarpux/code/ci/e9c71e9ed49857b88c98e9073bb09008cd98cf11/>`_)

- IMPROVE: \*: Add GUI test cases
  (Commit `a4d8fed6 <http://sourceforge.net/p/kaarpux/code/ci/a4d8fed619503d2ee75322f2d892cae87bb53006/>`_)

- DOC: www: Document GUI test framework
  (Commit `1b5bf36a <http://sourceforge.net/p/kaarpux/code/ci/1b5bf36a15e3649a53c2f72d6fae5a60e2683988/>`_)

- Additional CLI verification testcases
  (Commit `f30588e7 <http://sourceforge.net/p/kaarpux/code/ci/f30588e78fe9542b784bc0f3fb5e1a77b0dc12a8/>`_,
  `521a9445 <http://sourceforge.net/p/kaarpux/code/ci/521a944566c27d7c1177da3840743625a45a57a3/>`_,
  `8fed6c9e <http://sourceforge.net/p/kaarpux/code/ci/8fed6c9eeecdbd38e50932b3224da1d01f2d5d3c/>`_,
  `a6a2ddf2 <http://sourceforge.net/p/kaarpux/code/ci/a6a2ddf22b2f390d261b83fec8bb58499a428de8/>`_,
  `1b7c4f7f <http://sourceforge.net/p/kaarpux/code/ci/1b7c4f7f69844a5ab7a32aa022e81924c7c40fbc/>`_)

- IMPROVE: pygobject2: fedora patches; verify_cli testcases added
  (Commit `23c7b39e <http://sourceforge.net/p/kaarpux/code/ci/23c7b39ea0ddb21cff110d2dc6425f835a18be33/>`_)

- MINOR: KxTest: verify_gui/kx.py: better print output
  (Commit `3b557bba <http://sourceforge.net/p/kaarpux/code/ci/3b557bba5d43cdab784484c72dbfc6431e09c4bc/>`_)

- IMPROVE: KxTest: Better grouping of GUI test cases
  (Commit `ec2ebb80 <http://sourceforge.net/p/kaarpux/code/ci/ec2ebb8004237ae06ef0ed9708350c991dbed161/>`_)

- IMPROVE: KxTest: Several 'minor' improvements in verify_gui/kx.py
  (Commit `1d6b4725 <http://sourceforge.net/p/kaarpux/code/ci/1d6b4725cc4b7755135a20f00ea5ecc098cdeffa/>`_)


Minor Changes
#############

- IMPROVE: bash: Include patch level in version check
  (Commit `7d128466 <http://sourceforge.net/p/kaarpux/code/ci/7d12846665e9cb75ae04c5076d2952ff119bfbd7/>`_)

- IMPROVE: gcc: use ln -svf to make building reentrant
  (Commit `8dc1ec4e <http://sourceforge.net/p/kaarpux/code/ci/8dc1ec4e4b8bf7b9ce8f50278f7a234487df4f3a/>`_)

- MINOR: device-mapper: make in parallel
  (Commit `716b4041 <http://sourceforge.net/p/kaarpux/code/ci/716b4041ef72e7fe8e32dd08bf891491d7f45394/>`_)

- MINOR: lua: make in parallel
  (Commit `5ac0b2ae <http://sourceforge.net/p/kaarpux/code/ci/5ac0b2ae6a75890ff7956c82324aebd626540e6b/>`_)

- IMPROVE: KaarPux: Update mandb and desktop-database (mimetypes) after installation
  (Commit `e117f0ad <http://sourceforge.net/p/kaarpux/code/ci/e117f0adac21c0f998d21afcb0bcdf709c8e1f0e/>`_,
  `abfe1d63 <http://sourceforge.net/p/kaarpux/code/ci/abfe1d6347be58253541ca33256342817bd4aeec/>`_,
  `261ee6c2 <http://sourceforge.net/p/kaarpux/code/ci/261ee6c2cbb2d9359d534fd83627816f165aa5bc/>`_)

- IMPROVE: pigz: version check
  (Commit `3a4d974c <http://sourceforge.net/p/kaarpux/code/ci/3a4d974c36513fbebfbe1014fd0715240e387111/>`_)

- Documentation improvements


