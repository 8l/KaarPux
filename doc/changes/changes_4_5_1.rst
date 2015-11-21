.. 
   KaarPux: http://kaarpux.kaarposoft.dk
   Copyright (C) 2015: Henrik Kaare Poulsen
   License: http://kaarpux.kaarposoft.dk/license.html

.. _changes_4_5_1:


================================
Changes in KaarPux version 4.5.1
================================


:program:`KaarPux` version ``4.5.1`` released on ``2014-jun-22``

- icedtea (java) v 2.5.0

- Improved handling of CVE: Common Vulnerabilities and Exposures

- Packages added (libspectre, dialog, codelite)

- Packages updated

- Other additions, corrections, and improvements


icedtea (java) updated
######################

- UPD: icedtea7: v 2.5.0
  (Commit `054b29b6 <http://sourceforge.net/p/kaarpux/code/ci/054b29b65d5639cb9d25cef4f3277011d3a9f1da/>`_)


improved handling of CVE: Common Vulnerabilities and Exposures
##############################################################

- IMPROVE: KxTools: improved handling of CVE: Common Vulnerabilities and Exposures
  (Commit `e6fb30fa <http://sourceforge.net/p/kaarpux/code/ci/e6fb30fa92571340a61a8a38c9f416bf4f155006/>`_)

- DOC: cve.pl: allow more than one URL/COMMIT in cve_list.txt
  (Commit `ce7b6fa9 <http://sourceforge.net/p/kaarpux/code/ci/ce7b6fa97c7e7391e83a091d98b70523e36c0a6f/>`_)


Packages added
##############

- ADD: libspectre: PostScript rendering for evince
  (Commit `25cab8d9 <http://sourceforge.net/p/kaarpux/code/ci/25cab8d908ffbd13dd4693dac39ec39a8c4026c5/>`_)

- ADD: dialog: script-interpreter which provides a set of curses widgets
  (Commit `2da14d39 <http://sourceforge.net/p/kaarpux/code/ci/2da14d39c3e46dfeeebc045f1519636d38d8abac/>`_)

- ADD: codelite: enable again
  (Commit `d2c22437 <http://sourceforge.net/p/kaarpux/code/ci/d2c22437b1590a86afc04fb4e89fc28d819fda70/>`_)

- UPD: codelite: v 6.0.1
  (Commit `2a1be343 <http://sourceforge.net/p/kaarpux/code/ci/2a1be3431ed6f1c2c820a3bdcdf45b32ae207c5d/>`_)

- FIX: wxWidgets: patch for isnan (codelite build fails otherwise)
  (Commit `d6233627 <http://sourceforge.net/p/kaarpux/code/ci/d623362747ce35faec6798a4f597aa30edd41203/>`_)

- FIX: codelite: correct build instructions
  (Commit `bd9c9f69 <http://sourceforge.net/p/kaarpux/code/ci/bd9c9f6962283afa3aa33bc22a9586e3b8721e5b/>`_)


Packages updated
################

- UPD: icu: v 53.1
  (Commit `f94a7c20 <http://sourceforge.net/p/kaarpux/code/ci/f94a7c209046b8da8148082c8d5dfc6a6df7f5f4/>`_)

- FIX: libreoffice: patches for ICU 53.1
  (Commit `3eaa0e08 <http://sourceforge.net/p/kaarpux/code/ci/3eaa0e084897a01552f6b710cf775533fc1fe76a/>`_)

- UPD: libpng: v 1.6.12
  (Commit `f8d8f97c <http://sourceforge.net/p/kaarpux/code/ci/f8d8f97ca6bab6558c5ee31f5e1a71daeb178379/>`_)

- UPD: libjpeg-turbo: v 1.3.1
  (Commit `c4c8a1f4 <http://sourceforge.net/p/kaarpux/code/ci/c4c8a1f4eaf5bbd3964196f294d48aaf7235e97f/>`_)

- UPD: tzdata: v 2014e
  (Commit `c3cb9882 <http://sourceforge.net/p/kaarpux/code/ci/c3cb98821f99bca14a616e1a2130678da76fc564/>`_)

- UPD: gpgme: v 1.5.0
  (Commit `85eccf51 <http://sourceforge.net/p/kaarpux/code/ci/85eccf51e4218d9ae6db6e1e11beb8aace450439/>`_)

- UPD: libclc: latest git version
  (Commit `430a5888 <http://sourceforge.net/p/kaarpux/code/ci/430a588886fe10c7fabf2f5158ec82c6858ebe6f/>`_)

- UPD: linux: v 3.15.1
  (Commit `b61bd451 <http://sourceforge.net/p/kaarpux/code/ci/b61bd451c8bfb728471e7093c4f6e68cabe30ea5/>`_)

- UPD: wireshark: v 1.10.8
  (Commit `bbb92ca7 <http://sourceforge.net/p/kaarpux/code/ci/bbb92ca7abe1089bb5c6a9809c434315c7c75aa3/>`_)

- UPD: wxWidgets: v 3.0.1
  (Commit `6543f601 <http://sourceforge.net/p/kaarpux/code/ci/6543f6019dc86d60c3011306ca0f1f24b6e77ded/>`_)


Minor Changes
#############

- FIX: wpa_supplicant: support both old and new DBus interface
  (Commit `219b3c45 <http://sourceforge.net/p/kaarpux/code/ci/219b3c45f63374dc500e7a2ead4988c5048af851/>`_)

- MINOR: gnome-keyring: correct installed version check
  (Commit `6b11d470 <http://sourceforge.net/p/kaarpux/code/ci/6b11d4703e54bb678420aba09c125b5d628a8ba7/>`_)

- MINOR: \*: improved upstream version check
  (Commit `630ee976 <http://sourceforge.net/p/kaarpux/code/ci/630ee97656bb187ef370c5982bd334ecc48f44aa/>`_)

- IMPROVE: libevent: move to linux_base (for mozilla to pick up)
  (Commit `1fa972db <http://sourceforge.net/p/kaarpux/code/ci/1fa972db611b221fa793be4f320bf7274b936d72/>`_)

- IMPROVE: firefox: use system icu, libevent, cairo, gstreamer
  (Commit `a1ebc71f <http://sourceforge.net/p/kaarpux/code/ci/a1ebc71f38fa9ec3d2d40c472c7a4ab59fcd7e64/>`_)

- IMPROVE: firefox: --enable-gold
  (Commit `a53aa8fa <http://sourceforge.net/p/kaarpux/code/ci/a53aa8fa3b3c764135f40559d9fc6c43c08651ed/>`_)

- IMPROVE: thunderbird: use system cairo
  (Commit `f8f9e01c <http://sourceforge.net/p/kaarpux/code/ci/f8f9e01c248f2382157ca43840c74c57d77c401e/>`_)

- IMPROVE: WebKit: Building WebKit in parallel (make -jNN) seems seriously borked, So try to build in parallel a couple of times
  (Commit `9a16721b <http://sourceforge.net/p/kaarpux/code/ci/9a16721b130b1b4146b8c064ac430fbba00f6f2a/>`_)

- IMPROVE: WebKit: slightly improved configure options
  (Commit `a83ee012 <http://sourceforge.net/p/kaarpux/code/ci/a83ee0127f4b47003efccfe9c421bbf1f6bf4b68/>`_)

- IMPROVE: WebKit: compile with clang/llvm
  (Commit `2794931c <http://sourceforge.net/p/kaarpux/code/ci/2794931cd72f7d9e54011dc33952bb3eb47d677d/>`_)

- IMPROVE: wpa_supplicant: move CONFIG_* to .config file
  (Commit `f3310fc4 <http://sourceforge.net/p/kaarpux/code/ci/f3310fc467c058ad50a56e548ace1ace1b77f89d/>`_)

- REMOVE: liboil: deprecated; replaced by orc
  (Commit `3eb805a1 <http://sourceforge.net/p/kaarpux/code/ci/3eb805a1bb7af6aa10a07b56f37f03202ee32829/>`_)

- IMPROVE: wxWidgets: add tests (TODO: investigate failures)
  (Commit `15488e3f <http://sourceforge.net/p/kaarpux/code/ci/15488e3ff2075902ffcc525eace281402a46edf1/>`_)

- DOC: icedtea7: add info on versions
  (Commit `db31a778 <http://sourceforge.net/p/kaarpux/code/ci/db31a778bcdd6244a8cb55107bc4491354eb6264/>`_)

- DOC: KaarPux: updated CVE info
  (Commit `68971718 <http://sourceforge.net/p/kaarpux/code/ci/68971718540e7d30a63eceb8ab906c85b63880b6/>`_)

- DOC: KaarPux: fix typos in CVE info
  (Commit `2458e913 <http://sourceforge.net/p/kaarpux/code/ci/2458e91347c73b94906911ae80e88712ea046cb9/>`_)


