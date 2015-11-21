.. 
   KaarPux: http://kaarpux.kaarposoft.dk
   Copyright (C) 2015: Henrik Kaare Poulsen
   License: http://kaarpux.kaarposoft.dk/license.html

.. _changes_4_5_0:


================================
Changes in KaarPux version 4.5.0
================================


:program:`KaarPux` version ``4.5.0`` released on ``2014-jun-13``

- Most packages updated to latest version

- Do not build LibreOffice prerequisites separatly

- Other additions, corrections, and improvements


Most packages updated to latest version
#######################################

- UPD: \*: most packages updated to latest version
  (Commit `8e469c2c <http://sourceforge.net/p/kaarpux/code/ci/8e469c2ca6caeb96c7b849144305836272ac3b2d/>`_)

- UPD: git: v 2.0.0
  (Commit `05f81f65 <http://sourceforge.net/p/kaarpux/code/ci/05f81f65611c4079a5ab4362fc2b3dd6df4e8d54/>`_)

- UPD: linux: v 3.15
  (Commit `a128e268 <http://sourceforge.net/p/kaarpux/code/ci/a128e268035ff2f788c3cc48562bce9cadb52e7f/>`_)

- UPD: systemd: v 214
  (Commit `0a76fb81 <http://sourceforge.net/p/kaarpux/code/ci/0a76fb816b36a84fae6265075c920240d810fad6/>`_)


Do not build LibreOffice prerequisites separatly
################################################

- IMPROVE: libreoffice: do not build prereqs separatly
  (Commit `ffbea2cc <http://sourceforge.net/p/kaarpux/code/ci/ffbea2ccf5c6a94ee614cbe1149d0427289609f6/>`_)

- MINOR: libreoffice: slightly improved configuration
  (Commit `f4faea50 <http://sourceforge.net/p/kaarpux/code/ci/f4faea50ec12f05d2b266def4d26b922f1b52b34/>`_)

- REMOVE: \*: remove libreoffice prereqs
  (Commit `25fad354 <http://sourceforge.net/p/kaarpux/code/ci/25fad35415201f8219524d5b3d9a3a2dc6ec78d4/>`_)

- ADD: cppunit: the version bundled with libreoffice does not work
  (Commit `aa6f4025 <http://sourceforge.net/p/kaarpux/code/ci/aa6f402577d9abaf49aa04b17ab582aaafd7e038/>`_)


Other additions, corrections, and improvements
##############################################

- ADD: IO-HTML: prereq for PERLMODULES testing
  (Commit `3cca1ebb <http://sourceforge.net/p/kaarpux/code/ci/3cca1ebb8a23b42479c1213a14b2ebc2c4dd0050/>`_)

- ADD: glamor-egl; prereq for updated xf86-video-ati
  (Commit `b7e10f4a <http://sourceforge.net/p/kaarpux/code/ci/b7e10f4a3f9fea43daad58fa480c7c221a3b66bd/>`_)

- ADD: appstream-glib
  (Commit `916485da <http://sourceforge.net/p/kaarpux/code/ci/916485da2019c5855edb7a6db2a3a67ad063a1f4/>`_)

- ADD: protobuf
  (Commit `44401a7f <http://sourceforge.net/p/kaarpux/code/ci/44401a7fcf3205d3c6d82f88819500c58426e751/>`_)

- FIX: neon: patch testcase:  echo -e -> printf
  (Commit `e51d6658 <http://sourceforge.net/p/kaarpux/code/ci/e51d6658cb8b3c5c3e219a9dfe7b76f6128bd7ef/>`_)

- FIX: haveged: put yaml file in correct subdir
  (Commit `32d5cd9e <http://sourceforge.net/p/kaarpux/code/ci/32d5cd9e935130ef0d8f61ce88e4252daf29a052/>`_)

- FIX: KxTools: kx_version: correct args to call to versioncmp
  (Commit `fff0fcec <http://sourceforge.net/p/kaarpux/code/ci/fff0fcec2b2c3f0c3831409d0a36f347694bc481/>`_)

- FIX: glamor-egl xf86-video-ati: compile with gcc
  (Commit `28b77fe8 <http://sourceforge.net/p/kaarpux/code/ci/28b77fe8a9bd45d60499df5f02add4e5c92d7b35/>`_)

- FIX: screen: add missing GPG key
  (Commit `cd377c63 <http://sourceforge.net/p/kaarpux/code/ci/cd377c63ad4afa04fe33706192ed6ca1d55371ad/>`_)

- IMPROVE: haveged: improved version information
  (Commit `729c1343 <http://sourceforge.net/p/kaarpux/code/ci/729c1343315f27a20c668d3f9fd21f7aed05f650/>`_)

- IMPROVE: gphoto2: correct installed version check
  (Commit `c6e6be93 <http://sourceforge.net/p/kaarpux/code/ci/c6e6be93b331f67bc36e1815daf9bd16f93d0c2a/>`_)

- IMPROVE: json-c: correct installed version check
  (Commit `80bc5371 <http://sourceforge.net/p/kaarpux/code/ci/80bc537140b5ccc40703035f6f48197ee1f1a850/>`_)

- IMPROVE: mozjs*: better version information
  (Commit `71f81bd3 <http://sourceforge.net/p/kaarpux/code/ci/71f81bd30f54f5b1ac1365d7300ac4324e15c44e/>`_)

- IMPROVE: gnuplot: add version information
  (Commit `ee576ef0 <http://sourceforge.net/p/kaarpux/code/ci/ee576ef05042cefff0a18bf26cd74de77f96bc1b/>`_)

- IMPROVE: libcmis: fix installed version info
  (Commit `18deb1d2 <http://sourceforge.net/p/kaarpux/code/ci/18deb1d2474e81288e4d5a572b203fb429a26f20/>`_)

- IMPROVE: \*: better upstream version check
  (Commit `581555f5 <http://sourceforge.net/p/kaarpux/code/ci/581555f5ebdaa4ca01fd4f870f01a51a7ff1f100/>`_)

- MINOR: libzeitgeist zeitgeist tracker: remove unused packages
  (Commit `4963c5a2 <http://sourceforge.net/p/kaarpux/code/ci/4963c5a2a00c3931fc1bc449b302121a482fe07b/>`_)

- MINOR: flex: remove unused patch
  (Commit `7888ac59 <http://sourceforge.net/p/kaarpux/code/ci/7888ac59093f2df75ac05a80d51f7bd2ca28886e/>`_)

- IMPROVE: gstreamer: correct upstream version check
  (Commit `d24bf568 <http://sourceforge.net/p/kaarpux/code/ci/d24bf568238a0e7a8911c99854da668e3d19da18/>`_)

- IMPROVE: KxBuild: allow MD5 digest for gpg; we have some old signatures on old packages
  (Commit `4373795b <http://sourceforge.net/p/kaarpux/code/ci/4373795b1e28dad8d97d2b04900dc69d800a8a65/>`_)


