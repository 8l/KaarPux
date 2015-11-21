.. 
   KaarPux: http://kaarpux.kaarposoft.dk
   Copyright (C) 2015: Henrik Kaare Poulsen
   License: http://kaarpux.kaarposoft.dk/license.html

.. _changes_4_5_5:


================================
Changes in KaarPux version 4.5.5
================================


:program:`KaarPux` version ``4.5.5`` released on ``2014-aug-27``

- OpenVAS improved

- haskell 7.8.3

- Bugs fixed

- Packages updated

- Minor Changes


OpenVAS improved
################

IMPROVE: openvas-\*: better install, better post-install
========================================================

Commit `a08ef2d4 <http://sourceforge.net/p/kaarpux/code/ci/a08ef2d49a4aa3152c907f4eb635530d2bb8bc0c/>`_

- create the "openvas" user during install

- change ownership of relevant files to "openvas" during install

- install static files during install (OpenVAS_TI.asc and configuration files)

- put pid-files in /run/user/XXX

- streamline generation of GPG keyring

- improve post-install documentation accordingly

- add features to "pretend" to be another Linux distro (thus potentially catching more vulnerabilities)


haskell 7.8.3
#############

UPD: \*: haskell v 7.8.3; haskell-platform v 2014.2.0.0
=======================================================

Commit `00022237 <http://sourceforge.net/p/kaarpux/code/ci/00022237bd45796f207cb58bf261e5a8d0dde0da/>`_

- Updated ghc-binary and ghc to version 7.8.3

- Improved build options for ghc

- Updated haskell-platform to version 2014.2.0.0

- Due to cyclic dependency on Cabal, do not install haskell-platform itself, but install the individual modules instead

- Update haskell modules installed in addition to haskell-platform

- Update bustle to version 0.4.7

- Additional haskell modules as required by new version of bustle

- Better check of upstream version of haskell modules

- Better log output from build and install scripts

- Minor fix in ncurses to call library libtinfo (needed by ghc-binary)


Bugs fixed
##########

- FIX: KxBuild: move sqlite before Python2
  (Commit `2d64925d <http://sourceforge.net/p/kaarpux/code/ci/2d64925d73cf979cd7d4fa9be8a1ef5aa57a4310/>`_)

- FIX: make_package_scripts: only delete install directory in install phase
  (Commit `b2ec44d4 <http://sourceforge.net/p/kaarpux/code/ci/b2ec44d4743eeeed11fe4dc89e49cbf8a1b4262a/>`_)

- FIX: firefox: add package file check_spidermonkey_style.py missed in checkin 437bd3cc
  (Commit `1c0d6922 <http://sourceforge.net/p/kaarpux/code/ci/1c0d692280f9b59546e436a5bc7c3dad44d8df29/>`_)

- FIX: openvas-libraries: correct malloc for ovas_scanner_context
  (Commit `d90c5018 <http://sourceforge.net/p/kaarpux/code/ci/d90c5018826b0ce01327178142f63aab9d8183cd/>`_)

- FIX: openvas-scanner: do not use file descriptor 3
  (Commit `b9ff0ed1 <http://sourceforge.net/p/kaarpux/code/ci/b9ff0ed1239c4db47b6b1e3d6fdad53df1219865/>`_)

- FIX: KxBuild: correct check for USE_TMPFS in dangerous_build_bootstrap
  (Commit `be2a8041 <http://sourceforge.net/p/kaarpux/code/ci/be2a8041260490c8d7ab016f253e884c996d83c7/>`_)


Packages updated
################

- UPD: mercurial: v 3.1
  (Commit `2499f7eb <http://sourceforge.net/p/kaarpux/code/ci/2499f7ebdcd0d63b0e81467205dec8cd9a3140a2/>`_)

- UPD: openvas-\*: update to latest version
  (Commit `5ca5ea96 <http://sourceforge.net/p/kaarpux/code/ci/5ca5ea96323e371fd8332febb459268d6b39d17b/>`_)

- UPD: greenbone-security-assistant: v 5.0.2
  (Commit `dd3c1196 <http://sourceforge.net/p/kaarpux/code/ci/dd3c11966c7f37882e5a0cc885d414d9f8b8d8ba/>`_)

- UPD: linux: v 3.16.1
  (Commit `8bf0ed51 <http://sourceforge.net/p/kaarpux/code/ci/8bf0ed51d2f0e52859c29f55351ad0988a9e95a7/>`_)

- UPD: samba: v 4.1.11
  (Commit `2b55f5e9 <http://sourceforge.net/p/kaarpux/code/ci/2b55f5e9cdc1b4418865bd93ab37f722ed598bb1/>`_)

- UPD: libtasn1: v 4.0
  (Commit `7881782c <http://sourceforge.net/p/kaarpux/code/ci/7881782cd38010eff5a1260b34e5160c32747960/>`_)

- UPD: gnupg: v 2.0.26
  (Commit `7ff1307e <http://sourceforge.net/p/kaarpux/code/ci/7ff1307e1b748e15814e52656faf6921c26eb60e/>`_)

- UPD: gpgme: v 1.5.1
  (Commit `25141932 <http://sourceforge.net/p/kaarpux/code/ci/251419327aa77962d6b0c689fcc234ecca10d6e5/>`_)

- UPD: nss: v 3.17
  (Commit `e5294690 <http://sourceforge.net/p/kaarpux/code/ci/e52946905070a68891e93e10bdeded2b233e14d1/>`_)

- UPD: flash_player_11: v 11.2.202.400
  (Commit `7623514f <http://sourceforge.net/p/kaarpux/code/ci/7623514fb33e323b7dec2d5dc986e68185a1f978/>`_)

- UPD: icedtea-web: v 1.5.1
  (Commit `f18328ca <http://sourceforge.net/p/kaarpux/code/ci/f18328ca21c06dae412ba2d0c53a95179324909a/>`_)

- UPD: libXext: v 1.3.3
  (Commit `9bcd1918 <http://sourceforge.net/p/kaarpux/code/ci/9bcd19180fd528c837d4a4dd2307a301f7a3badd/>`_)

- UPD: xcb-proto libxcb: v 1.11
  (Commit `db4dfd1c <http://sourceforge.net/p/kaarpux/code/ci/db4dfd1cf8266e92c1d5b31fe908cf885ef5263e/>`_)

- UPD: xf86-video-qxl: v 0.1.2
  (Commit `acd17266 <http://sourceforge.net/p/kaarpux/code/ci/acd17266beccb5021ab974b555d3a9c89a8e5e4a/>`_)

- UPD: MesaLib: v 10.2.6
  (Commit `8a61359b <http://sourceforge.net/p/kaarpux/code/ci/8a61359b574fe3304350eae27783dacca8ea215b/>`_)

- UPD: glew:v 1.11.0
  (Commit `f138e21a <http://sourceforge.net/p/kaarpux/code/ci/f138e21aa3d8d7d00af65108048e0a0923ccbbc5/>`_)

- UPD: pango: v 1.36.6
  (Commit `9da84d0d <http://sourceforge.net/p/kaarpux/code/ci/9da84d0decc55e0be72b81738e2ebfa0ae0aebe5/>`_)

- UPD: poppler: v 0.26.3
  (Commit `a6ee2e4c <http://sourceforge.net/p/kaarpux/code/ci/a6ee2e4c0cbcd963e591bb0dcce4e52432256921/>`_)

- UPD: poppler-data: v 0.4.7
  (Commit `404ca56d <http://sourceforge.net/p/kaarpux/code/ci/404ca56da749bf34e06bcd1392a5262e0ce3c76d/>`_)

- UPD: harfbuzz: v 0.9.35
  (Commit `5fe117d6 <http://sourceforge.net/p/kaarpux/code/ci/5fe117d66dbfecb245a7077eb209a47d857a4ebd/>`_)

- UPD: krb5: v 1.12.2
  (Commit `7eb4b073 <http://sourceforge.net/p/kaarpux/code/ci/7eb4b073faf9c45fa3a26d7dbd06a9146c00f45f/>`_)

- UPD: wireshark: v 1.12.0
  (Commit `6e775fd0 <http://sourceforge.net/p/kaarpux/code/ci/6e775fd0cf0aa784ac4a33f1fb839cb3f0c85094/>`_)

- UPD: coq: v 8.4pl4
  (Commit `5abffad9 <http://sourceforge.net/p/kaarpux/code/ci/5abffad918b19441b600a59ff732511b8abf5f3b/>`_)

- UPD: certdata: v 5b8de9e4c2ea
  (Commit `14c2a0d3 <http://sourceforge.net/p/kaarpux/code/ci/14c2a0d3467d984676d4c264552d7566919fe26b/>`_)

- UPD: gnutls: v 3.3.7
  (Commit `cdf1799c <http://sourceforge.net/p/kaarpux/code/ci/cdf1799cc35e9010c9785f9f67d6290c225782fa/>`_)


Minor Changes
#############

- IMPROVE: common_functions: enable getting package file into specified destination
  (Commit `8cfab8e1 <http://sourceforge.net/p/kaarpux/code/ci/8cfab8e12f14d8c2e2d8b00b39a3ab9cabb9c424/>`_)

- IMPROVE: firefox: --enable-llvm-hacks
  (Commit `788897ac <http://sourceforge.net/p/kaarpux/code/ci/788897ac4ad24b8981fcc77857887a0c6c777dae/>`_)

- IMPROVE: firefox: configure with --enable-tests unless ${KX_DISABLE_TEST}
  (Commit `0bd7e24a <http://sourceforge.net/p/kaarpux/code/ci/0bd7e24a731b37869c47a7c8b69375c105e8c525/>`_)

- IMPROVE: firefox: add test, but TODO: fix failing testcases and mochitest
  (Commit `374cdcc9 <http://sourceforge.net/p/kaarpux/code/ci/374cdcc9e2666e20185bcdebc887ee3a7a5553b1/>`_)

- REMOVE: pysqlite: now included in Python2
  (Commit `1de021b4 <http://sourceforge.net/p/kaarpux/code/ci/1de021b4097b3eea5d78899c57b5bd2e619dba7c/>`_)

- IMPROVE: \*: make check
  (Commit `94439dac <http://sourceforge.net/p/kaarpux/code/ci/94439dac545940c3087f630154da27437c3b8c73/>`_)

- IMPROVE: KxBuild: better parallelism in opt_programming to reduce build-time
  (Commit `1b624e79 <http://sourceforge.net/p/kaarpux/code/ci/1b624e797643b09b2555e9db1d7a1e11d965c6e8/>`_)

- IMPROVE: OpenVAS: rename KaarPux packages to (Fedora) dpkg names
  (Commit `0ef07e9e <http://sourceforge.net/p/kaarpux/code/ci/0ef07e9e0cdbbed325939733cec3ebc67b6d0caf/>`_)

- IMPROVE: KxBuild: add dangerous_install_remote.sh for copying kaarpux to remote machine
  (Commit `a3fb022a <http://sourceforge.net/p/kaarpux/code/ci/a3fb022ad33dacb99b0058c50d26b723472108d4/>`_)

- DOC: thunderbird: TODO: add testcases, when we have fixed firefox testcases
  (Commit `9ed6db80 <http://sourceforge.net/p/kaarpux/code/ci/9ed6db802ac53f7122b82d61aefe2875fe4fcede/>`_)

- DOC: \*: note that package has no testsuite
  (Commit `252487d6 <http://sourceforge.net/p/kaarpux/code/ci/252487d6429977071f2a7cf575b242d84be9cf64/>`_)

- DOC: KaarPux: updated CVE info
  (Commit `5eaa53b7 <http://sourceforge.net/p/kaarpux/code/ci/5eaa53b7af59507a696f22858d7e1e3a37c3f091/>`_,
  Commit `bd3fa7f1 <http://sourceforge.net/p/kaarpux/code/ci/bd3fa7f1b1e0c4e18dd0fbd6f07bb80a5d865054/>`_)


