.. 
   KaarPux: http://kaarpux.kaarposoft.dk
   Copyright (C) 2015: Henrik Kaare Poulsen
   License: http://kaarpux.kaarposoft.dk/license.html

.. _changes_4_8_8:


================================
Changes in KaarPux version 4.8.8
================================


:program:`KaarPux` version ``4.8.8`` released on ``2015-maj-17``

- C/C++ compilers updated

- glibc downgraded to released version

- Java 8 (openjdk)

- Many other packages updated

- Bugs fixed

- Minor changes and documentation updates


C/C++ compilers updated
#######################

- UPD: llvm: v 3.6.0
  (Commit `27320066 <http://sourceforge.net/p/kaarpux/code/ci/273200666fe066935cfcaabccad3cc6241cb91bd/>`_)

- UPD: gcc: v 5.1.0
  (Commit `80c55bc6 <http://sourceforge.net/p/kaarpux/code/ci/80c55bc6a1871401bdc20d9d12b6f9e580467a76/>`_)

- IMPROVE: mpfr: apply consolidated upstream patches
  (Commit `9a8fd968 <http://sourceforge.net/p/kaarpux/code/ci/9a8fd968a00f2476d39b90f860368968fc33ac1b/>`_)

- IMPROVE: gcc: --with-default-libstdcxx-abi=c++98
  (Commit `664ab352 <http://sourceforge.net/p/kaarpux/code/ci/664ab3521f4ff54f48d8b7ea12ed4ffb8f28aebf/>`_)

- ADD: isl: library for manipulating sets and relations of integer points bounded by linear constraints (for gcc)
  (Commit `4f26587c <http://sourceforge.net/p/kaarpux/code/ci/4f26587c6547fd7d777c69f46ee310faf9cd33aa/>`_)

- FIX: glibc: --enable-obsolete-rpc (for gcc)
  (Commit `9503be71 <http://sourceforge.net/p/kaarpux/code/ci/9503be7149d8f7b77a803567bb0e393f19300080/>`_)

- FIX: ncurses: fixes to build with gcc 5
  (Commit `72d10d59 <http://sourceforge.net/p/kaarpux/code/ci/72d10d59df28acc8ea8904ea57699c5a962d58b1/>`_)

- FIX: lshw: use_gcc
  (Commit `53b587cc <http://sourceforge.net/p/kaarpux/code/ci/53b587ccfb23bc58396400c1da7ba32cfedd36f9/>`_)

- FIX: pixman: use_gcc
  (Commit `caccf52f <http://sourceforge.net/p/kaarpux/code/ci/caccf52ff3784d09046d30b03ab7d932d27de5e8/>`_)

- FIX: haskell-gtk: correction for GCC 5
  (Commit `5453f510 <http://sourceforge.net/p/kaarpux/code/ci/5453f510d0cd6b74e7a13400a4abcfc29a2dc4f9/>`_)

- IMPROVE: libreoffice: build with clang
  (Commit `2ddc3cb0 <http://sourceforge.net/p/kaarpux/code/ci/2ddc3cb0dfedb5715da27014f6b08b0e80757c1b/>`_)

- IMPROVE: haskell_module: build with gcc
  (Commit `ee84d765 <http://sourceforge.net/p/kaarpux/code/ci/ee84d76541531157a54f08b8323ae55d70aaa300/>`_)


glibc downgraded to released version
####################################

- UPD: glibc: v 2.21-240-g9781a37
  (Commit `c2040e2b <http://sourceforge.net/p/kaarpux/code/ci/c2040e2b7205e6d22bac9d843b4b990081d21d01/>`_)

- UPD: glibc: v 2.21-104-gbdf1ff0 (downgrade as -240 does not seem to work well)
  (Commit `653dd4da <http://sourceforge.net/p/kaarpux/code/ci/653dd4dab373f0849ff30552e49ad72835759950/>`_)

- UPD: glibc: v 2.21 (stick to official release; too many problems with point updates)
  (Commit `f0565b9b <http://sourceforge.net/p/kaarpux/code/ci/f0565b9b83daec7b4a0d1f0dbf5df35e2ff2d0ce/>`_)


Java 8 (openjdk)
################

- UPD: openjdk: v 8u45-b14 (Now using openjdk directly; without icedtea)
  (Commit `06d8774a <http://sourceforge.net/p/kaarpux/code/ci/06d8774a6cca164dae8914297e82826f50c8cc83/>`_)

- FIX: oraclejdk-bin: add file missing from commit 06d8774a
  (Commit `091c56b0 <http://sourceforge.net/p/kaarpux/code/ci/091c56b03e3aac361e091b16c83fc61cf42aafd7/>`_)

- FIX: openjdk: remove ORACLEJDK, not ICEDTEA7
  (Commit `9ad093db <http://sourceforge.net/p/kaarpux/code/ci/9ad093dbf60d4056c15e772dcaa4f88291bcfd6b/>`_)

- REMOVE: apache-ant (not needed for building openjdk 8)
  (Commit `48a36096 <http://sourceforge.net/p/kaarpux/code/ci/48a36096eba7711b6ad4766e8b9e8c73edbbf835/>`_)

- REMOVE: rhino (nashorn now included in openjdk)
  (Commit `46aa5be7 <http://sourceforge.net/p/kaarpux/code/ci/46aa5be7f71b67ce0c48814487fa8b72c3feb377/>`_)

- REMOVE: xmlbeans: only needed by rhino which was removed
  (Commit `98095725 <http://sourceforge.net/p/kaarpux/code/ci/98095725b8ad50f82b612e08d9cc24e0a29ea403/>`_)


Many other packages updated
###########################

- UPD: less: v 471
  (Commit `89870fc6 <http://sourceforge.net/p/kaarpux/code/ci/89870fc6836f961e0c8951e60087512e65af4563/>`_)

- UPD: libksba: v 1.3.3
  (Commit `2d5f7519 <http://sourceforge.net/p/kaarpux/code/ci/2d5f7519996a10755a1025c0803fa4cbebdd4e2e/>`_)

- UPD: flash_player_11: v 11.2.202.460
  (Commit `655326da <http://sourceforge.net/p/kaarpux/code/ci/655326daeb6e763df4a4a9cfdb4df31aef6e1ff3/>`_,
  `cbb7572a <http://sourceforge.net/p/kaarpux/code/ci/cbb7572a4df29ca650ef2930602ac941d9d79614/>`_)

- UPD: libtasn1: v 4.5
  (Commit `1b711967 <http://sourceforge.net/p/kaarpux/code/ci/1b711967bf0ea6c6dc10d6bad25e6768465b7f1a/>`_,
  `8a1408d8 <http://sourceforge.net/p/kaarpux/code/ci/8a1408d820636035815c6dfc774fd17b26835c69/>`_)

- UPD: libpng: v 1.6.17
  (Commit `92a7d409 <http://sourceforge.net/p/kaarpux/code/ci/92a7d40992035b658ca12a7937355dc7d2dee217/>`_)

- UPD: firefox: v 38.0.1
  (Commit `468fa5e6 <http://sourceforge.net/p/kaarpux/code/ci/468fa5e6f02b78a03b481d8c891cf5d519e6f691/>`_,
  `fbdc6fe9 <http://sourceforge.net/p/kaarpux/code/ci/fbdc6fe951db3de794b5fa2fe5346d447abbc5b3/>`_)

- UPD: nss: v 3.19
  (Commit `af81d36b <http://sourceforge.net/p/kaarpux/code/ci/af81d36baba1e6c922a764c0ccc54a978ef402fa/>`_,
  `29709881 <http://sourceforge.net/p/kaarpux/code/ci/297098817881be7890bc11fc0a558ba2d60b48c8/>`_)

- UPD: linux: v 3.18.13
  (Commit `f8cf7f0c <http://sourceforge.net/p/kaarpux/code/ci/f8cf7f0c9c461dcb6f5e186ccea6356e584c1aa3/>`_,
  `a5683f80 <http://sourceforge.net/p/kaarpux/code/ci/a5683f802ac01b63e463ab3cacd259301c52a215/>`_)

- UPD: certdata: v 8a2c933394da
  (Commit `e38050cf <http://sourceforge.net/p/kaarpux/code/ci/e38050cf43beeec7703e78ef402706ef54dae65f/>`_)

- UPD: tcpdump: v 4.7.4
  (Commit `5082f068 <http://sourceforge.net/p/kaarpux/code/ci/5082f068cec5c60d19a755530322e877c2322303/>`_)

- ADD: efivar: Tools and library to manipulate EFI variables
  (Commit `07cea581 <http://sourceforge.net/p/kaarpux/code/ci/07cea581f08ff0d0ca364bc4e49e330c24dd0ac8/>`_)

- UPD: efibootmgr: v 0.11.0; and use new upstream: github.com/rhinstaller
  (Commit `7b6f2874 <http://sourceforge.net/p/kaarpux/code/ci/7b6f2874e3eef31d870954345a0d0e849933e23d/>`_)

- UPD: MesaLib: v 10.5.4
  (Commit `ea01e92a <http://sourceforge.net/p/kaarpux/code/ci/ea01e92a08909ac7d0e07762d78d3082cd2978ab/>`_)

- UPD: libvpx: v 1.4.0
  (Commit `835cf3b6 <http://sourceforge.net/p/kaarpux/code/ci/835cf3b604036aba506ad7021c97d25d8e9b7fb4/>`_)

- UPD: gst-\*: v 1.4.5
  (Commit `8c92dd4d <http://sourceforge.net/p/kaarpux/code/ci/8c92dd4d3c6b15f6e683a1420171485e6b5a0031/>`_)

- UPD: clutter-gst: v 2.0.14
  (Commit `71649d2c <http://sourceforge.net/p/kaarpux/code/ci/71649d2ce5e2553a66ce8028363826355487c60b/>`_)

- UPD: gnutls: v 3.3.15
  (Commit `2458be01 <http://sourceforge.net/p/kaarpux/code/ci/2458be01377d88df099af85b3c06493ce278be15/>`_)

- UPD: curl: v 7.42.1
  (Commit `ffa66745 <http://sourceforge.net/p/kaarpux/code/ci/ffa6674514f27ecd49d812d437760a20d0bbe245/>`_)

- UPD: sqlite: v 3.8.9
  (Commit `4f3a57cb <http://sourceforge.net/p/kaarpux/code/ci/4f3a57cbe3e9e11be77bd7a07b2130810e8c2650/>`_)

- UPD: qemu: v 2.3.0
  (Commit `56f9102e <http://sourceforge.net/p/kaarpux/code/ci/56f9102eb63988bc917634070e742c1d08359577/>`_)

- UPD: thunderbird: v 31.7.0
  (Commit `37bd2009 <http://sourceforge.net/p/kaarpux/code/ci/37bd20090101d46348f11d14caa2c5b63ed3986b/>`_)

- UPD: ghc: v 7.8.4
  (Commit `21ffd605 <http://sourceforge.net/p/kaarpux/code/ci/21ffd6053a9657b7a19c175dea6e5e1a28d3d56e/>`_)


Bugs fixed
##########

- FIX: libxkbfile: The vmods member of XkbNamesPtr is an array and thus never NULL
  (Commit `e3c8b2a5 <http://sourceforge.net/p/kaarpux/code/ci/e3c8b2a53cef2014ffe8bef5f52ed559b659fc1e/>`_)

- FIX: thunderbird: patch for nullptr
  (Commit `8204a731 <http://sourceforge.net/p/kaarpux/code/ci/8204a73131940ac2b3e329b83ee96bf88671e6c3/>`_,
  `d0fd67e1 <http://sourceforge.net/p/kaarpux/code/ci/d0fd67e1ab05cf7a530962db9c13e415871fbc5a/>`_)


Minor changes and documentation updates
#######################################

- IMPROVE: lesscss: work with Mozilla SpiderMonkey
  (Commit `75850309 <http://sourceforge.net/p/kaarpux/code/ci/758503096315ce8e12f7b8da2ae21146041cea4e/>`_)

- IMPROVE: make_doc: build css with lesscss using Mozilla SpiderMonkey
  (Commit `3afdcfeb <http://sourceforge.net/p/kaarpux/code/ci/3afdcfeb217d72b5208d877453246c6f6fbe9461/>`_)

- IMPROVE: kernel_kvm_performance_settings: sysctl vm.dirty*
  (Commit `a47e299c <http://sourceforge.net/p/kaarpux/code/ci/a47e299cc875b9002055492451c612ce5e5e0630/>`_)

- DOC: certdata: correct link to openjdk-cacerts
  (Commit `8e40d094 <http://sourceforge.net/p/kaarpux/code/ci/8e40d0941e75470bc4e1575f0124c7fece13f1a0/>`_)

- DOC: htaccss: redirect for removed packages
  (Commit `8d61a12b <http://sourceforge.net/p/kaarpux/code/ci/8d61a12b20be034970c7e1ec828acb52d13c2732/>`_)

- DOC: KaarPux: updated CVE info
  (Commit `bb93464f <http://sourceforge.net/p/kaarpux/code/ci/bb93464ffc67f7c60c87ee3bbc3ecb29bdab9389/>`_,
  `cacb08ec <http://sourceforge.net/p/kaarpux/code/ci/cacb08ec82940197723985bd383f1c1527101a93/>`_,
  `ec22203e <http://sourceforge.net/p/kaarpux/code/ci/ec22203ed120a031151e5b688b79052b7761f91e/>`_)


