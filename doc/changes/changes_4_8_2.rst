.. 
   KaarPux: http://kaarpux.kaarposoft.dk
   Copyright (C) 2015: Henrik Kaare Poulsen
   License: http://kaarpux.kaarposoft.dk/license.html

.. _changes_4_8_2:


================================
Changes in KaarPux version 4.8.2
================================


:program:`KaarPux` version ``4.8.2`` released on ``2015-jan-26``

- Firefox: EFF Privacy Badger

- Xorg improved

- libsndfile build from git

- Bugs fixed

- Many packages updated - including security updates

- Documentation Changes


Firefox: EFF Privacy Badger
###########################

- REMOVE: adblockplus ghostery noscript
  (Commit `9edb49f7 <http://sourceforge.net/p/kaarpux/code/ci/9edb49f7f40e97deec0152639152b43bd54d3907/>`_)

- ADD: addon-sdk: Firefox add-on SDK (prereq for Privacy Badger)
  (Commit `d3f96f72 <http://sourceforge.net/p/kaarpux/code/ci/d3f96f7287b10948f8c4187ed4a58f061a8653f4/>`_)

- ADD: privacybadgerfirefox: Firefox add-on that blocks spying ads and invisible trackers
  (Commit `c85a9e15 <http://sourceforge.net/p/kaarpux/code/ci/c85a9e156a9efe5ae470eacd6db60f243cce41aa/>`_)


Xorg improved
#############

- FIX: linux: drm/i915: Disallow pin ioctl completely for kms drivers
  (Commit `0e20b351 <http://sourceforge.net/p/kaarpux/code/ci/0e20b351778683c8f684af77477b0dad54cc822f/>`_)

- FIX: xf86-video-intel: Fix crash in startup due to un-initialized variables
  (Commit `366a30c8 <http://sourceforge.net/p/kaarpux/code/ci/366a30c86fa92a990e7066105a1e4ade910d6852/>`_)

- ADD: libepoxy: A library for handling OpenGL function pointer management
  (Commit `c5a17575 <http://sourceforge.net/p/kaarpux/code/ci/c5a17575dde558f014abd92c5d4336b8bc4dbd3a/>`_)

- IMPROVE: xorg-server: use -O2 optimization
  (Commit `461f9cf1 <http://sourceforge.net/p/kaarpux/code/ci/461f9cf1ea0509bfb34cfb0d1333ef7448a35f9c/>`_)

- IMPROVE: xorg-server: --enable-glamor
  (Commit `e4361e77 <http://sourceforge.net/p/kaarpux/code/ci/e4361e77dace09e3eb6ea940e9efef214497147c/>`_)


libsndfile build from git
#########################

- ADD: libunistring libatomic_ops gc guile autogen (for building libsndfile from git)
  (Commit `650b2cf8 <http://sourceforge.net/p/kaarpux/code/ci/650b2cf8d277df2b8ae60b38193280cb50cd40d3/>`_)

- UPD: libsndfile: from git head
  (Commit `0d51c813 <http://sourceforge.net/p/kaarpux/code/ci/0d51c813ac99ae57017adafb3d070aedf87c877a/>`_)


Bugs fixed
##########

- FIX: Python: Fix failing testcases
  (Commit `1fd0b592 <http://sourceforge.net/p/kaarpux/code/ci/1fd0b592d421b643af1361ab3ef37f207e739c14/>`_)

- FIX: parted: most tests requires 'root', so disable for now
  (Commit `609d78b2 <http://sourceforge.net/p/kaarpux/code/ci/609d78b29c9ce45acb2e18594182707bd757acb2/>`_)

- FIX: mpfr: CVE-2014-9474 mpfr: buffer overflow in mpfr_strtofr
  (Commit `7e56af08 <http://sourceforge.net/p/kaarpux/code/ci/7e56af082e3f27593074705e86b343f59721cb57/>`_)


Packages updated
################

- UPD: firefox: v 35.0
  (Commit `c83be192 <http://sourceforge.net/p/kaarpux/code/ci/c83be1926416636efaf150d664b8cea125ad1d65/>`_)

- UPD: thunderbird: v 31.4.0
  (Commit `35f37f29 <http://sourceforge.net/p/kaarpux/code/ci/35f37f2977442de84d9e76346bf632e9b0e892d9/>`_)

- UPD: libpng: v 1.6.16
  (Commit `1089c057 <http://sourceforge.net/p/kaarpux/code/ci/1089c057005f5e190d1cde58eb392a06d9190fa9/>`_)

- UPD: wireshark: v 1.12.3
  (Commit `a5a5c811 <http://sourceforge.net/p/kaarpux/code/ci/a5a5c811cb8461f220a6088b2acd61865fc8d858/>`_)

- UPD: openssl: v 1.0.1l
  (Commit `f60ee52a <http://sourceforge.net/p/kaarpux/code/ci/f60ee52aa4c55347429c1cb364318f40c37f43f0/>`_)

- UPD: curl: v 7.40.0
  (Commit `3b750bf2 <http://sourceforge.net/p/kaarpux/code/ci/3b750bf25785f8ced8c9c12794ed8d2e8b058741/>`_)

- UPD: linux: v 3.18.3
  (Commit `bc0df9d6 <http://sourceforge.net/p/kaarpux/code/ci/bc0df9d67cde34fd9d8921f32f12465c557bd712/>`_)

- UPD: samba: v 4.1.16
  (Commit `82db4de5 <http://sourceforge.net/p/kaarpux/code/ci/82db4de5e467a1ecf9fcc468b8e5a4695ae27640/>`_)

- UPD: systemtap: v 2.7-0.156.g7cd3311e3288
  (Commit `9bd376e6 <http://sourceforge.net/p/kaarpux/code/ci/9bd376e67156b6be550cf8417dd46b652779dcdf/>`_)

- UPD: gnutls: v 3.3.12
  (Commit `b51ba9d3 <http://sourceforge.net/p/kaarpux/code/ci/b51ba9d3ce71d3d1688d24cfa456970d584c42c9/>`_)

- UPD: icedtea7: v 2.5.4: Java 7 update 75 with january security patches
  (Commit `f957eb02 <http://sourceforge.net/p/kaarpux/code/ci/f957eb029237639208b05d8f0552a7c854c2d839/>`_)

- UPD: nspr: v 4.10.8
  (Commit `a1b39c8e <http://sourceforge.net/p/kaarpux/code/ci/a1b39c8e0ea3a9b62c04d91eaf796cc42265780b/>`_)

- UPD: file: v 5.22
  (Commit `5609a7a2 <http://sourceforge.net/p/kaarpux/code/ci/5609a7a20c6da48f065aaf224f28e22c69d6649a/>`_)

- UPD: pigz: v 2.3.3
  (Commit `e88172ae <http://sourceforge.net/p/kaarpux/code/ci/e88172ae8fb229e31ef19612c82572f7ba39df85/>`_)

- UPD: patch: v 2.7.3
  (Commit `95365ec8 <http://sourceforge.net/p/kaarpux/code/ci/95365ec89dc59ce218c88a038bdde239f08edb1b/>`_)

- UPD: flash_player_11: v 11.2.202.438
  (Commit `11eb572a <http://sourceforge.net/p/kaarpux/code/ci/11eb572a2e371c13609805b067bd177c13eb7a73/>`_,
  `e24ba5d0 <http://sourceforge.net/p/kaarpux/code/ci/e24ba5d01720a53e10e49892a7417491347821fb/>`_)


Documentation Changes
#####################

- DOC: KaarPux: updated CVE info
  (Commit `90c1601a <http://sourceforge.net/p/kaarpux/code/ci/90c1601aafdb1ba0f322f35db73675e288606d46/>`_
  ,
  `4abe08f0 <http://sourceforge.net/p/kaarpux/code/ci/4abe08f029a4734ef0619105bf1ffb856a432507/>`_)


