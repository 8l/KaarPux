.. 
   KaarPux: http://kaarpux.kaarposoft.dk
   Copyright (C) 2015: Henrik Kaare Poulsen
   License: http://kaarpux.kaarposoft.dk/license.html

.. _changes_4_3_0:


================================
Changes in KaarPux version 4.3.0
================================


:program:`KaarPux` version ``4.3.0`` released on ``2014-may-13``

- Support for Slackware host

- Support for VMware player

- Improve sshd usage

- Download packages in parallel

- Bugs fixed

- Packages updated

- libaio added

- Packages Removed

- Minor Changes


Support for Slackware host
##########################

- IMPROVE: KxBuild: include instructions and script for slackware
  (Commit `8ba12abd <http://sourceforge.net/p/kaarpux/code/ci/8ba12abdc5beb6f36cfd3ddb0b74b4e269641803/>`_)


Support for VMware player
#########################

- IMPROVE: linux: kernel config settings for VMware Player
  (Commit `c5557340 <http://sourceforge.net/p/kaarpux/code/ci/c55573408ab5d0fa4941850cb20d4770c027c60f/>`_)

- IMPROVE: linux: add CONFIG_DRM_VMWGFX_FBCON for VMware
  (Commit `60fdc5ff <http://sourceforge.net/p/kaarpux/code/ci/60fdc5fff77f296a884c01d3d24ae334a74fe3d3/>`_)

- IMPROVE: xorg: add xf86-video-vmware for VMware
  (Commit `0704d969 <http://sourceforge.net/p/kaarpux/code/ci/0704d9690c9c7c2019a621c84d804ee4bc3494ff/>`_)


Improve sshd usage
##################

- ADD: haveged: unpredictable random number generator
  (Commit `1e8e098a <http://sourceforge.net/p/kaarpux/code/ci/1e8e098a19f2d153f90d8d22ec7771662cac5a8c/>`_)

- IMPROVE: openssh: better config; host key generation on first boot
  - generate ssh host keys on first boot
  - improve entropy harvesting on linux
  - config files in separate openssh.files
  - improved sshd_config
  Commit `e83fd581 <http://sourceforge.net/p/kaarpux/code/ci/e83fd58167be190a4265d59c381346e271b25d7b/>`_


Download packages in parallel
#############################

- ADD: parallel: GNU parallel is a shell tool for executing jobs in parallel
  (Commit `0294e296 <http://sourceforge.net/p/kaarpux/code/ci/0294e29672745ee61fb271c653ac1152ff706057/>`_)

- DOC: www: Note that we now need 'GNU parallel' on the host
  (Commit `e504c443 <http://sourceforge.net/p/kaarpux/code/ci/e504c443c8d6ecd55a2cfd4450ef47efa776cdbf/>`_)

- DOC: www: note that parallel needs to be at least version 20130822
  (Commit `ad79f864 <http://sourceforge.net/p/kaarpux/code/ci/ad79f864eb22af8b8267310ff079872a317981e6/>`_)

- IMPROVE: KxBuild: download_packages_2.sh
  (Commit `3119741a <http://sourceforge.net/p/kaarpux/code/ci/3119741a821ed745573021d6da906f869cf29754/>`_)

- IMPROVE: KxBuild: use download_packages_2
  (Commit `f7d57779 <http://sourceforge.net/p/kaarpux/code/ci/f7d577799441fc3180d0675c87dfb5c474a0d223/>`_)

- DOC: www: add linux/download_all_packages.sh when 'Building the complete KaarPux system'
  (Commit `98e9610d <http://sourceforge.net/p/kaarpux/code/ci/98e9610dbf67af04f15678c034d9aae217638e4e/>`_)

- IMPROVE: KxBuild: add 'GNU parallel' to host scripts
  (Commit `07512483 <http://sourceforge.net/p/kaarpux/code/ci/0751248393cb8de283f87e478a0e692b35c95e8b/>`_)

- FIX: download_packages_2: do not verify checksum if download failed
  (Commit `05bf0dd0 <http://sourceforge.net/p/kaarpux/code/ci/05bf0dd05815c4a7a35935437e8f7310d2625090/>`_)

- FIX: download_packages_2: correct options to wget for downloading keys
  (Commit `f8eeb545 <http://sourceforge.net/p/kaarpux/code/ci/f8eeb5453b6c22c657ce91237f23bb46de9f0a74/>`_)

- FIX: KxBuild: download_packages_2: add --gnu to 'parallel' for borked hosts
  (Commit `46efa243 <http://sourceforge.net/p/kaarpux/code/ci/46efa243b9c85e9cdfebc1dba7af74fea09970d0/>`_)

- IMPROVE: KxBuild: host_fedora to use rawhide version of parallel
  (Commit `96695aba <http://sourceforge.net/p/kaarpux/code/ci/96695abaa5de8fa4b9d6f7007a7802607ba855b8/>`_)


Bugs fixed
##########

- FIX: dangerous_build_bootstrap: make sure downloads get owned by kaarpux
  (Commit `25bc6994 <http://sourceforge.net/p/kaarpux/code/ci/25bc6994ede56f8ee6e2f8151ff446e6fd0008db/>`_)

- FIX: virtual/kvm: use different port number for spice
  (Commit `1b737687 <http://sourceforge.net/p/kaarpux/code/ci/1b737687e31878f06c1e18eb1fab3c24e7b051cc/>`_)

- FIX: cups-filters: make_repeat
  (Commit `07d05b6f <http://sourceforge.net/p/kaarpux/code/ci/07d05b6fe28aeabcd6b1263be47af03e59f4d593/>`_)

- FIX: curl: patches for testcases
  (Commit `a0715ab7 <http://sourceforge.net/p/kaarpux/code/ci/a0715ab78c39f809ce2f8a0d533ca60f071ad52a/>`_,
  `f41e99a3 <http://sourceforge.net/p/kaarpux/code/ci/f41e99a31d706c574a52676799d45263e9f8688e/>`_)

- FIX: orc: compile with gcc
  (Commit `03b3c790 <http://sourceforge.net/p/kaarpux/code/ci/03b3c79043d9ce3137261347668898b8414bd684/>`_)

- FIX: KxTools: skip over malformed lines when listing installed files
  (Commit `6b19c874 <http://sourceforge.net/p/kaarpux/code/ci/6b19c8746c9948a6197d71723b1c2350e1c1be8e/>`_)

- FIX: grub: put GRUB_DISTRIBUTOR in /etc/default/grub
  (Commit `b6361b90 <http://sourceforge.net/p/kaarpux/code/ci/b6361b90c04ee24592fc16f61b4e4de2c03d8e4f/>`_)


Packages updated
################

- UPD: libcdr libcmis libetonyek liblangtag mdds raptor2 rasqal: LibreOffice prereqs updated
  (Commit `cc3dd8d4 <http://sourceforge.net/p/kaarpux/code/ci/cc3dd8d4400d59ac34728384f5d5c8249881e2d9/>`_)

- UPD: libreoffice: v 4.2.3.3
  (Commit `74a4f650 <http://sourceforge.net/p/kaarpux/code/ci/74a4f6507feb36f06ce284c0950183dd5ba93423/>`_)

- UPD: libmicrohttpd: v 0.9.35
  (Commit `ff61071d <http://sourceforge.net/p/kaarpux/code/ci/ff61071d65bdb1184f1d2e7e1ae647ca17a8df48/>`_)

- UPD: liboil: patch to latest upstream
  (Commit `810bd4b1 <http://sourceforge.net/p/kaarpux/code/ci/810bd4b146bd2d9d86ced61505777b80eca7fe98/>`_)

- UPD: at-spi2-core: v 2.12.0
  (Commit `46a57f5a <http://sourceforge.net/p/kaarpux/code/ci/46a57f5a5fef7a2224a375475fc5372d7555aebe/>`_)

- UPD: libsoup: v 2.46.0
  (Commit `7353b323 <http://sourceforge.net/p/kaarpux/code/ci/7353b323fe0415ecb1caf2c4efe9a706483128ea/>`_)

- UPD: NetworkManager: v 0.9.8.10
  (Commit `7fb3393b <http://sourceforge.net/p/kaarpux/code/ci/7fb3393b2102af132c25219db86dec6961474a63/>`_)

- UPD: rest: v 0.7.91
  (Commit `fbce37e1 <http://sourceforge.net/p/kaarpux/code/ci/fbce37e1ceb36d1f96476415d3a63a14791bed9a/>`_)

- UPD: dbus: v 1.8.2
  (Commit `72391ced <http://sourceforge.net/p/kaarpux/code/ci/72391cedb0327bf7b33515a57ee4335002626353/>`_)

- UPD: lxc: v 1.0.3
  (Commit `77de4ea2 <http://sourceforge.net/p/kaarpux/code/ci/77de4ea2019aa216d9ab95feec86104608776a7d/>`_)

- UPD: systemtap: v 2.5
  (Commit `eae511d6 <http://sourceforge.net/p/kaarpux/code/ci/eae511d65ef7e35b261e36edbbf9b27b42f84329/>`_)

- UPD: gnutls:v 3.2.14
  (Commit `8f48cdeb <http://sourceforge.net/p/kaarpux/code/ci/8f48cdeb142302c4ffe9d8d14f20b8a48e91dd99/>`_)

- UPD: nss: v 3.16.1
  (Commit `06207059 <http://sourceforge.net/p/kaarpux/code/ci/06207059507edf37e44d84a2b715c6b1d7fc0fb6/>`_)

- UPD: firefox: v 29.0.1
  (Commit `2d43f0fe <http://sourceforge.net/p/kaarpux/code/ci/2d43f0fe42623dc42b332cea2cc2cfd6eef95ef6/>`_)

- UPD: MesaLib: v 10.1.2
  (Commit `94022e36 <http://sourceforge.net/p/kaarpux/code/ci/94022e369d4e44ea572dcab7e02b1dbd0a8012c9/>`_)

- UPD: linux: v 3.14.3
  (Commit `a063a3f3 <http://sourceforge.net/p/kaarpux/code/ci/a063a3f3a075fffa9fabc9c7cdaaa61436de6b84/>`_)


libaio added
############

- ADD: libaio
  (Commit `5a6088e5 <http://sourceforge.net/p/kaarpux/code/ci/5a6088e58449a3cffb74b5336d7c3d9ba7c7ab71/>`_)


Packages Removed
################

- REMOVE: gnome-mime-data: used for gnome-vfs which is now removed
  (Commit `31197b08 <http://sourceforge.net/p/kaarpux/code/ci/31197b08061ff2112d87c176ae1a5e1b62781305/>`_)

- REMOVE: libIDL: used for corba/orbit which has been removed
  (Commit `6a12887b <http://sourceforge.net/p/kaarpux/code/ci/6a12887b3f8aa4049c98278e8b917b614a5d2f7c/>`_)

- REMOVE: nautilus-sendto: we really don't want to send emails from file manager
  (Commit `71976882 <http://sourceforge.net/p/kaarpux/code/ci/71976882c8d79921e0fe73295efe511d21753ad3/>`_)

- REMOVE: ragel: not used by anything
  (Commit `842a0672 <http://sourceforge.net/p/kaarpux/code/ci/842a0672b645130f33f2acf3e10e7c93f50edbf6/>`_)

- REMOVE: SampleICC: not used by anything
  (Commit `213fa897 <http://sourceforge.net/p/kaarpux/code/ci/213fa89752639557139ec521e9b1969440f09132/>`_)

- REMOVE: xf86-input-\*: not used since we have xf86-input-evdev
  (Commit `95e50da4 <http://sourceforge.net/p/kaarpux/code/ci/95e50da444173b0168ad5af9e62699310ff8716c/>`_)


Minor Changes
#############

- MINOR: KxBuild: add tag append_pkg_file
  (Commit `913a2e90 <http://sourceforge.net/p/kaarpux/code/ci/913a2e9071fd23464114653c4c6708f0f4635356/>`_,
  `88d9dc9b <http://sourceforge.net/p/kaarpux/code/ci/88d9dc9bacde6439453737c0610601380dedd3ec/>`_)

- MINOR: default_definitions: remove unused KX_CONSOLE_UNICODE
  (Commit `817abe73 <http://sourceforge.net/p/kaarpux/code/ci/817abe73b15ba07b751e22bcd12ffcaeeb5d73e5/>`_)

- IMPROVE: initramfs: redirect to stdout/stderr if dropping to busybox
  (Commit `23e9dcb8 <http://sourceforge.net/p/kaarpux/code/ci/23e9dcb8ce33cf6e2cb9a5486e5cbf192f68c6ba/>`_)

- MINOR: docbook2X: ignore check results; old and seems unmaintained
  (Commit `0c2cfc28 <http://sourceforge.net/p/kaarpux/code/ci/0c2cfc28b6fe39a3e4f560b4cb97ebbfad413259/>`_)

- MINOR: libmicrohttpd: remove unused patch for testcase
  (Commit `c064111d <http://sourceforge.net/p/kaarpux/code/ci/c064111d35dea5602d11ba2d6ea0d8f7a48129a9/>`_)

- MINOR: dmidecode: remove 'make check' which is not implemented
  (Commit `30bd3aa3 <http://sourceforge.net/p/kaarpux/code/ci/30bd3aa33a0a3ba88d6e6dfc034314f4273717dc/>`_)

- MINOR: lm_sensors: remove 'make check' which is not implemented
  (Commit `1503c59e <http://sourceforge.net/p/kaarpux/code/ci/1503c59ed0eef02e7b214d0e6d09d1ecdb4efae7/>`_)

- MINOR: liboil: ignore 'make check' errors; package is unmaintained anyway
  (Commit `7458a76d <http://sourceforge.net/p/kaarpux/code/ci/7458a76d19f6d8d341cb7901538e00f260e17389/>`_)

- MINOR: certdata: some packages expect /etc/ssl/certs/ca-certificates.crt
  (Commit `6aaacae3 <http://sourceforge.net/p/kaarpux/code/ci/6aaacae32b0643624a31ed9184dfbaa3efb7bfe0/>`_)

- IMPROVE: neon: better configure options
  (Commit `1bcecf14 <http://sourceforge.net/p/kaarpux/code/ci/1bcecf142c23f09d37b6532faa94dff88afdcb4e/>`_)

- IMPROVE: apache-ant: better download location; verify signature
  (Commit `8ab3290a <http://sourceforge.net/p/kaarpux/code/ci/8ab3290a42c705e2c366d6452858e966b06db040/>`_)

- IMRPOVE: linux: add TRACEPOINTS, UPROBE, and FTRACE config for systemtap
  (Commit `31d3302a <http://sourceforge.net/p/kaarpux/code/ci/31d3302a970318382f64c1e97b9c9df863040e43/>`_)

- IMPROVE: systemtap: patch for infinite loop in task_dentry_path
  (Commit `2f0073ce <http://sourceforge.net/p/kaarpux/code/ci/2f0073ce407dd4889815a5b3553cca7ce745e55e/>`_)

- IMRPOVE: KxBuild: ignore pipe and socket files from kx_open in systemtap
  (Commit `d9818543 <http://sourceforge.net/p/kaarpux/code/ci/d981854363d148de75ebc3ce5c5059fd3ad79233/>`_)

- MINOR: kx_open: add (commented out) debug line for later use
  (Commit `c9d75e2c <http://sourceforge.net/p/kaarpux/code/ci/c9d75e2c1a3c6556eb7e0ec20bf962bb5fd3d3d9/>`_)

- MINOR: install_kx_open_stp: doh, 16348 -> 16384 = 2^14
  (Commit `e52921af <http://sourceforge.net/p/kaarpux/code/ci/e52921af0d3c2cc4e739cde192fe0e9d7d311fa7/>`_)

- IMPROVE: gimp babl gegl: better upstream location
  (Commit `325acae9 <http://sourceforge.net/p/kaarpux/code/ci/325acae935e49102b27205589612d5e0f4144586/>`_)

- IMPROVE: ghc-binary: use a precompiled version from a previous version of KaarPux
  (Commit `598a64b8 <http://sourceforge.net/p/kaarpux/code/ci/598a64b841bfa442a2ecfcbf1e85fd786b2effe2/>`_)

- MINOR: KxTools: include /etc directory in list of installed files
  (Commit `8f54a416 <http://sourceforge.net/p/kaarpux/code/ci/8f54a416fc5b02325d6cf777ca31036f8a288f86/>`_)

- IMPROVE: KxTools: add unused_packages script
  (Commit `3e1fc84a <http://sourceforge.net/p/kaarpux/code/ci/3e1fc84ab621719e5c2889acb860770fa4ef449e/>`_)

- IMPROVE: KxBuild: default_definitions: KX_BUILD_UID=888 to avoid clash with hosts
  (Commit `aa4924ac <http://sourceforge.net/p/kaarpux/code/ci/aa4924ac5029e5ec990c8e210ffac0a399eca2f5/>`_)

- IMPROVE: KxBuild: host_fedora to install gnupg
  (Commit `99f5f8d7 <http://sourceforge.net/p/kaarpux/code/ci/99f5f8d7265cd44b584d41f9e24b01f94a0653fd/>`_)

- IMPROVE: kx_changelog: default version and revision_range; id in <section>
  (Commit `701405f0 <http://sourceforge.net/p/kaarpux/code/ci/701405f03bdcb248503f5d2b843d8bf856c66a48/>`_)

- DOC: default_definitions: add comment on swap in fstab
  (Commit `0649b11c <http://sourceforge.net/p/kaarpux/code/ci/0649b11c068d8a102684770021d31e421cbe2d8e/>`_)

- DOC: default_definitions: add comments on localization
  (Commit `c0eedcbd <http://sourceforge.net/p/kaarpux/code/ci/c0eedcbda81c333d5603505487ef747c8663884e/>`_)

- DOC: www: typo in vi ${CFG} command
  (Commit `3686eb00 <http://sourceforge.net/p/kaarpux/code/ci/3686eb00e3f9a4dd64d59964c30e62aea8aea56c/>`_)

- DOC: linux: add comments on allmodconfig
  (Commit `e91d66b8 <http://sourceforge.net/p/kaarpux/code/ci/e91d66b81246c2e1d6fff6c96e828533501630d7/>`_)

- DOC: liboil: reference to upstream www
  (Commit `7032503c <http://sourceforge.net/p/kaarpux/code/ci/7032503c788a5e8fa06a379c9b8ee7a011d103ef/>`_)

- DOC: www: Add upstream links for required host tools
  (Commit `49716e8d <http://sourceforge.net/p/kaarpux/code/ci/49716e8d6d1ce34e17594b491be37650c4ee91d1/>`_)

- DOC: www: put id on every section to avoid strange machine-generated id numbers
  (Commit `c6ff1369 <http://sourceforge.net/p/kaarpux/code/ci/c6ff136932dd164d1a95663ea925e3c5c806f35d/>`_)

- DOC: www: README files for sourceforge
  (Commit `3cc09c4a <http://sourceforge.net/p/kaarpux/code/ci/3cc09c4abc2f7a9c8a20cf7b6bd5e12df1ab0c98/>`_)

- DOC: KaarPux: updated CVE info
  (Commit `949be3b4 <http://sourceforge.net/p/kaarpux/code/ci/949be3b4ec6bbc880c79634ffaa50dbf37ea6731/>`_)

- DOC: www: better instructions for building in kvm
  (Commit `4142249c <http://sourceforge.net/p/kaarpux/code/ci/4142249c660a4dbc2a89010cd5573ad241911a8b/>`_)


