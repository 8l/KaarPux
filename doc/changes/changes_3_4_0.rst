.. 
   KaarPux: http://kaarpux.kaarposoft.dk
   Copyright (C) 2015: Henrik Kaare Poulsen
   License: http://kaarpux.kaarposoft.dk/license.html

.. _changes_3_4_0:


================================
Changes in KaarPux version 3.4.0
================================


:program:`KaarPux` version ``3.4.0`` released on ``2012-12-23``

- Added: Kernel-based Virtual Machine and ruby.

- Updated: tool-chain and bootstrap packages, and packages dependent on those.

- Updated: flash_player_11 (v 11.2.202.258),  noscript (v 2.6.4.1), WebKit (v 1.10.2).

- Bug fixes.


Bugs fixed
##########

- FIX: \*: corrections to support glibc 2.16.0
  (Commit `6f0808d3 <http://sourceforge.net/p/kaarpux/code/ci/6f0808d3e950bd1ff459d69f2f67c269d955cf1c/>`_)

- FIX: openssl: Do not try with $[KX_MAKE_J} or make_repeat: it does NOT work
  (Commit `3a7a5c78 <http://sourceforge.net/p/kaarpux/code/ci/3a7a5c780193e3edcc529cc8f7a9a3c049684436/>`_)

- FIX: ghc: make_repeat
  (Commit `9aca8f26 <http://sourceforge.net/p/kaarpux/code/ci/9aca8f2659c2ef024e13b06b19c9c7748e05deb0/>`_)

- FIX: linux: Correct build2 of initramfs
  (Commit `302f3b64 <http://sourceforge.net/p/kaarpux/code/ci/302f3b64f37279de2e9cd053dcb8de8289c4d8ca/>`_)

- FIX: grub: make distclean between builds
  (Commit `977729b5 <http://sourceforge.net/p/kaarpux/code/ci/977729b5816b383568344c9807924db62947ad35/>`_)

- FIX: KaarPux: Correct i18n
  (Commit `8b53feac <http://sourceforge.net/p/kaarpux/code/ci/8b53feac1fbfec86c3751451c5f3980253767956/>`_)

- FIX: mutter: Patch for GTK-Doc problems
  (Commit `65f7293a <http://sourceforge.net/p/kaarpux/code/ci/65f7293a4642ce2681596022518142da578b2fd4/>`_,
  Commit `122494f1 <http://sourceforge.net/p/kaarpux/code/ci/122494f1e83614e56188bdf77fde951332fb752f/>`_)

- FIX: farstream: Patch for GTK-Doc problems
  (Commit `910d1f69 <http://sourceforge.net/p/kaarpux/code/ci/910d1f695d98457cfdc73e97a634a2b46988eea1/>`_)

- FIX: glibc: allow up to 30 errors in test
  (Commit `b9982720 <http://sourceforge.net/p/kaarpux/code/ci/b9982720c717e01b1a0c425cf2d9dae0a6e859fe/>`_)


Packages added
##############

- ADD: tzdata: Time Zone Database (not included in glibc anymore)
  (Commit `4a25ee8c <http://sourceforge.net/p/kaarpux/code/ci/4a25ee8c5f70135945221d7f65c39054f58b6021/>`_)

- ADD: qemu-kvm: Kernel-based Virtual Machine
  (Commit `b33e7c02 <http://sourceforge.net/p/kaarpux/code/ci/b33e7c024f0f7b9fab1fee0a8fe8df755c8390cf/>`_)

- ADD: yaml ruby: ruby v 1.9.3-p327 and prereq LibYAML
  (Commit `00e4c85c <http://sourceforge.net/p/kaarpux/code/ci/00e4c85c8b0c675d80f531abd1cb5d50e6a4bbdf/>`_)


Packages updated
################

- UPD: binutils: v 2.23.1
  (Commit `d29abc88 <http://sourceforge.net/p/kaarpux/code/ci/d29abc882ce726ccc57406f0688e94bf11ce1c6f/>`_)

- UPD: gcc: v 4.7.2
  (Commit `31b81658 <http://sourceforge.net/p/kaarpux/code/ci/31b816589608c682da84d2d613aae28e322b543d/>`_)

- UPD: glibc: v 2.16.0
  (Commit `07da6006 <http://sourceforge.net/p/kaarpux/code/ci/07da6006f0b80708b6985afac662e9be51ef8a9f/>`_)

- UPD: busybox: v 1.20.2; add upstream patches
  (Commit `e129b823 <http://sourceforge.net/p/kaarpux/code/ci/e129b8235dc5ac8b3db7ffed4f8308be45d15255/>`_)

- UPD: linux-pam: v 1.1.6; also change home to linux-pam.org
  (Commit `d7753172 <http://sourceforge.net/p/kaarpux/code/ci/d7753172204518a4aa5501ee66fc27621663e008/>`_)

- UPD: wget: v 1.14
  (Commit `00763724 <http://sourceforge.net/p/kaarpux/code/ci/007637240e9d6aa5a205f579a48f2bb681030caa/>`_)

- UPD: nspr: v 4.9.4
  (Commit `805fdf07 <http://sourceforge.net/p/kaarpux/code/ci/805fdf07f3070f95da12e47b194b5dd82db20b01/>`_)

- UPD: nss: v 3.14
  (Commit `0d61524e <http://sourceforge.net/p/kaarpux/code/ci/0d61524e2602ab5c608050c2198421da5abe5e96/>`_)

- UPD: gdb: v 7.5.1
  (Commit `9509ad92 <http://sourceforge.net/p/kaarpux/code/ci/9509ad924014419201f823d1c7b2caebb1a29ad1/>`_)

- UPD: systemd: v 196
  (Commit `484b8416 <http://sourceforge.net/p/kaarpux/code/ci/484b84164821d40cc26d0153c663cad1b6bf975d/>`_)

- UPD: kbd: v 1.15.5
  (Commit `31c27202 <http://sourceforge.net/p/kaarpux/code/ci/31c27202f1d249207970c35c1f1126563de9ca8f/>`_)

- UPD: coreutils: v 8.19
  (Commit `abff8f2f <http://sourceforge.net/p/kaarpux/code/ci/abff8f2f1434fca0549e4aa012741a79e0d2b923/>`_)

- UPD: automake: v 1.12.6
  (Commit `5cc3d86b <http://sourceforge.net/p/kaarpux/code/ci/5cc3d86b8e1d4fc94bdb7b3440e735d7939c99bb/>`_)

- UPD: bison: v 2.7
  (Commit `793d410f <http://sourceforge.net/p/kaarpux/code/ci/793d410f260198b1c2fa1bc3ca02244a9e39d5be/>`_)

- UPD: dbus: v 1.6.8
  (Commit `b0ee95f2 <http://sourceforge.net/p/kaarpux/code/ci/b0ee95f287efc33f89ca9fd6c8d40f09d541b0d4/>`_)

- UPD: e2fsprogs: v 1.42.6
  (Commit `b85b35e7 <http://sourceforge.net/p/kaarpux/code/ci/b85b35e737630584ba658d8655ed46763e568a9b/>`_)

- UPD: grep: v 2.14
  (Commit `447d28fd <http://sourceforge.net/p/kaarpux/code/ci/447d28fde4fe592eb5c26b1bd3e2a8d120d549f4/>`_)

- UPD: help2man: v 1.40.13
  (Commit `a3d6bbf8 <http://sourceforge.net/p/kaarpux/code/ci/a3d6bbf82f0467a83dd32845f11b841925f5e831/>`_)

- UPD: icu: v 50.1.1
  (Commit `9aa502e4 <http://sourceforge.net/p/kaarpux/code/ci/9aa502e4795696893e9ea84fef0ca6a7d11f306b/>`_)

- UPD: iproute2: v 3.7.0
  (Commit `e74024f4 <http://sourceforge.net/p/kaarpux/code/ci/e74024f47c547be4a866e5cc5ce66dd65060d282/>`_)

- UPD: kmod: v 12
  (Commit `e34c46d5 <http://sourceforge.net/p/kaarpux/code/ci/e34c46d54ac3bbaf6991aa01711a0bcfaa3a323a/>`_)

- UPD: less: v 457
  (Commit `0ee15a3a <http://sourceforge.net/p/kaarpux/code/ci/0ee15a3a0051ab151af3dc3879b29a66df545308/>`_)

- UPD: libpipeline: v 1.2.2
  (Commit `2b228c01 <http://sourceforge.net/p/kaarpux/code/ci/2b228c0160eab4f3277ba1dc13e9fa8e470bd00f/>`_)

- UPD: man-db: v 2.6.3
  (Commit `5cd387bf <http://sourceforge.net/p/kaarpux/code/ci/5cd387bf09ad8269fefa0e6e85481c35baf6a3db/>`_)

- UPD: nss: v 3.14.1
  (Commit `c489b1c3 <http://sourceforge.net/p/kaarpux/code/ci/c489b1c3b84ffb6e0776ca72914a77639c201416/>`_)

- UPD: os-prober: v 1.56
  (Commit `95a025f8 <http://sourceforge.net/p/kaarpux/code/ci/95a025f8ec2b09f70982854856f0e46d6c9ab291/>`_)

- UPD: patch: v 2.7.1
  (Commit `9ba20456 <http://sourceforge.net/p/kaarpux/code/ci/9ba20456401de8d038d98d46efe0954630aa4225/>`_)

- UPD: pcre: v 8.32
  (Commit `576b3422 <http://sourceforge.net/p/kaarpux/code/ci/576b34226d10cacc3c799f86dbe0dc65bb8e642f/>`_)

- UPD: perl: v 5.16.2
  (Commit `9a31a18b <http://sourceforge.net/p/kaarpux/code/ci/9a31a18b42dea50eeb084f9190b4d2ab8e9a0230/>`_)

- UPD: pkg-config: v 0.27.1
  (Commit `24a8acf6 <http://sourceforge.net/p/kaarpux/code/ci/24a8acf63dd36f85516b65330c3cfd743e72ae36/>`_)

- UPD: psmisc: v 22.20
  (Commit `4ba00dae <http://sourceforge.net/p/kaarpux/code/ci/4ba00dae2d9cc16c03765de4eb7fa3abcfb5e091/>`_)

- UPD: tcl: v 8.5.13
  (Commit `f18c727b <http://sourceforge.net/p/kaarpux/code/ci/f18c727bf8203ab3d7dcf4ac9b4bf35c7cb2a48c/>`_)

- UPD: tk: v 8.5.13
  (Commit `e58d0a68 <http://sourceforge.net/p/kaarpux/code/ci/e58d0a68d7d6dd9b67424375286fe45934bf8e12/>`_)

- UPD: flash_player_11: v 11.2.202.258
  (Commit `ca5463f5 <http://sourceforge.net/p/kaarpux/code/ci/ca5463f50c079eb5c07f2b51d6fff4cc40b6eac3/>`_)

- UPD: noscript: v 2.6.4.1
  (Commit `338af409 <http://sourceforge.net/p/kaarpux/code/ci/338af4092e5d41bd60ab25ec7b024cb7d2759474/>`_)

- UPD: glib*: update v ?.32.? to ?.34.?
  (Commit `c3b453f4 <http://sourceforge.net/p/kaarpux/code/ci/c3b453f49fabc63d048024706defe5a4c8737f8e/>`_)

- UPD: libsoup: v 2.40.2
  (Commit `1f06032b <http://sourceforge.net/p/kaarpux/code/ci/1f06032bf9927e0f25c6ca503b0a8b52d00ceee9/>`_)

- UPD: WebKit: v 1.10.2
  (Commit `26bbab68 <http://sourceforge.net/p/kaarpux/code/ci/26bbab6836c32e10dad9f375afee6e8017cc6f22/>`_)


Minor Changes and Documentation Changes
#######################################

- Many Minor Changes and Documentation Changes


