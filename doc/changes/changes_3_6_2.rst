.. 
   KaarPux: http://kaarpux.kaarposoft.dk
   Copyright (C) 2015: Henrik Kaare Poulsen
   License: http://kaarpux.kaarposoft.dk/license.html

.. _changes_3_6_2:


================================
Changes in KaarPux version 3.6.2
================================


:program:`KaarPux` version ``3.6.2`` released on ``2013-may-02``

- Bugs fixed

- Packages updated

- Test cases added


Bugs fixed
##########

- FIX: create_dirs: libstdc++ in /tools; dummy hosts file
  (Commit `d2c6501a <http://sourceforge.net/p/kaarpux/code/ci/d2c6501a5ec5f21f617dbd705fcbae95f0861190/>`_)

- FIX: make_package_scripts: do not tee 'make check' output; the return code from test gets lost
  (Commit `22c9f4ff <http://sourceforge.net/p/kaarpux/code/ci/22c9f4ff60b00af0b8844f19b0f2c8a25e157eb4/>`_)

- FIX: elfutils: upstream patches
  (Commit `f6c979c7 <http://sourceforge.net/p/kaarpux/code/ci/f6c979c7d4a013b0c3c05c4cd0fb0ce778ef1733/>`_)

- FIX: junit: move to correct subdirectory
  (Commit `00cc6023 <http://sourceforge.net/p/kaarpux/code/ci/00cc6023efeeb9d8f776feb73c139c9c41b5b57d/>`_)

- FIX: icedtea-cacerts: move files to the correct icedtea directory
  (Commit `7b63a846 <http://sourceforge.net/p/kaarpux/code/ci/7b63a84659bce9667878a72c592fbf42faffad26/>`_)

- FIX: alsa-plugins: move alsa-plugins after pulseaudio
  (Commit `f375b17a <http://sourceforge.net/p/kaarpux/code/ci/f375b17ab5c23346bf0463c8e7028c81ddd2925a/>`_)


Packages updated
################

- UPD: bison: v 2.7.1
  (Commit `0e854cb1 <http://sourceforge.net/p/kaarpux/code/ci/0e854cb1c700525eb574589fa39f44beb126994c/>`_)

- UPD: flex: v 2.5.37
  (Commit `c7d83735 <http://sourceforge.net/p/kaarpux/code/ci/c7d837354b1839b23955d42b05c97157c522fac6/>`_)

- UPD: glibc: v 2.17; handle missing bash at build time; remove i386 support
  (Commit `352a8142 <http://sourceforge.net/p/kaarpux/code/ci/352a8142ef585da391f8b04b9e0ec54d3c115f75/>`_)

- UPD: gzip: upstream patches
  (Commit `f8b631f8 <http://sourceforge.net/p/kaarpux/code/ci/f8b631f82c5f039cd230f5232e0952ec869cc8c1/>`_)

- UPD: Python2: v 2.7.4
  (Commit `7693b295 <http://sourceforge.net/p/kaarpux/code/ci/7693b29529a3ebecde082ac29aaeba8895dd1f05/>`_)

- UPD: boost: v 1.53.0
  (Commit `239a9956 <http://sourceforge.net/p/kaarpux/code/ci/239a995659fc97423caec923d5d88f0585cdaba2/>`_)

- FIX: libreoffice: upstream patches to make LO work with boost 1.53
  (Commit `304c8c90 <http://sourceforge.net/p/kaarpux/code/ci/304c8c90a67320d47a527c6cc94e482ee2d3ff39/>`_)

- UPD: dosfstools: v 3.0.16
  (Commit `f34cc656 <http://sourceforge.net/p/kaarpux/code/ci/f34cc65664f27843d9d6bc203651ad5bf77e397d/>`_)

- UPD: krb5: v 1.11.2
  (Commit `f2b77232 <http://sourceforge.net/p/kaarpux/code/ci/f2b77232f05afdaba59d046c8516d4c0a5bb3b32/>`_)

- UPD: libpng: v 1.6.2
  (Commit `3928a875 <http://sourceforge.net/p/kaarpux/code/ci/3928a875d3ac4c90d485af99724d94425419b1bf/>`_)

- UPD: lsof: v 4.87
  (Commit `629e2a66 <http://sourceforge.net/p/kaarpux/code/ci/629e2a6602538acddd1fe571bf3610c50ccfa75f/>`_)

- UPD: nasm: v 2.10.07
  (Commit `14c9f19f <http://sourceforge.net/p/kaarpux/code/ci/14c9f19f4f331a6d04acc17122ee129e5fd9ecf0/>`_)

- UPD: Python: v 3.3.1
  (Commit `1edd909c <http://sourceforge.net/p/kaarpux/code/ci/1edd909c38eae4404e7e6191a7dfcf9f5d38d1ca/>`_)

- UPD: qemu: v 1.4.1
  (Commit `249364e0 <http://sourceforge.net/p/kaarpux/code/ci/249364e0f5764ac09df2adcc9f536142fcc3a1d4/>`_)

- UPD: curl: v 7.30.0
  (Commit `c9d49aef <http://sourceforge.net/p/kaarpux/code/ci/c9d49aefde93d9bba0b58e145130683c89e4fbf7/>`_)

- UPD: net-snmp: v 5.7.2
  (Commit `2c25641d <http://sourceforge.net/p/kaarpux/code/ci/2c25641d067208ebcb9e009fa7260311cb8e6655/>`_)

- UPD: ruby: v 1.9.3-p392
  (Commit `c2235202 <http://sourceforge.net/p/kaarpux/code/ci/c2235202d2ea33e48817945594c2b7893d7f3129/>`_)

- UPD: cairo: v 1.12.8
  (Commit `6ad5bce5 <http://sourceforge.net/p/kaarpux/code/ci/6ad5bce510e39f37deeabd728a1e945498fc6247/>`_)

- UPD: valgrind: v 3.8.1; and patch for glibc 2.17 support
  (Commit `f2e4dbba <http://sourceforge.net/p/kaarpux/code/ci/f2e4dbba5fdf0abb1147b26e3353b326a205e53e/>`_)

- UPD: glib: 2.36.1
  (Commit `1725489b <http://sourceforge.net/p/kaarpux/code/ci/1725489b1ee30d23610e862c8e14267134546ddf/>`_)

- UPD: dbus: v 1.7.2
  (Commit `d0ce8a46 <http://sourceforge.net/p/kaarpux/code/ci/d0ce8a46c2f0147e8342f03f516784ab50936076/>`_)

- UPD: libarchive: v 3.1.2
  (Commit `834ebbbe <http://sourceforge.net/p/kaarpux/code/ci/834ebbbeba11df0a14d29871871488b9341bb8a8/>`_)

- UPD: telepathy-glib: v 0.20.2
  (Commit `582c8e9b <http://sourceforge.net/p/kaarpux/code/ci/582c8e9bfdd94a67032919bc7c9c51585dec8d1f/>`_)

- UPD: libgcrypt: v 1.5.2
  (Commit `5d8ff2e7 <http://sourceforge.net/p/kaarpux/code/ci/5d8ff2e7b4ce2170658400b4788d71cd4dfecc9c/>`_)

- UPD: clutter: 1.14.2
  (Commit `a39fb8b9 <http://sourceforge.net/p/kaarpux/code/ci/a39fb8b947b02febd5246e05ed7aa428b5b591fb/>`_)

- UPD: glib-networking: v 2.36.1
  (Commit `bb21eaef <http://sourceforge.net/p/kaarpux/code/ci/bb21eaefe4599e4f08b9fa7041725108f3b82660/>`_)

- UPD: gtk+: v 3.8.1
  (Commit `4ee870dc <http://sourceforge.net/p/kaarpux/code/ci/4ee870dc85becbfea7c279e134f5bc5dd971d964/>`_)

- UPD: librsvg: v 2.36.4
  (Commit `b6d99558 <http://sourceforge.net/p/kaarpux/code/ci/b6d99558ab8bcea4dd1935a8ba0c18f8825f2306/>`_)

- UPD: freetype: v 2.4.10
  (Commit `d9f30571 <http://sourceforge.net/p/kaarpux/code/ci/d9f30571b456916117a2d1580ab71f471221a991/>`_)

- UPD: zlib: v 1.2.8
  (Commit `aef2c812 <http://sourceforge.net/p/kaarpux/code/ci/aef2c812d8fecae0bdc077524dc02b536077fc8f/>`_)

- UPD: gdk-pixbuf: v 2.28.1
  (Commit `b45f3078 <http://sourceforge.net/p/kaarpux/code/ci/b45f30784b223cdc653b9e2b703682ae1b111b62/>`_)

- UPD: harfbuzz: v 0.9.16
  (Commit `63915ff9 <http://sourceforge.net/p/kaarpux/code/ci/63915ff917358a6ea17dfa9a16121ec2bec0e949/>`_)

- UPD: libdrm: v 2.4.44
  (Commit `b88df284 <http://sourceforge.net/p/kaarpux/code/ci/b88df2849f0e750b7e9ac3a54410d6b47cf2df0f/>`_)

- UPD: libffi: v 3.0.13
  (Commit `5f7b7a7d <http://sourceforge.net/p/kaarpux/code/ci/5f7b7a7de59f9c4a16120b4fbda298b7fa949e3c/>`_)

- UPD: nettle: v 2.6
  (Commit `f903a9c1 <http://sourceforge.net/p/kaarpux/code/ci/f903a9c1b91934f7eb85d7be1add34ecbe6611eb/>`_)

- UPD: vte: v 0.34.4
  (Commit `590b1e23 <http://sourceforge.net/p/kaarpux/code/ci/590b1e23aa97b6a5b359608f4f64b99fd118748c/>`_)

- UPD: linux: v 3.9
  (Commit `3a149d90 <http://sourceforge.net/p/kaarpux/code/ci/3a149d900f8845a20d6bbc794a2b30564b4fdb99/>`_)

- FIX: systemtap: upstream patch for Linux 3.9
  (Commit `0068d57c <http://sourceforge.net/p/kaarpux/code/ci/0068d57c5ce520ae5024430c0b6e06afc37a1eca/>`_)

- MINOR: bc: move to bootstrap_5
  (prerequiste for Linux 3.9)
  (Commit `4fea6006 <http://sourceforge.net/p/kaarpux/code/ci/4fea600606817462dad08143ed0b74bcbf37682c/>`_)

- ADD: libusbx: use libusbx instead of the unmaintained libusb
  (Commit `341d33ea <http://sourceforge.net/p/kaarpux/code/ci/341d33ea8dee2512931a423832c694aa630462bd/>`_)


Improved testing
################

- Many additional upstream 'make check' test cases

- Many additional 'verify_cli' test cases

- Many minor changes


