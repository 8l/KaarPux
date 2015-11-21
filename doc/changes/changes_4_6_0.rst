.. 
   KaarPux: http://kaarpux.kaarposoft.dk
   Copyright (C) 2015: Henrik Kaare Poulsen
   License: http://kaarpux.kaarposoft.dk/license.html

.. _changes_4_6_0:


================================
Changes in KaarPux version 4.6.0
================================


:program:`KaarPux` version ``4.6.0`` released on ``2014-sep-06``

- Most packages updated to latest version

- Packages added: mcelog, i7z, tcllib

- Bugs fixed

- Other minor changes


Packages updated
################

- UPD: \*: most packages updated to latest version
  (Commit `400aea40 <http://sourceforge.net/p/kaarpux/code/ci/400aea408339a06bf57d297430ee8b1dadf73968/>`_)

- UPD: systemtap: v 2.6-0.413
  (Commit `91a2f4e2 <http://sourceforge.net/p/kaarpux/code/ci/91a2f4e27474d94ffa3bfe604cd38727debc4df3/>`_)

- UPD: systemd: v 216
  (Commit `e5c52dda <http://sourceforge.net/p/kaarpux/code/ci/e5c52dda8d6d45a49b014c7cdc86b6c28949161e/>`_)

- UPD: icedtea7: v 2.5.2
  (Commit `8e8d20b8 <http://sourceforge.net/p/kaarpux/code/ci/8e8d20b8944ed007669682df9f1156983a0d9426/>`_)

- UPD: util-linux: v 2.25
  (Commit `a6ef0eb4 <http://sourceforge.net/p/kaarpux/code/ci/a6ef0eb461eddf6ecc1cf1910de6158309c8b713/>`_)

- UPD: libusb: v 1.0.19; libusbx has been merged into libusb
  (Commit `28b6e71b <http://sourceforge.net/p/kaarpux/code/ci/28b6e71bdb393fc1192deac686f1e4cf0ae6d234/>`_)

- UPD: libcap: v 2.24 (plus upstream patch)
  (Commit `31d830b5 <http://sourceforge.net/p/kaarpux/code/ci/31d830b54725677c9727352613771795143d4812/>`_)

- UPD: gimp: v 2.8.14
  (Commit `0699b25c <http://sourceforge.net/p/kaarpux/code/ci/0699b25cccf055c617119e9bddeeb73becfd17a7/>`_)

- UPD: gtksourceview: v 3.12.3
  (Commit `2223520a <http://sourceforge.net/p/kaarpux/code/ci/2223520af01969b7ddcf0af894aaf94102728dc4/>`_)

- UPD: libtirpc: v 0.2.5
  (Commit `d6eae096 <http://sourceforge.net/p/kaarpux/code/ci/d6eae096686b95a92d75527a19a8f4a28a7475ce/>`_)

- UPD: parted: v 3.2
  (Commit `9ce72ea0 <http://sourceforge.net/p/kaarpux/code/ci/9ce72ea0ade1e70a5561f8103eeb0c67ed726b33/>`_)

- UPD: strace: v 4.9
  (Commit `27d348d6 <http://sourceforge.net/p/kaarpux/code/ci/27d348d6b91d75af9ca0ef25b81bf0097a81f1ec/>`_)

- UPD: libreoffice: v 4.3.1.2
  (Commit `3085df2d <http://sourceforge.net/p/kaarpux/code/ci/3085df2de52011099fe01277ab594c5ec1b88843/>`_)

- UPD: cups: v 1.7.5
  (Commit `87f2d215 <http://sourceforge.net/p/kaarpux/code/ci/87f2d215577db40365a9a5b5e60b3209df5c6530/>`_)

- UPD: libraw1394: v 2.0.5; also change download location to kernel.org
  (Commit `5f108604 <http://sourceforge.net/p/kaarpux/code/ci/5f1086042fafffaac0b7ba9ae5af3cebaa7eb22e/>`_)

- UPD: linux: v 3.16.2
  (Commit `a44d20e0 <http://sourceforge.net/p/kaarpux/code/ci/a44d20e06cab777291ceea4b3ba6f6d1d6d37436/>`_)


Packages added
##############

- ADD: mcelog: log Machine Check Exceptions
  (Commit `a6ee349b <http://sourceforge.net/p/kaarpux/code/ci/a6ee349b814fc222ca70bb7336a7b6b4230f91ba/>`_)

- ADD: i7z: i7 cpu monitoring tool
  (Commit `770d4248 <http://sourceforge.net/p/kaarpux/code/ci/770d4248b0ecf110c03808b7ab922b1a31fc4bfe/>`_)

- ADD: tcllib
  (Commit `aff3c44b <http://sourceforge.net/p/kaarpux/code/ci/aff3c44baa2501a54928609a0e522826d327414f/>`_)


Bugs fixed
##########

- FIX: busybox: properly handle grep -w "^str" in !EXTRA_COMPAT case too
  (Commit `d137cc65 <http://sourceforge.net/p/kaarpux/code/ci/d137cc651b0e0cd96225eb554036c73dc0075fbd/>`_)

- FIX: busybox: do not 'make check' under systemtap
  (Commit `50df5c15 <http://sourceforge.net/p/kaarpux/code/ci/50df5c15252024d6302ef8d8bb6972c427892683/>`_)

- FIX: elfutils: remove failing testcases under systemtap
  (Commit `cfbd0ff5 <http://sourceforge.net/p/kaarpux/code/ci/cfbd0ff5fc0a6ca9d8787def96a23f322ef39d63/>`_)

- FIX: harfbuzz: remove failing testcase
  (Commit `c3a90ad5 <http://sourceforge.net/p/kaarpux/code/ci/c3a90ad53ee204cafbb3efa415238354f4000193/>`_)

- FIX: krb5: We can not test just the libraries, as we are not building the tools
  (Commit `799ed44e <http://sourceforge.net/p/kaarpux/code/ci/799ed44e5ebec794a9bfed4a0f129dee073d0847/>`_)

- FIX: KxBuild: put a lock on haskell package install as parallel install fails
  (Commit `4c66772b <http://sourceforge.net/p/kaarpux/code/ci/4c66772b97b3a5add34b57f7ebcf0532e6e7d74d/>`_)

- FIX: dejagnu: dejagnu tests do not work if STDIN is /dev/null, so create a fifo as STDIN
  (Commit `17d87902 <http://sourceforge.net/p/kaarpux/code/ci/17d879025bc247718c2fec8fecdbce605d493799/>`_)

- FIX: util-linux: correct upstream check
  (Commit `1aafecff <http://sourceforge.net/p/kaarpux/code/ci/1aafecffbe8e854784432a529303fd7324c64bd4/>`_)

- FIX: KxBuild: use static file for lock on haskell package install
  (Commit `82ca9d50 <http://sourceforge.net/p/kaarpux/code/ci/82ca9d505b9b07fc757318b75a01c636b8cafd24/>`_)

- FIX: vim: remove tests: 'make test' does not work without a terminal, and is interactive anyway
  (Commit `e50991c6 <http://sourceforge.net/p/kaarpux/code/ci/e50991c6c364729aeb1f1c9161401b3b4ea9da4c/>`_)

- FIX: KxBuild: correct name of file used for lock on haskell package install
  (Commit `09d6cc2a <http://sourceforge.net/p/kaarpux/code/ci/09d6cc2abf022de3a4965203b396fef68e960d23/>`_)

- FIX: glibc: add --enable-obsolete-rpc (needed by libtirpc)
  (Commit `fee3adfb <http://sourceforge.net/p/kaarpux/code/ci/fee3adfb5b867aca79ba542cef4e63ee46445758/>`_)

- FIX: linux: fix list of files included in initramfs when linux is re-build
  (Commit `b9910791 <http://sourceforge.net/p/kaarpux/code/ci/b991079189e78117bb811ac099df4e055caa9d99/>`_)


Minor Changes
#############

- IMPROVE: busybox: slim configuration
  (Commit `7eb71c58 <http://sourceforge.net/p/kaarpux/code/ci/7eb71c58640710e2ccfb0e94f8ee3cbdbf9a2320/>`_)

- IMPROVE: linux: remove mdev option, as we are not building mdev in busybox anymore
  (Commit `3679e292 <http://sourceforge.net/p/kaarpux/code/ci/3679e292126d757ff578659d5b771c1df09d448a/>`_)

- IMPROVE: KxBuild: do not record systemtap UNKNOWN files
  (Commit `cf72f918 <http://sourceforge.net/p/kaarpux/code/ci/cf72f918ea6e2d472d7e93c0a05bacf1e86acc9c/>`_)

- IMPROVE: KxBuild: add check_repeat tag
  (Commit `aaadbb4e <http://sourceforge.net/p/kaarpux/code/ci/aaadbb4e099e9db3733c8881ce122032d7919322/>`_)

- IMPROVE: haveged libevent make rsync: repeat make check if failing
  (Commit `4c427b1f <http://sourceforge.net/p/kaarpux/code/ci/4c427b1f658b5602cb83fe565f46cfa2d6a2dc1d/>`_)

- IMPROVE: KxBuild: do not let systemd intercept coredumps if we are testing
  (Commit `2f229e27 <http://sourceforge.net/p/kaarpux/code/ci/2f229e27ac04f5f98e95dcf2564c1e81ce1ff87d/>`_)

- MINOR: evolution: do not enable plugins (faster build)
  (Commit `c3e4ccfa <http://sourceforge.net/p/kaarpux/code/ci/c3e4ccfaeb33234131c0a492c5d6a39bac903ef2/>`_)

- IMPROVE: KxBuild: build freetype again after harfbuzz
  (Commit `90c40474 <http://sourceforge.net/p/kaarpux/code/ci/90c4047440edb5ccaccd4633b0f81f5235d46c84/>`_)

- MINOR: KxBuild: move parallel packages for slightly faster build
  (Commit `2fcd7738 <http://sourceforge.net/p/kaarpux/code/ci/2fcd77382fc7b97acd17849466ff2b5e458de5fa/>`_)

- IMPROVE: KxBuild: small script to improve kernel settings for host
  (Commit `0b5422ed <http://sourceforge.net/p/kaarpux/code/ci/0b5422edf9bb12c1b6ac5483450d99eb7a856cb2/>`_)

- IMPROVE: KxBuild: move tcl expect dejagnu to bootstrap_7
  (Commit `64168006 <http://sourceforge.net/p/kaarpux/code/ci/64168006acc3349e057a21dff9626cad7088b8fa/>`_)

- IMPROVE: KxBuild: move which to bootstrap_8
  (Commit `3069310c <http://sourceforge.net/p/kaarpux/code/ci/3069310c24c0514d982371dfa7763fd765f587f7/>`_)

- IMPROVE: KxBuild: move gzip after util-linux as gzip test uses the 'more' command
  (Commit `275cb5fd <http://sourceforge.net/p/kaarpux/code/ci/275cb5fdff1f9cbd4c2401376a5dad6b8d9b7b62/>`_)

- MINOR: ldns: simplify configure and build instructions
  (Commit `b45136dc <http://sourceforge.net/p/kaarpux/code/ci/b45136dc612b05af5f3a05724e61f8819f20336b/>`_)

- IMPROVE: patch: need BASH shell for 'make check'
  (Commit `17c95045 <http://sourceforge.net/p/kaarpux/code/ci/17c95045aefd5301f6912515d51c7108c6bc1052/>`_)

- IMPROVE: procps-ng: fix 'make check'
  (Commit `3c0f0908 <http://sourceforge.net/p/kaarpux/code/ci/3c0f0908b3cff141f59bc2d673a17f6d7e20c2d2/>`_)

- IMPROVE: util-linux: better configure options
  (Commit `6531c072 <http://sourceforge.net/p/kaarpux/code/ci/6531c0725a339d6dffc5e593c540188cc3bd3241/>`_)

- IMPROVE: util-linux: add testing
  (Commit `95f06f8e <http://sourceforge.net/p/kaarpux/code/ci/95f06f8eec7283569e76ff028589f8c2df19d0e7/>`_)

- IMPROVE: KxTools: kx_old: show packages sorted by the date they have been updated
  (Commit `4138fd12 <http://sourceforge.net/p/kaarpux/code/ci/4138fd1258bd0e96a83f4debb6434d0f78dfc909/>`_)

- REMOVE: nss-myhostname: now provided by systemd
  (Commit `d9cac582 <http://sourceforge.net/p/kaarpux/code/ci/d9cac582ba1e7bda53878c8fb4c5751213f3a041/>`_)

- MINOR: temporarily disable pwsafe
  (Commit `70d45b29 <http://sourceforge.net/p/kaarpux/code/ci/70d45b29bce9308af1535028b910964b3ed31b09/>`_)

- IMPROVE: KxTools: kx_ver_wiz: show patches in package file being updated
  (Commit `83d41674 <http://sourceforge.net/p/kaarpux/code/ci/83d416742d82f07ea0c39de9dd1ce21f673b3388/>`_)

- IMPROVE: enchant: better upstream url
  (Commit `a03f629e <http://sourceforge.net/p/kaarpux/code/ci/a03f629e8bb71b425e4a5fd59c2b197284496b8c/>`_)

- MINOR: geoclue: better upstream version check
  (Commit `7d51b199 <http://sourceforge.net/p/kaarpux/code/ci/7d51b199e05e1b8f7a70e7e0f19bed17f0bef51b/>`_)

- DOC: iproute2: note that test-suite is borked
  (Commit `734cd1ec <http://sourceforge.net/p/kaarpux/code/ci/734cd1ec3e52ecf325a0b883ffeb7e932dd36061/>`_)

- DOC: psmisc: note that 'make check' does nothing
  (Commit `bf29ee2e <http://sourceforge.net/p/kaarpux/code/ci/bf29ee2eb6edb9d49052ad1378000a60f86ea00b/>`_)

- DOC: KaarPux: updated CVE info
  (Commit `cc4d6744 <http://sourceforge.net/p/kaarpux/code/ci/cc4d6744cb20e5b2ac5e776892adf991caba29fd/>`_)

- DOC: KaarPux: removed duplicates from CVE info
  (Commit `f7cf7074 <http://sourceforge.net/p/kaarpux/code/ci/f7cf7074067590c3f1a7ae7e57c3649471e19d86/>`_)

- DOC: KaarPux: updated CVE info
  (Commit `7fa1404f <http://sourceforge.net/p/kaarpux/code/ci/7fa1404fbf580d73d93d2b1e3754d8cd8a726bd2/>`_)


