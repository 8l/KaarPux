.. 
   KaarPux: http://kaarpux.kaarposoft.dk
   Copyright (C) 2015: Henrik Kaare Poulsen
   License: http://kaarpux.kaarposoft.dk/license.html

.. _changes_3_6_6:


================================
Changes in KaarPux version 3.6.6
================================


:program:`KaarPux` version ``3.6.6`` released on ``2013-jul-08``

- Linux kernel 3.10

- Java 7 u 40 / IcedTea 2.4.1

- Improved printing subsystem

- XOrg updates

- Other packages updated and bugs fixed


Linux kernel 3.10
#################

- UPD: linux: v 3.10
  (Commit `50d0f276 <http://sourceforge.net/p/kaarpux/code/ci/50d0f2768f02f555325363e79f9bdb9418c2bae0/>`_)

- FIX: linux: better config file (corrects 50d0f276)
  (Commit `6c22825c <http://sourceforge.net/p/kaarpux/code/ci/6c22825c74cc03177e120b29067f5102f2a0335f/>`_)

- UPD: kmod: v 14
  (Commit `95cc8c4d <http://sourceforge.net/p/kaarpux/code/ci/95cc8c4de69d54a662e5cb9a32cb304f7f1d200e/>`_)

- UPD: linux-firmware: v 20130607
  (Commit `98836afd <http://sourceforge.net/p/kaarpux/code/ci/98836afdc5b3d6f9ca722697b96b1b92eeaf0602/>`_)

- IMPROVE: linux: redirect initramfs output to kernel log
  (Commit `51302978 <http://sourceforge.net/p/kaarpux/code/ci/513029786431f789c09c0ed041ed24eb1d235f09/>`_)


Java 7 u 40 / IcedTea 2.4.1
###########################

- UPD: icedtea7: v 2.4.1
  (Commit `194c08c7 <http://sourceforge.net/p/kaarpux/code/ci/194c08c76e5da9507c3bff0bd3fd83bdc0a86bb7/>`_)

- FIX: icedtea-web: upstream patches
  (Commit `36a61078 <http://sourceforge.net/p/kaarpux/code/ci/36a61078b4e5bd323fbb91f39a97555164fb0f5f/>`_)


Improved printing subsystem
###########################

- FIX: cups: add many patches from Fedora
  (Commit `bce8a4db <http://sourceforge.net/p/kaarpux/code/ci/bce8a4dbc8daa5137c2c913d7daaf4b81ba602e0/>`_)

- FIX: hplip: patch from ArchLinux; improved configure options
  (Commit `af723dd4 <http://sourceforge.net/p/kaarpux/code/ci/af723dd4b9b8958746a132cf2443625b11c7e12e/>`_)

- FIX: cups-filters: move earlier in build sequence
  (Commit `f7de1f28 <http://sourceforge.net/p/kaarpux/code/ci/f7de1f282ff7b8cb4b67745dd7dd9409b61ea9db/>`_)

- ADD: pycurl
  (Commit `3c7713f5 <http://sourceforge.net/p/kaarpux/code/ci/3c7713f591817543efcb29fd80a3244b331c557f/>`_)

- ADD: pycups
  (Commit `87a9a584 <http://sourceforge.net/p/kaarpux/code/ci/87a9a584318de0afd13f00294718ec5c869b74ca/>`_)

- ADD: foomatic-db-engine foomatic-filters
  (Commit `e1775574 <http://sourceforge.net/p/kaarpux/code/ci/e1775574253ec7ae7ae91d23eb513e791fb9d0ec/>`_)

- ADD: system-config-printer
  (Commit `4ee411ef <http://sourceforge.net/p/kaarpux/code/ci/4ee411eff197828ff97b9d323c8ecdcca8d87f2f/>`_)

- ADD: logilab-common logilab-astng
  (Commit `7aeac10f <http://sourceforge.net/p/kaarpux/code/ci/7aeac10f898f960edd602da7f84d216b5ce564e9/>`_)

- ADD: pysqlite
  (Commit `5d171d7c <http://sourceforge.net/p/kaarpux/code/ci/5d171d7c0ca913d485ca44635a8204619f78b6c5/>`_)

- ADD: foomatic-db
  (Commit `44885052 <http://sourceforge.net/p/kaarpux/code/ci/448850528f13d820c20dc58e810ba477a92269d9/>`_)

- FIX: foomatic-db: remember to build foomatic-db; corrects 44885052
  (Commit `38f6caac <http://sourceforge.net/p/kaarpux/code/ci/38f6caaca645824c7492f21d640edd7ae99cc55e/>`_)

- FIX: cups-filters foomatic-filters: correct build sequence
  (Commit `8ccba052 <http://sourceforge.net/p/kaarpux/code/ci/8ccba052941c39f980c639197701778e42d27027/>`_)

- UPD: cups-filters: v 1.0.35
  (Commit `cbe7eb09 <http://sourceforge.net/p/kaarpux/code/ci/cbe7eb09ed3f69ccc9863807ff5e93117765d039/>`_)

- UPD: cups-pk-helper: v 0.2.5
  (Commit `c2253887 <http://sourceforge.net/p/kaarpux/code/ci/c22538875adc6207ef0f0120074bc9f4c5b7a274/>`_)

- IMPROVE: cups: compile with -O2
  (Commit `b90a3b76 <http://sourceforge.net/p/kaarpux/code/ci/b90a3b764d1aed30a921bcb43be9aeffa6aaae4f/>`_)


gcc 4.7.3
#########

- UPD: gcc: v 4.7.3
  (Commit `a619b3a4 <http://sourceforge.net/p/kaarpux/code/ci/a619b3a437c68036cd41e4c377e852c464145b5b/>`_)

- UPD: mpc: v 1.0.1
  (Commit `aba4dcb1 <http://sourceforge.net/p/kaarpux/code/ci/aba4dcb1c84f5da3a59fcd3d1fdf11636865b7c2/>`_)

- UPD: mpfr: v 3.1.2
  (Commit `1d682d28 <http://sourceforge.net/p/kaarpux/code/ci/1d682d28787dbe24dd8685530892a8b3d29a6eb7/>`_)

- UPD: gmp: v 5.1.2
  (Commit `2bb5caa0 <http://sourceforge.net/p/kaarpux/code/ci/2bb5caa0b985db024f3acafc112c54a25199b48a/>`_)


XOrg updates
############

- UPD: xorg: many xorg packages updated
  (Commit `dd31eb3d <http://sourceforge.net/p/kaarpux/code/ci/dd31eb3dc19b7e983004966fbc16e27e07a01482/>`_)

- UPD: libxcb: v 1.9.1
  (Commit `71c1d5ef <http://sourceforge.net/p/kaarpux/code/ci/71c1d5ef53baeed19f5817888eee1aec009d0cbd/>`_)

- UPD: xterm: v 293
  (Commit `e3813165 <http://sourceforge.net/p/kaarpux/code/ci/e3813165a1ee1e83ae6bf64a25ed333865a9be31/>`_)

- IMPROVE: xorg-server: --enable-xcsecurity --enable-xephyr
  (Commit `8c28dda3 <http://sourceforge.net/p/kaarpux/code/ci/8c28dda35d0677d599d3e57de411d65f62f48cb8/>`_)


Other packages updated and bugs fixed
#####################################

- UPD: gdb: v 7.6
  (Commit `d6c06c73 <http://sourceforge.net/p/kaarpux/code/ci/d6c06c73cb465f0702befb43e573ab21d3991f13/>`_)

- UPD: ruby: v 1.9.3-p448
  (Commit `144360fb <http://sourceforge.net/p/kaarpux/code/ci/144360fba480f00b47572bf58492d394abaa89c2/>`_)

- UPD: libdc1394: v 2.2.1
  (Commit `03c15b0a <http://sourceforge.net/p/kaarpux/code/ci/03c15b0aebf6227e2b2283a0edb5fd6c496bb6ca/>`_)

- UPD: cheese: v 3.8.2
  (Commit `cf684b6a <http://sourceforge.net/p/kaarpux/code/ci/cf684b6aa38355112b1ad0328ac752d39b92be1a/>`_)

- UPD: gimp: v 2.8.6
  (Commit `1115f47d <http://sourceforge.net/p/kaarpux/code/ci/1115f47dd9b42c70e32e44d3afd06ae2edaddec9/>`_)

- UPD: ghc-binary: v 7.6.3
  (Commit `2ece4540 <http://sourceforge.net/p/kaarpux/code/ci/2ece45407894ed2c00a47ff16de1283f485b32f5/>`_)

- UPD: ghc: v 7.6.3
  (Commit `bd598392 <http://sourceforge.net/p/kaarpux/code/ci/bd59839213851621a93dd79bac929a90865afe3f/>`_)

- UPD: haskell-platform: v 2013.2.0.0
  (Commit `8666f746 <http://sourceforge.net/p/kaarpux/code/ci/8666f74682255b87ab36813ee7ee748f6bf7d741/>`_)

- UPD: haskell_modules: *
  (Commit `cab40b69 <http://sourceforge.net/p/kaarpux/code/ci/cab40b69fede30b1c408df2ba9f10d85d0979db4/>`_)

- UPD: flac: v 1.3.0
  (Commit `b08be165 <http://sourceforge.net/p/kaarpux/code/ci/b08be1652e43aab9af5348f3dac0147f41c68fb1/>`_)

- UPD: qpdf: v 4.1.0; also compile with gcc
  (Commit `931ad335 <http://sourceforge.net/p/kaarpux/code/ci/931ad3350d1c9c3a25b2603642d997e3f6e22de2/>`_)

- UPD: qt: v 4.8.1; also improved configure options
  (Commit `5538c6e2 <http://sourceforge.net/p/kaarpux/code/ci/5538c6e281f3766825daaf916005d9b15dc5c794/>`_)

- UPD: lcms2: v 2.5
  (Commit `953e8d55 <http://sourceforge.net/p/kaarpux/code/ci/953e8d5573aca005ebddf1faa3ff23ed78755253/>`_)

- UPD: ghostscript: v 9.07
  (Commit `8bb6d8e6 <http://sourceforge.net/p/kaarpux/code/ci/8bb6d8e629961e912a8f2d38217fdab868c53c86/>`_)

- UPD: cyrus-sasl: v 2.1.26
  (Commit `ff6c4b08 <http://sourceforge.net/p/kaarpux/code/ci/ff6c4b08961fab54950ade0041cc813c2a73c428/>`_)

- UPD: pylint: v 0.28.0
  (Commit `8bce4ab9 <http://sourceforge.net/p/kaarpux/code/ci/8bce4ab9dc00207bd53aad05fa4e63586bfab820/>`_)

- UPD: pulseaudio: v 4.0
  (Commit `227c1720 <http://sourceforge.net/p/kaarpux/code/ci/227c1720c69d2d518d39f94cbdce358f288e4495/>`_)

- UPD: busybox: v 1.21.1
  (Commit `7e4359f7 <http://sourceforge.net/p/kaarpux/code/ci/7e4359f78136a462d8bb7bc9cc441025036feed7/>`_)

- UPD: gzip: v 1.6
  (Commit `41210de8 <http://sourceforge.net/p/kaarpux/code/ci/41210de85016a61ff6be7aa1a5cb908e189f64b7/>`_)

- UPD: xz: v 5.0.5
  (Commit `3bd471d4 <http://sourceforge.net/p/kaarpux/code/ci/3bd471d4bb94bb8d499fdce1209c62b79eb6d6bb/>`_)

- UPD: util-linux: v 2.22.2
  (Commit `f9279c81 <http://sourceforge.net/p/kaarpux/code/ci/f9279c81aea1b368e1239784f6309ec9efe7d976/>`_)

- UPD: tzdata: v 2013c
  (Commit `29139069 <http://sourceforge.net/p/kaarpux/code/ci/29139069e9668c72d1ebfea1f1b33e504a087446/>`_)

- UPD: nss: v 3.15.1
  (Commit `13db5c97 <http://sourceforge.net/p/kaarpux/code/ci/13db5c973e60e245d838800851998c1bcdf226ca/>`_)

- UPD: qemu: v 1.5.1
  (Commit `6cec3a5d <http://sourceforge.net/p/kaarpux/code/ci/6cec3a5d60fe404e34251579c4d758fba2093297/>`_)

- UPD: libjpeg-turbo: v 1.3.0
  (Commit `563d6f52 <http://sourceforge.net/p/kaarpux/code/ci/563d6f5290fc352d15f2544f69f33e2aeb9b3a1c/>`_)

- UPD: ghostery: v 2.9.6
  (Commit `98e4ada9 <http://sourceforge.net/p/kaarpux/code/ci/98e4ada9ea11e7a584104f0d213ac4ffcc39f078/>`_)

- UPD: noscript: v 2.6.6.7
  (Commit `9852014d <http://sourceforge.net/p/kaarpux/code/ci/9852014ddcece943562fb486809dff3838bf61ca/>`_)

- UPD: gdk-pixbuf: v 2.28.2
  (Commit `f3c0c9a8 <http://sourceforge.net/p/kaarpux/code/ci/f3c0c9a8cace4696d0e9ac1f689b4c64ef6786f5/>`_)

- UPD: NetworkManager: v 0.9.8.2
  (Commit `f3437c14 <http://sourceforge.net/p/kaarpux/code/ci/f3437c143d48ab26c0d68f24b5c1f8a1b3d67f8d/>`_)

- UPD: fuse: v 2.9.3
  (Commit `006f8a90 <http://sourceforge.net/p/kaarpux/code/ci/006f8a905f161aea68a6c532ee8bfeca9edd69e9/>`_)

- UPD: openssh: 6.2p2
  (Commit `f2427724 <http://sourceforge.net/p/kaarpux/code/ci/f24277240ac2d0e30e540083fa809900d86daa2c/>`_)

- FIX: dhcpcd: create dhcpcd-hooks directory
  (Commit `3cb47454 <http://sourceforge.net/p/kaarpux/code/ci/3cb47454993b4f65e5cc8377c1180e0716974d7c/>`_)

- FIX: KxBuild: fix build sequence of python packages
  (Commit `38baf07e <http://sourceforge.net/p/kaarpux/code/ci/38baf07e3ffd47d526e1221483b63fc014997073/>`_)

- FIX: libical: use 'test' instead of 'check'
  (Commit `54550df0 <http://sourceforge.net/p/kaarpux/code/ci/54550df0768e2e5f921080caeaae8b0a3510e757/>`_)

- FIX: libmicrohttpd: Remove failing testcase
  (Commit `7c8b3800 <http://sourceforge.net/p/kaarpux/code/ci/7c8b380006af46bbbec13569ff3a24033dc2de70/>`_)

- FIX: ghc-binary: use suitable precompiled package from ArchLinux
  (Commit `1733df26 <http://sourceforge.net/p/kaarpux/code/ci/1733df26b50d976a7269469c76401310ed0e9c5a/>`_)

- FIX: ghc: use new ghc-binary and improved build options
  (Commit `1aefb935 <http://sourceforge.net/p/kaarpux/code/ci/1aefb935f523da4455c286b0001f1aae5f62cfc1/>`_)

- FIX: haskell-platform: configure options
  (Commit `74295885 <http://sourceforge.net/p/kaarpux/code/ci/74295885062e6a78d0ba68d1aa4fe13b93df85a5/>`_)

- FIX: haskell-platform: configure options
  (Commit `74295885 <http://sourceforge.net/p/kaarpux/code/ci/74295885062e6a78d0ba68d1aa4fe13b93df85a5/>`_)

- Many minor improvements

- Many new testcases


