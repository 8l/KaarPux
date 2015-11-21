.. 
   KaarPux: http://kaarpux.kaarposoft.dk
   Copyright (C) 2015: Henrik Kaare Poulsen
   License: http://kaarpux.kaarposoft.dk/license.html

.. _changes_4_1_1:


================================
Changes in KaarPux version 4.1.1
================================


:program:`KaarPux` version ``4.1.1`` released on ``2014-feb-07``

- Linux Kernel updated to version 3.13.1

- firefox updated to version 27.0

- thunderbird updated to version 24.3.0

- flash_player_11 updated to version 11.2.202.336

- icedtea-web updated to version 1.4.2

- added SANE (Scanner Access Now Easy)

- CUPS (printing) fixed and enabled by default

- added conntrack-tools (User space connection tracking tools for iptables)

- added lxc (Linux Containers)

- bugs fixed, minor improvements and additions


Packages added
##############

- ADD: sane-backends: Scanner Access Now Easy
  (Commit `989915f0 <http://sourceforge.net/p/kaarpux/code/ci/989915f05e6a5c55c45198b22c31ce391946150d/>`_,
  `d4c7f8e4 <http://sourceforge.net/p/kaarpux/code/ci/d4c7f8e442be52b06c1fa21405721243d4ea9c98/>`_)

- ADD: xsane: XOrg interface to Scanner Access Now Easy
  (Commit `76c3c549 <http://sourceforge.net/p/kaarpux/code/ci/76c3c5497cf1a8d7361664d37c7633a16e31d9d8/>`_)

- ADD: libnetfilter_cthelper libnetfilter_cttimeout libnetfilter_queue: prereqs for conntrack-tools
  (Commit `0de1739b <http://sourceforge.net/p/kaarpux/code/ci/0de1739ba7a0e25a21390e295ccf600e6a70552c/>`_)

- ADD: conntrack-tools: User space connection tracking tools
  (Commit `a77c9f2e <http://sourceforge.net/p/kaarpux/code/ci/a77c9f2ec7e0fb61c46d1f98eea854f0af6a3d54/>`_)

- ADD: ModemManager
  (Commit `4b535c5c <http://sourceforge.net/p/kaarpux/code/ci/4b535c5c8d2cc92d6a2788cbd6c092ab2c68df41/>`_)

- ADD: perl_modules XML*: prereqs for docbook2X
  (Commit `a5c41cb1 <http://sourceforge.net/p/kaarpux/code/ci/a5c41cb1ff139b2ebce439511c8ea83c5481db11/>`_,
  `eaf304da <http://sourceforge.net/p/kaarpux/code/ci/eaf304da12f570933e2138360824594fdc1627dc/>`_)

- ADD: docbook2X: docbook2X converts DocBook documents to man and Texinfo format
  (Commit `cae84fe2 <http://sourceforge.net/p/kaarpux/code/ci/cae84fe2cbb519e083abaf13b5b6017f548973bd/>`_)

- ADD: lxc: Linux Containers
  (Commit `229ae0ae <http://sourceforge.net/p/kaarpux/code/ci/229ae0ae26edb2f9567d0218e4192e612ac04ad4/>`_)


Packages updated
################

- UPD: sqlite: v 3.8.3 (and this time it is for real!)
  (Commit `fe0286ed <http://sourceforge.net/p/kaarpux/code/ci/fe0286edc07a41b083f0c0033a105d65d9f3c979/>`_)

- UPD: firefox: v 27.0
  (Commit `c815927c <http://sourceforge.net/p/kaarpux/code/ci/c815927ce77cdf10e403a58bda82d6cf81818aaf/>`_)

- UPD: flash_player_11: v 11.2.202.336
  (Commit `0158c10c <http://sourceforge.net/p/kaarpux/code/ci/0158c10c6f6cf187bd83441d7b3d4e218be12218/>`_)

- UPD: thunderbird: v 24.3.0
  (Commit `6b9c7cbc <http://sourceforge.net/p/kaarpux/code/ci/6b9c7cbc1cb8814dad63d36d7c5ba7717acc65df/>`_)

- UPD: sushi: v 3.10.0
  (Commit `fcd363e0 <http://sourceforge.net/p/kaarpux/code/ci/fcd363e00710cea10bf49ad26490cc11e8806662/>`_)

- UPD: lxc: v 1.0.0.beta3
  (Commit `8560189d <http://sourceforge.net/p/kaarpux/code/ci/8560189d37d300e3e94fe6965594709ef2a05543/>`_)

- UPD: linux: v 3.13.1
  (Commit `b937e0dd <http://sourceforge.net/p/kaarpux/code/ci/b937e0ddcaef1cf4ba86088fc6d672db6d13ac33/>`_)

- UPD: nspr: v 4.10.3 - also remove custom nspr.pc file, now included in package
  (Commit `c977e1c8 <http://sourceforge.net/p/kaarpux/code/ci/c977e1c8433e83c2d6df8cf7a00f7973fcc9f285/>`_)

- UPD: icedtea-web: v 1.4.2
  (Commit `46767f8d <http://sourceforge.net/p/kaarpux/code/ci/46767f8d5086f54725b6fcffdf4970db0cffb1c0/>`_)


Bugs fixed
##########

- FIX: openssh: do not print extraneous Last Login line (the real line is printed by PAM)
  (Commit `69a44750 <http://sourceforge.net/p/kaarpux/code/ci/69a44750953e15e158a99e4ff2339421adb5f560/>`_)

- FIX: iptables: use destination port numbers for netbios-ns connection tracker
  (Commit `ae43a6b2 <http://sourceforge.net/p/kaarpux/code/ci/ae43a6b2a5092c1b3409cfad1bc08003a898f376/>`_)

- FIX: system-config-printer: upstream patch
  (Commit `bb11cf9d <http://sourceforge.net/p/kaarpux/code/ci/bb11cf9dba77f01d448227026f5f3dd89e070d7c/>`_)

- FIX: gdbm: testgdbm renamed to gdbmtool
  (Commit `919b2dd9 <http://sourceforge.net/p/kaarpux/code/ci/919b2dd9344ec589ec276888e2f7022c1559b6c6/>`_)

- FIX: sane-backends: correct upstream checksum \[reverted]
  (Commit `8412fcb2 <http://sourceforge.net/p/kaarpux/code/ci/8412fcb205edb818a9dcc3975fd358ef04e7c23d/>`_,
  `b766e69b <http://sourceforge.net/p/kaarpux/code/ci/b766e69bb0faf182ad2eeb4d916cc7ef0845b4f0/>`_)

- FIX: cups: create /etc/systemd/system/printer.target.wants on install
  (Commit `b1fb0365 <http://sourceforge.net/p/kaarpux/code/ci/b1fb03651058cfa14785add036ef5beeb5abcb1d/>`_)

- FIX: avahi: create /etc/systemd/system/sockets.target.wants on install
  (Commit `e01dd616 <http://sourceforge.net/p/kaarpux/code/ci/e01dd616ff4ab7fab788295f3645630427fe0d21/>`_)

- FIX: cups: create /etc/systemd/system/sockets.target.wants on install
  (Commit `28a0b1e6 <http://sourceforge.net/p/kaarpux/code/ci/28a0b1e661fcea3c1180e1f275890631913f46c5/>`_)

- FIX: gnome-color-manager: patches for docbook documentation
  (Commit `3bd93dfa <http://sourceforge.net/p/kaarpux/code/ci/3bd93dfa6d95f8a4e10a784b958ed6aa6a788bc6/>`_)


Minor Changes
#############

- MINOR: KxTools: make_package_scripts improved for perl modules
  (Commit `a7dd0c9c <http://sourceforge.net/p/kaarpux/code/ci/a7dd0c9c4e63d4bd1aa48a26dca8f892ce98b9dd/>`_)

- MINOR: KxTools: make_package_scripts improved for gnu upstream
  (Commit `715b9bff <http://sourceforge.net/p/kaarpux/code/ci/715b9bff553c5b8f32fc13befbdbe8d192dad6a0/>`_)

- IMPROVE: KxTools: kx_version improved upstream url functions
  (Commit `242f9017 <http://sourceforge.net/p/kaarpux/code/ci/242f9017a3849a075fc34d5bebc1c16fa6aba954/>`_)

- MINOR: dbus-python-2: better upstream version script
  (Commit `fbba4494 <http://sourceforge.net/p/kaarpux/code/ci/fbba44941711200b5f9cc8cb67c9751dbf05fa32/>`_)

- MINOR: gcc-libstdc++: better upstream version script
  (Commit `b00f5853 <http://sourceforge.net/p/kaarpux/code/ci/b00f585378f5a8b2e125b1650820391c213156ce/>`_)

- MINOR: docbook-xml: better upstream version script
  (Commit `862711af <http://sourceforge.net/p/kaarpux/code/ci/862711afa3cf8d20e4e7ff07f2f978078a6ba3c0/>`_)

- MINOR: geoclue2: improved upstream version script
  (Commit `5cce3215 <http://sourceforge.net/p/kaarpux/code/ci/5cce3215f590568ad05016f3bac55de3abc2b8ec/>`_)

- IMPROVE: certdata: import SPI CA root certificate
  (Commit `7a2b5ba6 <http://sourceforge.net/p/kaarpux/code/ci/7a2b5ba60ab50cb22f11425a3f309134ca036e5e/>`_)

- MINOR: KxTools: add Accept header in kx_version
  (Commit `c8db4862 <http://sourceforge.net/p/kaarpux/code/ci/c8db4862c0869872c505f3901831ddb337b5fda6/>`_)

- MINOR: KxBuild: add installed_sh_v tag
  (Commit `069dd128 <http://sourceforge.net/p/kaarpux/code/ci/069dd12828dfa50b2d9bd1f88f561b3d34b390e5/>`_)

- IMPROVE: pycurl: build with ssl
  (Commit `9dea3cfc <http://sourceforge.net/p/kaarpux/code/ci/9dea3cfca74137853b7bba684b6c10a5e1181b72/>`_)

- IMPROVE: avahi cups: enable at startup
  (Commit `a1316de4 <http://sourceforge.net/p/kaarpux/code/ci/a1316de49e0bfa6060d46eb14687b9d648e8649f/>`_)

- MINOR: provider_for_google_calendar: better upstream version check
  (Commit `4a0a13f0 <http://sourceforge.net/p/kaarpux/code/ci/4a0a13f06a20bc08d1f9c3aeede8214e67bf9678/>`_)

- MINOR: KxBuild: make master/make_scripts.sh less verbose
  (Commit `9754520f <http://sourceforge.net/p/kaarpux/code/ci/9754520fcf2ba4f9e651d2983408c653f6744e31/>`_)

- MINOR: KxBuild: silent detection of clang
  (Commit `8ca53257 <http://sourceforge.net/p/kaarpux/code/ci/8ca5325704158b2f777fcc3204082731375f767d/>`_)

- IMPROVE: gcc binutils: have gcc install libiberty
  (Commit `7faa0dce <http://sourceforge.net/p/kaarpux/code/ci/7faa0dced8c65f57d08a450ebe0cf444628fa369/>`_)

- IMPROVE: sqlite: better version wizard
  (Commit `2c8637f7 <http://sourceforge.net/p/kaarpux/code/ci/2c8637f789719f3f2652d528ff00a13070f80639/>`_)

- MINOR: KxBuild: remove SHA_FILE after verifying
  (Commit `04a2b28c <http://sourceforge.net/p/kaarpux/code/ci/04a2b28c8cb9cefed9de1425b8acccf19c5af160/>`_)

- MINOR: brasero: correct installed version
  (Commit `6faa6ed0 <http://sourceforge.net/p/kaarpux/code/ci/6faa6ed0845fc35f8ceeb82217e71c90ffe50899/>`_)

- MINOR: file-roller: correct installed version
  (Commit `ca098eca <http://sourceforge.net/p/kaarpux/code/ci/ca098ecaaf049b7b73c1d61d6e76da04a59e8072/>`_)

- IMPROVE: KxBuild: install bash in tools (needed for glibc)
  (Commit `d5f87054 <http://sourceforge.net/p/kaarpux/code/ci/d5f8705463c4a2e790c9e091f37a90400544718a/>`_)

- MINOR: KxBuild: do not install files for static ip; not used anymore
  (Commit `41e8b3c0 <http://sourceforge.net/p/kaarpux/code/ci/41e8b3c08519cffcac4544231c71680ac5483930/>`_)

- MINOR: llvm: configure options to make llvm slightly faster
  (Commit `3bfc7e40 <http://sourceforge.net/p/kaarpux/code/ci/3bfc7e405918491a659d8fa5df4fcfba1b193995/>`_)

- IMPROVE: KxBuild: check download partition before mounting
  (Commit `b609c7fd <http://sourceforge.net/p/kaarpux/code/ci/b609c7fd4addbfe34913ab1eb67f7799b49d67f1/>`_)

- IMPROVE: KxBuild: during bootstrap, only download bootstrap packages
  (Commit `634fcf4b <http://sourceforge.net/p/kaarpux/code/ci/634fcf4b0cd92ec658684d376b784fbd1559ba0c/>`_)


