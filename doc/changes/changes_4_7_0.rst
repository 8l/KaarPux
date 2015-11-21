.. 
   KaarPux: http://kaarpux.kaarposoft.dk
   Copyright (C) 2015: Henrik Kaare Poulsen
   License: http://kaarpux.kaarposoft.dk/license.html

.. _changes_4_7_0:


================================
Changes in KaarPux version 4.7.0
================================


:program:`KaarPux` version ``4.7.0`` released on ``2014-sep-30``

- glibc updated to version 2.20

- llvm/clang updated to version 3.5.0

- bash updated to version 4.3.27 (shellshock fix)

- Python package cleanup

- Improved verification

- More fonts added

- Install more manual pages

- Bugs fixed

- Packages added

- Packages updated

- Minor Changes


glibc updated to version 2.20
#############################

- UPD: glibc: v 2.20
  (Commit `45cfc870 <http://sourceforge.net/p/kaarpux/code/ci/45cfc8703270abbfaaa81b90386f4e14878b9e22/>`_)

- UPD: glibc: v 2.20-44-g68870f1
  (Commit `1cf3c66a <http://sourceforge.net/p/kaarpux/code/ci/1cf3c66ae8d95283e2550bf1dfe22527a865930e/>`_)

- FIX: linux: patch for glibc 2.20
  (Commit `6a916254 <http://sourceforge.net/p/kaarpux/code/ci/6a9162540f5745eeccd61175f2127791089be4dd/>`_)


llvm/clang updated to version 3.5.0
###################################

- UPD: llvm: v 3.5.0
  (Commit `558e4aa0 <http://sourceforge.net/p/kaarpux/code/ci/558e4aa0138c034ad553f4a10bea4cdb824801e5/>`_)

- FIX: firefox: use_gcc (we get coredumps with clang 3.5.0)
  (Commit `3dca60cf <http://sourceforge.net/p/kaarpux/code/ci/3dca60cf5961b757136db49415edb30c899b8e9f/>`_)


bash updated to version 4.3.27 (shellshock fix)
###############################################

- UPD: bash: v 4.3.27; CVE-2014-6271 and CVE-2014-7169
  (Commit `8d325c1a <http://sourceforge.net/p/kaarpux/code/ci/8d325c1a6467062be9ae689c181f90c7791ef8de/>`_)


Python package cleanup
######################

- UPD: setuptools: v 5.7
  (Commit `ff0ccef2 <http://sourceforge.net/p/kaarpux/code/ci/ff0ccef2fb7beb8e2fa2e64532daf70f2c784c56/>`_)

- FIX: pyatspi: use Python 2 (we have pyatspi3 for Python 3)
  (Commit `97629154 <http://sourceforge.net/p/kaarpux/code/ci/9762915472653391f05d4a9f0cb1d7a1a97bea91/>`_)

- FIX: pycurl: use Python 3
  (Commit `b5f46c23 <http://sourceforge.net/p/kaarpux/code/ci/b5f46c23260d2012fe1725ee0c523326d3432c36/>`_)

- FIX: pycups: use Python 3
  (Commit `e7fb3571 <http://sourceforge.net/p/kaarpux/code/ci/e7fb3571462d05675083c525c104d4587f00baa4/>`_)

- IMPROVE: caribou d-feet gnome-tweak-tool itstool pyatspi system-config-printer: use Python3
  (Commit `c1112f8a <http://sourceforge.net/p/kaarpux/code/ci/c1112f8a8cafb5b629bd5999d2a2b02ae976a7e2/>`_)

- IMPROVE: py*: pygobject cleanup (now we only have Python3+gtk3 version)
  (Commit `eb5df73c <http://sourceforge.net/p/kaarpux/code/ci/eb5df73cc2cfd0d459101cee254d3eaa292907cb/>`_)


Improved verification
#####################

- FIX: \*: correct verify_cli testcases
  (Commit `1546eae7 <http://sourceforge.net/p/kaarpux/code/ci/1546eae7c25e9acc87ec30613ea3b4fc3954aea7/>`_)

- FIX: KxTest: kx_gui_test: make some errors warnings instead (useful e.g. if application is going away)
  (Commit `6d7acb57 <http://sourceforge.net/p/kaarpux/code/ci/6d7acb579305d45f944d8c6ac0d7163ed4c1fae5/>`_)

- FIX: KxTest: kx_gui_test: add short sleep when simulating ALT-F4 keypress
  (Commit `43570ea7 <http://sourceforge.net/p/kaarpux/code/ci/43570ea70109679ebeb552cb8d1ef4c29326cb6f/>`_)

- FIX: KxTest: kx_gui_test: on DESKTOP set kxgt_global_current = kxgt_global_desktop
  (Commit `a756ab6a <http://sourceforge.net/p/kaarpux/code/ci/a756ab6a604e98de230700e8fa7b3a93af094526/>`_)

- FIX: \*: correct verify_gui testcases
  (Commit `623a1154 <http://sourceforge.net/p/kaarpux/code/ci/623a1154e807c874eefde8221f5038ea6fbd2b84/>`_)

- FIX: KxTest: kx_gui_test: Make sure applications are turning on AT-SPI
  (Commit `2f4bbb8a <http://sourceforge.net/p/kaarpux/code/ci/2f4bbb8a0e236559af2c1a6bac6366e5b8ff32ac/>`_)

- FIX: firefox thunderbird libreoffice: correct verify_gui testcases
  (Commit `a146da48 <http://sourceforge.net/p/kaarpux/code/ci/a146da487741dbcc1905a128cb7ae668e2928ec3/>`_)

- IMPROVE: KxTest: kx_gui_test: flush each line of output if run with debug=TRUE
  (Commit `25dbf56d <http://sourceforge.net/p/kaarpux/code/ci/25dbf56d4d677c4c93f62451802b77977d6e797b/>`_)

- IMPROVE: KxTest: kx_gui_test: allow DO command with no arguments to execute default action
  (Commit `323a7958 <http://sourceforge.net/p/kaarpux/code/ci/323a795819594f7088aed807869665d2752e58b7/>`_)


More fonts added
################

- ADD: cabextract: extracting Microsoft cabinet files, also called .CAB files
  (Commit `8a323ef6 <http://sourceforge.net/p/kaarpux/code/ci/8a323ef60a5f1b46bc2a7f2cc5944f9bdfddb48c/>`_)

- ADD: mscorefonts: Microsoft's TrueType core fonts
  (Commit `0dc6779d <http://sourceforge.net/p/kaarpux/code/ci/0dc6779d3aac4fe6b26ad03e044e933e82c33108/>`_)


Install more manual pages
#########################

- ADD: Sphinx (and prereqs): for building llvm documentation
  (Commit `e40ac696 <http://sourceforge.net/p/kaarpux/code/ci/e40ac696ac3cd93652a026fd89917b270f570729/>`_)

- UPD: man-pages: v 3.72
  (Commit `38322a3f <http://sourceforge.net/p/kaarpux/code/ci/38322a3f95c923638cee73056fb4277abb52c6b9/>`_)

- IMPROVE: \*: install man pages
  (Commit `713f8c34 <http://sourceforge.net/p/kaarpux/code/ci/713f8c34bf45c015c21abc41472e3829e6eec6a5/>`_)


Bugs fixed
##########

- FIX: findlib: make_repeat (and remove --with-toolbox)
  (Commit `f9e1e8de <http://sourceforge.net/p/kaarpux/code/ci/f9e1e8deef18d157dffc95bf3c8de9f1e1ce05ac/>`_)

- FIX: caribou: --disable-static (not --disable-shared) --enable-gtk2-module
  (Commit `5a661e36 <http://sourceforge.net/p/kaarpux/code/ci/5a661e36fee10239763918effe21122eef30ef2a/>`_)

- FIX: firefox: correct check for KX_DISABLE_TEST
  (Commit `c146143d <http://sourceforge.net/p/kaarpux/code/ci/c146143d96bde9af37e1b1900c1653195da6ecbe/>`_)

- FIX: wpa_supplicant: do not install bogus man directories
  (Commit `714021b3 <http://sourceforge.net/p/kaarpux/code/ci/714021b3af399b30ed1d66d424dac7fe821a4144/>`_)

- FIX: KxBuild: make_scripts: do not create bogus linux/log/strace directory
  (Commit `17ac21e4 <http://sourceforge.net/p/kaarpux/code/ci/17ac21e4369f982952b438d708984a42247acef2/>`_)

- FIX: gdm: Failed to give slave programs access to the display. Trying to proceed.
  (Commit `2c98489a <http://sourceforge.net/p/kaarpux/code/ci/2c98489ad1740ed47c6cfeb69ff96cf167c0a8a6/>`_)

- FIX: xkeyboard-config: remember to put xkeyboard-config in master.yaml
  (Commit `1d6ccb80 <http://sourceforge.net/p/kaarpux/code/ci/1d6ccb80924351a211061063a668090f860bbdb1/>`_)

- FIX: libvpx: use_gcc
  (Commit `d1413a79 <http://sourceforge.net/p/kaarpux/code/ci/d1413a79b01f5dc7a6694e863d714088efe6f153/>`_)

- FIX: MesaLib: upstream patches
  (Commit `5b43f569 <http://sourceforge.net/p/kaarpux/code/ci/5b43f569bfa8a46fd1795759f567b5cf4b5632ef/>`_)

- FIX: jasper: patches from ArchLinux
  (Commit `c860ff01 <http://sourceforge.net/p/kaarpux/code/ci/c860ff01f8b604a44e910de32c0d9959a5707367/>`_)

- FIX: qt: qmake is not installed yet; use local version
  (Commit `d513f593 <http://sourceforge.net/p/kaarpux/code/ci/d513f593b8a7cfe2fc802b25f4dcafe90ed39418/>`_)

- FIX: bash: actually apply the patches
  (Commit `4ccbeac8 <http://sourceforge.net/p/kaarpux/code/ci/4ccbeac84b5dccc977ff8935b2e20b2c79219963/>`_)


Packages added
##############

- ADD: opus; replacing speex
  (Commit `f5326f3b <http://sourceforge.net/p/kaarpux/code/ci/f5326f3bbb38bd58431627c80e02f8ff0e859b74/>`_)

- ADD: libdvdnav
  (Commit `56ef4f44 <http://sourceforge.net/p/kaarpux/code/ci/56ef4f447a668f03a99075b46a9381a52920b13d/>`_)

- ADD: xcb-util-\*; prereq for qt5
  (Commit `0bd9b3d1 <http://sourceforge.net/p/kaarpux/code/ci/0bd9b3d182c9d80a2653764cb39b182f22b542dd/>`_)

- ADD: libbase58: prereq for cryptocurrencies
  (Commit `197a8f8e <http://sourceforge.net/p/kaarpux/code/ci/197a8f8e3c7136e54fd1f287698edcea009df1f8/>`_)


Packages updated
################

- UPD: ibus: v 1.5.8; from new upstream location
  (Commit `db519ca0 <http://sourceforge.net/p/kaarpux/code/ci/db519ca0305dab19daf8d3fcb89471295e54b89c/>`_)

- UPD: flash_player_11: v 11.2.202.406
  (Commit `3c2e7988 <http://sourceforge.net/p/kaarpux/code/ci/3c2e79882da92870102215af02ca0382f616f352/>`_)

- UPD: xkeyboard-config: v 2.12; also move to separate package with non-standard download location
  (Commit `62a225a1 <http://sourceforge.net/p/kaarpux/code/ci/62a225a1c2cce458839177d6a16c8c1c8a484883/>`_)

- UPD: MesaLib: v 10.2.7
  (Commit `1180e39b <http://sourceforge.net/p/kaarpux/code/ci/1180e39b9f3cd18be367814252972fda6a279119/>`_)

- UPD: xf86-video-intel: v 2.99.916
  (Commit `dd1d7140 <http://sourceforge.net/p/kaarpux/code/ci/dd1d714043f2000b2a670b02d4661f268201ef56/>`_)

- UPD: thunderbird: v 31.1.1
  (Commit `f3a8d018 <http://sourceforge.net/p/kaarpux/code/ci/f3a8d0185906218d75415195c1f669e4b25b06cb/>`_)

- UPD: noscript: v 2.6.8.41
  (Commit `689dbe08 <http://sourceforge.net/p/kaarpux/code/ci/689dbe0840706b73912cac6e06bcec89dad65acd/>`_)

- UPD: qemu: v 2.1.1
  (Commit `df092eae <http://sourceforge.net/p/kaarpux/code/ci/df092eae9cc2988d80e47c7be512a8a5746acc7f/>`_)

- UPD: system-config-printer: v 1.5.1 plus patches; better upstream version check
  (Commit `2fc40656 <http://sourceforge.net/p/kaarpux/code/ci/2fc40656fdfb960cb7502fa69ae1ac3933d569ba/>`_)

- UPD: valgrind: v 3.10.0
  (Commit `1addfbbd <http://sourceforge.net/p/kaarpux/code/ci/1addfbbd65c4e224b6c039df1ac8eda508b7e79f/>`_)

- UPD: firefox: v 32.0.1
  (Commit `f5a8ecdb <http://sourceforge.net/p/kaarpux/code/ci/f5a8ecdb82ad16d917ea236079f81ebf977744dc/>`_)

- UPD: linux: v 3.16.3
  (Commit `d86ba0d0 <http://sourceforge.net/p/kaarpux/code/ci/d86ba0d0e7e7376d0706a265014056fcf15fb87a/>`_)

- UPD: lzip: v 1.16
  (Commit `5f6a0df3 <http://sourceforge.net/p/kaarpux/code/ci/5f6a0df3d93ed0fa4c27469154614376145f5c2b/>`_)

- UPD: perl: v 5.20.1
  (Commit `92d7ba54 <http://sourceforge.net/p/kaarpux/code/ci/92d7ba54add7a530ba68130d5f3132fe93c1dad7/>`_)

- UPD: xz: v 5.0.6
  (Commit `e1f21c80 <http://sourceforge.net/p/kaarpux/code/ci/e1f21c805887e66e455e2ea42631c320d63ef23d/>`_)

- UPD: firefox:v 32.0.2
  (Commit `f8a1bd18 <http://sourceforge.net/p/kaarpux/code/ci/f8a1bd1855afed13245bfd27ae417187a4d90148/>`_)

- UPD: vte: v 0.38.0
  (Commit `0d107929 <http://sourceforge.net/p/kaarpux/code/ci/0d1079292f97d03f260b68435f6957d883fa88a9/>`_)

- UPD: MesaLib: v 10.2.8
  (Commit `c2814e3b <http://sourceforge.net/p/kaarpux/code/ci/c2814e3bc3597d0d9ffa2ed9632bab20551e1574/>`_)

- UPD: accountsservice: v 0.6.38
  (Commit `0ef0e5ce <http://sourceforge.net/p/kaarpux/code/ci/0ef0e5cedde71a1e56632946f327ad937cf51c55/>`_)

- UPD: brasero: v 3.11.4
  (Commit `22023ee9 <http://sourceforge.net/p/kaarpux/code/ci/22023ee9a5f4e24ae5a620dd061d128d01b8861d/>`_)

- UPD: colord: v 1.2.3
  (Commit `1cb2fb54 <http://sourceforge.net/p/kaarpux/code/ci/1cb2fb542f777005927a6a59d089ed3bcd8ca949/>`_)

- UPD: dbus: v 1.8.8
  (Commit `ba6fcb49 <http://sourceforge.net/p/kaarpux/code/ci/ba6fcb49f385b3f5f218a68b91f9f25cdabd449d/>`_)

- UPD: dconf: v 0.22.0
  (Commit `0ed78b03 <http://sourceforge.net/p/kaarpux/code/ci/0ed78b0305e331751ce926cc994224261d42f5e4/>`_)

- UPD: dhcpcd: v 6.4.5
  (Commit `f5014dd5 <http://sourceforge.net/p/kaarpux/code/ci/f5014dd5af4ac18a5c26b5d64f260c83f281708e/>`_)

- UPD: empathy: v 3.12.6
  (Commit `4b435cc1 <http://sourceforge.net/p/kaarpux/code/ci/4b435cc154b4c97eac2fd6cc71b6755937cded65/>`_)

- UPD: evolution: v 3.12.6
  (Commit `52cb0835 <http://sourceforge.net/p/kaarpux/code/ci/52cb08359fdf335eda4dd32f95231218b67a0ad6/>`_)

- UPD: evolution-data-server: v 3.12.6
  (Commit `9a91536f <http://sourceforge.net/p/kaarpux/code/ci/9a91536f6a0241c3bef6353207b80c4b14227888/>`_)

- UPD: git: v 2.1.1
  (Commit `5e8070f2 <http://sourceforge.net/p/kaarpux/code/ci/5e8070f271aee3e8b744ae6295a746ad3be3f528/>`_)

- UPD: gnome-calculator: v 3.12.4
  (Commit `846864cd <http://sourceforge.net/p/kaarpux/code/ci/846864cd6e3abc21d5ec9c400fd49429ba95e037/>`_)

- UPD: gnome-terminal: v 3.14.0
  (Commit `337316a0 <http://sourceforge.net/p/kaarpux/code/ci/337316a06643e2d505dffb35b50265562955442f/>`_)

- UPD: gst*: v 1.4.2
  (Commit `3058a2c8 <http://sourceforge.net/p/kaarpux/code/ci/3058a2c816f9a68d6e0c819a6bcd6a6238f49561/>`_)

- UPD: libdvdnav: v 5.0.1
  (Commit `88328ccb <http://sourceforge.net/p/kaarpux/code/ci/88328ccb1106a02acddc38286f219ffe9f15c70c/>`_)

- UPD: libdvdread: v 5.0.0
  (Commit `f8dc026e <http://sourceforge.net/p/kaarpux/code/ci/f8dc026e986009641253d30b30cb69383e870919/>`_)

- UPD: libgdata: v 0.16.0
  (Commit `c0c83e9b <http://sourceforge.net/p/kaarpux/code/ci/c0c83e9b520b81688df56f15fd0dfddbb0d51d03/>`_)

- UPD: librsvg: v 2.40.4
  (Commit `a592a7ec <http://sourceforge.net/p/kaarpux/code/ci/a592a7ecb46b7250d6090dbab2ff75efb4e4ec25/>`_)

- UPD: libsigc++: v 2.4.0
  (Commit `c50d1bb1 <http://sourceforge.net/p/kaarpux/code/ci/c50d1bb1a7d56d2fda7765293b1860a184228b20/>`_)

- UPD: libtasn1: v 4.2
  (Commit `989d94c4 <http://sourceforge.net/p/kaarpux/code/ci/989d94c4885074da3a184402fe9b52a31d6a14e4/>`_)

- UPD: ModemManager: v 1.4.0
  (Commit `d8af27dc <http://sourceforge.net/p/kaarpux/code/ci/d8af27dca829e896bead613263a341080ebbf2ce/>`_)

- UPD: mm-common: v 0.9.7
  (Commit `ab0853a0 <http://sourceforge.net/p/kaarpux/code/ci/ab0853a05d9c1087cd97174d3f97f4456f8dabb2/>`_)

- UPD: p11-kit: v 0.21.3
  (Commit `6945537a <http://sourceforge.net/p/kaarpux/code/ci/6945537a4bd3ef23b1beeaee88485c3af82d57cb/>`_)

- UPD: pinentry: v 0.8.4
  (Commit `06f3cc82 <http://sourceforge.net/p/kaarpux/code/ci/06f3cc821958ab6d4c346167a1463bd4598ec774/>`_)

- UPD: pycurl: v 7.19.5
  (Commit `dc18aa0c <http://sourceforge.net/p/kaarpux/code/ci/dc18aa0c690541ec126a0eb1267e5a38d548aa5a/>`_)

- UPD: ruby: v 2.1.3
  (Commit `1bb7be82 <http://sourceforge.net/p/kaarpux/code/ci/1bb7be82d7125c282653b735a7866f006bac80f1/>`_)

- UPD: tcl: v 8.6.2
  (Commit `4355939e <http://sourceforge.net/p/kaarpux/code/ci/4355939e4ea08bae24b6e9ade667b5937ead2eb5/>`_)

- UPD: wireshark: v 1.12.1
  (Commit `fe4f608f <http://sourceforge.net/p/kaarpux/code/ci/fe4f608f06e30cf8d6c2875fc49f6834c0364c20/>`_)

- UPD: x264: v 20140920-2245
  (Commit `35bc1983 <http://sourceforge.net/p/kaarpux/code/ci/35bc1983602d80b15da2bfd1edb20344fba59e78/>`_)

- UPD: xorg-server: v 1.16.1
  (Commit `8745df1d <http://sourceforge.net/p/kaarpux/code/ci/8745df1dc7fee12f3766197ebac4ef93970e3425/>`_)

- UPD: qt: v 5.3.2
  (Commit `335245c0 <http://sourceforge.net/p/kaarpux/code/ci/335245c0d4a01a890516709335e9e59656cf5b89/>`_)

- UPD: bfgminer: v 4.8.0
  (Commit `56417075 <http://sourceforge.net/p/kaarpux/code/ci/56417075f4457508ffc96edb6ea0fa56e338aa7e/>`_)

- UPD: libblkmaker: v 0.5.0
  (Commit `366fa77b <http://sourceforge.net/p/kaarpux/code/ci/366fa77b4e8a63034c45a5c826a5d60badfca527/>`_)

- UPD: uthash: v 1.9.9
  (Commit `ad1517e4 <http://sourceforge.net/p/kaarpux/code/ci/ad1517e4f700c7e76d81fc2e3207b4bdfa4c767b/>`_)

- UPD: bitcoin: v 0.9.2.1
  (Commit `9787bf9d <http://sourceforge.net/p/kaarpux/code/ci/9787bf9dd58d0cafd50b5de5ba526f63a7b97284/>`_)

- UPD: dogecoin: v 1.6
  (Commit `583881b5 <http://sourceforge.net/p/kaarpux/code/ci/583881b59447b1ef2b8ae593d93a52e6a3c3f9bf/>`_)

- UPD: litecoin: v 0.8.7.4
  (Commit `3d5e0bd0 <http://sourceforge.net/p/kaarpux/code/ci/3d5e0bd0addc7d8ca0685bfb61d9265baed388f3/>`_)

- UPD: glib: v 2.40.1
  (Commit `fd3d3996 <http://sourceforge.net/p/kaarpux/code/ci/fd3d399691bf807b4e7b0a65411ec6e80fa7cbbe/>`_)

- UPD: gnutls: v 3.3.8
  (Commit `56b9e347 <http://sourceforge.net/p/kaarpux/code/ci/56b9e347a0524150b2f65a41041acb5000f23713/>`_)

- UPD: samba: v 4.1.12
  (Commit `573eb294 <http://sourceforge.net/p/kaarpux/code/ci/573eb294e1755d9f9cfb8dbf6c4d71577f08ea52/>`_)

- UPD: xz: v 5.0.7
  (Commit `5e5758a5 <http://sourceforge.net/p/kaarpux/code/ci/5e5758a5693a5fb9da41a6249a3dcb162be379c1/>`_)

- UPD: ghostscript: v 9.15
  (Commit `c61ea7db <http://sourceforge.net/p/kaarpux/code/ci/c61ea7dbf56cca3cd32c47bdf84eb45020e80fe9/>`_)

- UPD: libevdev: v 1.3
  (Commit `cde45f7d <http://sourceforge.net/p/kaarpux/code/ci/cde45f7db9baedc35f6c9a893d2fba6df9cd7e71/>`_)

- UPD: libsoup: v 2.48.0
  (Commit `e1df7809 <http://sourceforge.net/p/kaarpux/code/ci/e1df78091ad87c9fbd63fc23e5076877dac00873/>`_)

- UPD: pango: v 1.36.8
  (Commit `5f220fbe <http://sourceforge.net/p/kaarpux/code/ci/5f220fbe985476fd226d6a8dc7cac105e73d06f4/>`_)

- UPD: parallel: v 20140922
  (Commit `a3e027e7 <http://sourceforge.net/p/kaarpux/code/ci/a3e027e70c900fa1b041893d906bef88585a7b53/>`_)

- UPD: glib: v 2.42.0
  (Commit `1d50d2ef <http://sourceforge.net/p/kaarpux/code/ci/1d50d2ef42c47e7cded4fc74f32c35cb0038b1f3/>`_)

- UPD: glib-networking: v 2.42.0
  (Commit `3e45e47a <http://sourceforge.net/p/kaarpux/code/ci/3e45e47aa52ea51c63218b1dd86de0c61cbca7fd/>`_)

- UPD: glibmm: v 2.42.0
  (Commit `fa0bbdfc <http://sourceforge.net/p/kaarpux/code/ci/fa0bbdfc24407269ca59206ad132f6df7dfbd4e1/>`_)

- UPD: gtk2+: v 2.24.24
  (Commit `612dcdc6 <http://sourceforge.net/p/kaarpux/code/ci/612dcdc6f86f1b9e308a9689a949417e47534884/>`_)

- UPD: ghostery: v 5.4.0
  (Commit `58175d9f <http://sourceforge.net/p/kaarpux/code/ci/58175d9f0e4a0324e506390b81b03aa3782c09a7/>`_)

- UPD: noscript: v 2.6.8.42
  (Commit `c78f8c02 <http://sourceforge.net/p/kaarpux/code/ci/c78f8c02f3f5eee606c332de7f9c8def130da49b/>`_)

- UPD: nss: v 3.17.1
  (Commit `e66f29cb <http://sourceforge.net/p/kaarpux/code/ci/e66f29cbddbc35f021c3eaee948ac0a12ca559bb/>`_)

- UPD: thunderbird: v 31.1.2
  (Commit `573e69e4 <http://sourceforge.net/p/kaarpux/code/ci/573e69e41e8f30923cd5421fd51389a9631906af/>`_)

- UPD: firefox: v 32.0.3
  (Commit `60734a73 <http://sourceforge.net/p/kaarpux/code/ci/60734a73bced80d84233262f2a49e7d7a16f6215/>`_)

- UPD: dash: v 0.5.8
  (Commit `59243fc9 <http://sourceforge.net/p/kaarpux/code/ci/59243fc918cdd7ecb5d9d5cc3b7fa22d10313699/>`_)


Minor Changes
#############

- IMPROVE: ghostscript-fonts-\*: link into /share/fonts, and process with fc-cache
  (Commit `fe548b5d <http://sourceforge.net/p/kaarpux/code/ci/fe548b5deebe7a2ecdca45859f7f0c2a11aae830/>`_)

- REMOVE: alsa-firmware alsa-plugins alsa-utils: we are using pulseaudio
  (Commit `148f576d <http://sourceforge.net/p/kaarpux/code/ci/148f576d57606d54053a7d9eaaafa66336fb0371/>`_)

- MINOR: iproute2: move iproute2 after iptables
  (Commit `466011a9 <http://sourceforge.net/p/kaarpux/code/ci/466011a9e7310712b6fc7c617d37d31f5ae22095/>`_)

- MINOR: KxBuild: limit output when downloading files
  (Commit `4601b7c1 <http://sourceforge.net/p/kaarpux/code/ci/4601b7c1ada96afd3db5049d5c2e401370ab32ba/>`_)

- MINOR: xorg-server: remove --enable-xcsecurity; add --without-dtrace
  (Commit `6b04e7ae <http://sourceforge.net/p/kaarpux/code/ci/6b04e7ae2008a69c3cba6b9bf60b41aef3e4b59b/>`_)

- IMPROVE: gdm: better configure options
  (Commit `f82db33c <http://sourceforge.net/p/kaarpux/code/ci/f82db33c9eb03cd1ee36e93d0ce9e2b52ef0e01b/>`_)

- MINOR: KxTools: remove kx_strace; we are now using systemtap
  (Commit `ff01c643 <http://sourceforge.net/p/kaarpux/code/ci/ff01c643776f0a1af178461e298f462b12b7fa22/>`_)

- IMPROVE: libvorbis: -fpic -fPIC
  (Commit `39a9be8c <http://sourceforge.net/p/kaarpux/code/ci/39a9be8c37004ced05d5da4ecd61f2dcc1b191c0/>`_)

- IMPROVE: thunderbird: better configure options
  (Commit `dcefa0a7 <http://sourceforge.net/p/kaarpux/code/ci/dcefa0a7224cec28292ebf1255e81442ddde98b5/>`_)

- MINOR: xf86-video-vmware: temporarily disable xf86-video-vmware
  (Commit `af8b8983 <http://sourceforge.net/p/kaarpux/code/ci/af8b8983f8097cf5b98f691dc14df451ba324870/>`_)

- IMPROVE: KxBuild: add key to gpg_keys
  (Commit `e7dd2cb4 <http://sourceforge.net/p/kaarpux/code/ci/e7dd2cb40c3538b17bc056270eb6a31101aab451/>`_)

- MINOR: accerciser: upstream_gnome_uneven
  (Commit `05b288cc <http://sourceforge.net/p/kaarpux/code/ci/05b288cc9b941737bbcd3a45a386b3890d2e2024/>`_)

- MINOR: gnome-user-docs: upstream_gnome_uneven
  (Commit `f0b94026 <http://sourceforge.net/p/kaarpux/code/ci/f0b94026b4775b5d1af1621ad064e4db20e23130/>`_)

- IMPROVE: firefox: enable-debug-symbols
  (Commit `0afc3ed2 <http://sourceforge.net/p/kaarpux/code/ci/0afc3ed2e15c79b505ca40afed36b86dd188c2ff/>`_)

- IMPROVE: gtk2+: --with-xinput and fight unused direct deps
  (Commit `e111f80f <http://sourceforge.net/p/kaarpux/code/ci/e111f80febfce3675c817d8510bb114dece88a32/>`_)

- DOC: KaarPux: updated CVE info
  (Commit `1ac9c81c <http://sourceforge.net/p/kaarpux/code/ci/1ac9c81cd5cb65d8e0de2a0cecb9005962bb8883/>`_,
  `458b5ee6 <http://sourceforge.net/p/kaarpux/code/ci/458b5ee6754ff638620af0b4497c2b671d36d216/>`_,
  `d1096888 <http://sourceforge.net/p/kaarpux/code/ci/d1096888cb27ccced9cc940c6d107ba5311f57a6/>`_,
  `c9f8f5e1 <http://sourceforge.net/p/kaarpux/code/ci/c9f8f5e1f81874b1fdbcbcea266ee2e131e73b9a/>`_)


