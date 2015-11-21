.. 
   KaarPux: http://kaarpux.kaarposoft.dk
   Copyright (C) 2015: Henrik Kaare Poulsen
   License: http://kaarpux.kaarposoft.dk/license.html

.. _changes_4_5_2:


================================
Changes in KaarPux version 4.5.2
================================


:program:`KaarPux` version ``4.5.2`` released on ``2014-jul-13``

- Compilers updated (gcc 4.9; clang 3.4.2)

- Other packages updated

- Bugs fixed

- Improvements to "make check"

- Other additions, corrections, and improvements


Compilers updated (gcc 4.9; clang 3.4.2)
########################################

- UPD: gmp: v 6.0.0
  (Commit `7268b01c <http://sourceforge.net/p/kaarpux/code/ci/7268b01c806c7933da28b7dcca6d038f5a3e48c0/>`_)

- UPD: gcc: v 4.9-20140709
  (Commit `143340c3 <http://sourceforge.net/p/kaarpux/code/ci/143340c3dc562ce2375d5e07927441a5699281bc/>`_)

- FIX: KxBuild: make check_bootstrap_5 more robust
  (Commit `1e4e8420 <http://sourceforge.net/p/kaarpux/code/ci/1e4e8420ec5cc196f2a51d535360b476cd634f6f/>`_)

- FIX: cairo: CFLAGS=-ffat-lto-objects for compiling with gcc 4.9
  (Commit `b94d7da5 <http://sourceforge.net/p/kaarpux/code/ci/b94d7da5dc6003cf10a241451b35c5b5a3b3fd45/>`_)

- IMPROVE: binutils: --disable-werror --with-sysroot
  (Commit `821d501c <http://sourceforge.net/p/kaarpux/code/ci/821d501cdfaf9399f6435543a0d587c27a35bf31/>`_)

- UPD: llvm: v 3.4.2
  (Commit `7b1e3821 <http://sourceforge.net/p/kaarpux/code/ci/7b1e382141b00647c20bc7ac9ca371d134caeb28/>`_)


Bugs fixed
##########

- FIX: e2fsprogs: make_repeat
  (Commit `9aed3f0a <http://sourceforge.net/p/kaarpux/code/ci/9aed3f0a197f658ffe63be561e43e503452d80ab/>`_)

- FIX: download_packages_2: fall through to nice error message if not all files could be downloaded
  (Commit `a01927fe <http://sourceforge.net/p/kaarpux/code/ci/a01927fee09d0ef5a255623d34b300826be576bd/>`_)

- FIX: download_packages_2: create gpg_keys and gpg dirs separatley
  (Commit `ca3f86c6 <http://sourceforge.net/p/kaarpux/code/ci/ca3f86c642b8c86fb5bff11187d66850713f2800/>`_)

- FIX: cairo: Firefox segfault when scrolling on some URL's
  (Commit `f3558d33 <http://sourceforge.net/p/kaarpux/code/ci/f3558d330caaaf7878fe8bd1a29af6bcb49ef4f3/>`_)


Packages updated
################

- UPD: linux: v 3.15.5
  (Commit `dcef844c <http://sourceforge.net/p/kaarpux/code/ci/dcef844c324d72e4a4f8b9e455e538845ac294ba/>`_,
  `97f954fb <http://sourceforge.net/p/kaarpux/code/ci/97f954fb9ff22bacfa8327e6a7e57ce26ac5c7d2/>`_)

- UPD: gnupg: v 2.0.25
  (Commit `e208effe <http://sourceforge.net/p/kaarpux/code/ci/e208effe670d2e86d93a9f246bfd35815f75d989/>`_,
  `d57aa20a <http://sourceforge.net/p/kaarpux/code/ci/d57aa20ac9283ebf9df51e8ba18fbd77138ef3d6/>`_)

- UPD: dbus: v 1.8.6
  (Commit `62483672 <http://sourceforge.net/p/kaarpux/code/ci/62483672ea28b918dc46e81e6a8fa84a2688ce36/>`_)

- UPD: systemd: v 215
  (Commit `999aab5b <http://sourceforge.net/p/kaarpux/code/ci/999aab5b6860f061d8f27907c0ca8747f2150f50/>`_)

- UPD: kmod: v 18
  (Commit `09468def <http://sourceforge.net/p/kaarpux/code/ci/09468def4a83a45daff607a49f47950f166f703d/>`_)

- UPD: iproute2: v 3.15.0
  (Commit `54fb17a9 <http://sourceforge.net/p/kaarpux/code/ci/54fb17a904261b38c3f41c1347cb77a1f3e4fcea/>`_)

- UPD: kbd: v 2.0.2
  (Commit `46e5d75c <http://sourceforge.net/p/kaarpux/code/ci/46e5d75c9b664d2140b8e11ea50d2298e0cde239/>`_)

- UPD: nss: v 3.16.3
  (Commit `a4e10f8c <http://sourceforge.net/p/kaarpux/code/ci/a4e10f8c14e6d29f2e557a7978733684ccc9dc3a/>`_)

- UPD: poppler: v 0.26.2
  (Commit `64483638 <http://sourceforge.net/p/kaarpux/code/ci/6448363835a57eff096602c35200720766f8353a/>`_)

- UPD: pixman: v 0.32.6
  (Commit `bb7b4ed1 <http://sourceforge.net/p/kaarpux/code/ci/bb7b4ed11b67c3afc456df11b74dbbeed5252b79/>`_)

- UPD: pango: v 1.36.5
  (Commit `85c2e25a <http://sourceforge.net/p/kaarpux/code/ci/85c2e25abec779e40266b598b50c984f3b2800b3/>`_)

- UPD: harfbuzz: v 0.9.30
  (Commit `2be5d827 <http://sourceforge.net/p/kaarpux/code/ci/2be5d8273d534611300af4169a7919c05677ab70/>`_)

- UPD: cogl: v 1.18.2
  (Commit `92aa9bdb <http://sourceforge.net/p/kaarpux/code/ci/92aa9bdb978d23031a950fa05fd2e40b04b9414b/>`_)

- UPD: MesaLib: v 10.2.3
  (Commit `058edf48 <http://sourceforge.net/p/kaarpux/code/ci/058edf487768a67daab733d16a69fcad71070c07/>`_)

- UPD: mesa-demos: v 8.2.0
  (Commit `1e825c18 <http://sourceforge.net/p/kaarpux/code/ci/1e825c18291095d13e19a9d0613a24b1bcfd4fcf/>`_)

- UPD: git: v 2.0.1
  (Commit `c812f744 <http://sourceforge.net/p/kaarpux/code/ci/c812f74400e51c356c6393f3305ca809256bed3f/>`_)

- UPD: geoclue: v 2.1.9
  (Commit `8ce40e5d <http://sourceforge.net/p/kaarpux/code/ci/8ce40e5da3b6fabd1e3b7b39484f8304cb2fb1cd/>`_)

- UPD: noscript: v 2.6.8.33
  (Commit `c2ec207d <http://sourceforge.net/p/kaarpux/code/ci/c2ec207d84f1a0bcfe473866fd30e96e00353dbf/>`_)

- UPD: flash_player_11: v 11.2.202.394
  (Commit `37b38145 <http://sourceforge.net/p/kaarpux/code/ci/37b38145da1b12bb4d4f7eb328beaf2ad83ea647/>`_)

- UPD: rsync: v 3.1.1
  (Commit `3a51b7f9 <http://sourceforge.net/p/kaarpux/code/ci/3a51b7f91aecc4a62c60fddf244471fea2276cc1/>`_)

- UPD: man-pages: v 3.70
  (Commit `ca1faa11 <http://sourceforge.net/p/kaarpux/code/ci/ca1faa11c213b6406415668e43d9fe16b5e6f44d/>`_)


Improvements to "make check"
############################

- FIX: libtool: fix make check; fixes ticket #6
  (Commit `5b25f0dd <http://sourceforge.net/p/kaarpux/code/ci/5b25f0dd64336034a3ccd686f9a1fb5c3e19a71f/>`_)

- FIX: glib: fix make check
  (Commit `4d4b0098 <http://sourceforge.net/p/kaarpux/code/ci/4d4b0098bc3b3dcab518a267b3480e458fd99e7e/>`_)

- FIX: icu: fix make check
  (Commit `8d168ca3 <http://sourceforge.net/p/kaarpux/code/ci/8d168ca35dc79adec13fc34407f6d05ee7e45011/>`_)

- FIX: udisks: fix make check
  (Commit `9f5916b2 <http://sourceforge.net/p/kaarpux/code/ci/9f5916b28447ecb59b3ff9bd6c16263a527168f2/>`_)

- FIX: pcre: better configure options; make check fixes ticket #9
  (Commit `e8ca2882 <http://sourceforge.net/p/kaarpux/code/ci/e8ca2882adda3b5948a52b485df1d4c2a56e3f63/>`_)

- MINOR: elfutils: ticket #8 fixed
  (Commit `bc06d50c <http://sourceforge.net/p/kaarpux/code/ci/bc06d50c6619c603d544993d08b8391aae0df857/>`_)

- MINOR: sudo: make check fixes ticket #9
  (Commit `88add432 <http://sourceforge.net/p/kaarpux/code/ci/88add432723e1653870ce6b18b232248707c4e69/>`_)


Other additions, corrections, and improvements
##############################################

- ADD: lzip: lossless data compressor with a user interface similar to the one of gzip or bzip2
  (Commit `25709195 <http://sourceforge.net/p/kaarpux/code/ci/2570919502b8c0db7e794a433e93e0c0de5b4dd4/>`_)

- IMPROVE: KxBuild: functions for using lzip
  (Commit `7c0a98cf <http://sourceforge.net/p/kaarpux/code/ci/7c0a98cfaa33a7b68d21b494d43a5d3712603dcb/>`_)

- IMPROVE: accerciser: re-introduce  accerciser_getLocalizedRoleName.patch
  (Commit `d66f7413 <http://sourceforge.net/p/kaarpux/code/ci/d66f7413a6348387a45e26fdcb4f91ca3d5e7866/>`_)

- MINOR: gdlmm: improve upstream check
  (Commit `9822ffc7 <http://sourceforge.net/p/kaarpux/code/ci/9822ffc7d0bcf781f5c1baf0932296da4e927916/>`_)

- IMRPOVE: KxBuild: use nproc+1 jobs instead of 1.5*nproc for slightly better build time
  (Commit `29fd9acb <http://sourceforge.net/p/kaarpux/code/ci/29fd9acb03070f0b132b14bc785ba1a87729322a/>`_)

- IMPROVE: KxTools: kx_sar to report on runq-sz and plist
  (Commit `acf6bf19 <http://sourceforge.net/p/kaarpux/code/ci/acf6bf1959264e25ce8f4b0ef000a481e8bf9969/>`_)

- IMPROVE: KxBuild: allow old gpg versions without --allow-weak-digest-algos
  (Commit `b4f0e81d <http://sourceforge.net/p/kaarpux/code/ci/b4f0e81d9d530c385713be660b3d63e69c2df465/>`_)

- DOC: KaarPux: updated CVE info
  (Commit `26f8ff50 <http://sourceforge.net/p/kaarpux/code/ci/26f8ff50eaee59fe22775231cafed44f59906442/>`_,
  `cecf0390 <http://sourceforge.net/p/kaarpux/code/ci/cecf0390665adc3b75b5a9136e3b6129392c2531/>`_)


