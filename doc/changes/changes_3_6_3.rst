.. 
   KaarPux: http://kaarpux.kaarposoft.dk
   Copyright (C) 2015: Henrik Kaare Poulsen
   License: http://kaarpux.kaarposoft.dk/license.html

.. _changes_3_6_3:


================================
Changes in KaarPux version 3.6.3
================================


:program:`KaarPux` version ``3.6.3`` released on ``2013-jun-08``

- Mozilla and dependencies updated

- Many other packages updated

- Packages added

- Bugs fixed

- Many minor improvements


Mozilla and dependencies updated
################################

- UPD: nss: v 3.15; updated build and install instructions
  (Commit `9681a003 <http://sourceforge.net/p/kaarpux/code/ci/9681a003d0dc43421130bc0f356efc23f94ba5b4/>`_,
  `0a40604e <http://sourceforge.net/p/kaarpux/code/ci/0a40604eb3a29324d080c99c2d6d1a8087e83846/>`_)

- UPD: nspr: v 4.10
  (Commit `1a799e01 <http://sourceforge.net/p/kaarpux/code/ci/1a799e01d73af63034293314524b318ef9e8156e/>`_,
  `2c2ef4bc <http://sourceforge.net/p/kaarpux/code/ci/2c2ef4bc693874491214911c986c40ac31765347/>`_)

- UPD: certdata: v 1.94
  (Commit `bbb9a265 <http://sourceforge.net/p/kaarpux/code/ci/bbb9a26528006a374cd9edb56ef5ed6323943552/>`_)

- UPD: firefox: v 21.0; also now build as standalone, not on xulrunner
  (Commit `cb312c97 <http://sourceforge.net/p/kaarpux/code/ci/cb312c97c8a6625cf3a8a82082021d378886b1cd/>`_,
  `3b49b2e2 <http://sourceforge.net/p/kaarpux/code/ci/3b49b2e2d7fb9aa0f22ea3b8def79a31bd2b1e6c/>`_,
  `a5c45e1e <http://sourceforge.net/p/kaarpux/code/ci/a5c45e1e96854fef095cea7c0f5f2ceac2179d57/>`_)

- REMOVE: xulrunner
  (Commit `43e57bad <http://sourceforge.net/p/kaarpux/code/ci/43e57bad03de490b2a1be8557d731de32bb91df5/>`_,
  `0df00564 <http://sourceforge.net/p/kaarpux/code/ci/0df00564bffe7318e4a58ee7b834f03144dfddc4/>`_)

- UPD: thunderbird: v 17.0.6
  (Commit `618358e5 <http://sourceforge.net/p/kaarpux/code/ci/618358e5f9fb38db349a7a50573af29e7d259901/>`_)

- UPD: icedtea-web: v 1.4
  (Commit `9f8cba04 <http://sourceforge.net/p/kaarpux/code/ci/9f8cba04a2bd8aef6d7b7c846aea9b811780baf9/>`_)

- UPD: ghostery: v 2.9.5
  (Commit `bf31a3ed <http://sourceforge.net/p/kaarpux/code/ci/bf31a3ed20f96a47765dc68fe8a45beea6e163a8/>`_)

- UPD: noscript: v 2.6.6.2
  (Commit `05f8b03c <http://sourceforge.net/p/kaarpux/code/ci/05f8b03c08fc5e7368e31e005b2d7af6418f5e16/>`_,
  `4294b132 <http://sourceforge.net/p/kaarpux/code/ci/4294b1321de37ca32c5eb3de2744dd42b4cc4699/>`_)

- UPD: adblockplus: v 2.2.4
  (Commit `b77e6a6d <http://sourceforge.net/p/kaarpux/code/ci/b77e6a6d837072d7af8475eeba888710bc29084d/>`_)

- UPD: flash_player_11: v 11.2.202.285
  (Commit `8fe53be5 <http://sourceforge.net/p/kaarpux/code/ci/8fe53be5fa9950d3ccd9f2c2af881fccbae12c36/>`_)


Major package updates
#####################

- UPD: systemd: v 204; also enable hugepages and getty@tty1
  (Commit `7241c7c3 <http://sourceforge.net/p/kaarpux/code/ci/7241c7c388ce40e9c948effcf588658c21be4894/>`_,
  `8ddef5d2 <http://sourceforge.net/p/kaarpux/code/ci/8ddef5d2ff736d6af56c507069bd6d7878a89566/>`_)

- UPD: linux: v 3.9.3; add CONFIG_UDF_FS=m
  (Commit `e539a15a <http://sourceforge.net/p/kaarpux/code/ci/e539a15a598f49c0b87c6871df8b24cd5079755a/>`_)

- UPD: qemu: v 1.5.0
  (Commit `7863fa18 <http://sourceforge.net/p/kaarpux/code/ci/7863fa187cc0bf905f5dc331994a111a47c63b37/>`_)


Other packages updated
######################

- UPD: pyatspi: 2.8.0
  (Commit `d47704b5 <http://sourceforge.net/p/kaarpux/code/ci/d47704b5c3d7a1dea0ea5d14b9965f6cdb9b7fef/>`_)

- UPD: pyatspi: v 2.8.0
  (Commit `379e9e74 <http://sourceforge.net/p/kaarpux/code/ci/379e9e746f7fdce74256015fcd701a73ef6dfcc5/>`_)

- UPD: dbus: v 1.6.10: downgrade to latest stable
  (Commit `26ad902f <http://sourceforge.net/p/kaarpux/code/ci/26ad902f28319eb43421be3246fa80cd4e7bfe4c/>`_)

- UPD: dbus-glib: v 0.100.2
  (Commit `170f3253 <http://sourceforge.net/p/kaarpux/code/ci/170f32534e9d0b82683ce2f1df14ec5bf9e59869/>`_)

- UPD: libxml2: v 2.9.1
  (Commit `6d58f997 <http://sourceforge.net/p/kaarpux/code/ci/6d58f9971335bfc57d3dd2d0915f71b3c9446507/>`_)

- UPD: at-spi2-atk: v 2.8.1
  (Commit `09269f9f <http://sourceforge.net/p/kaarpux/code/ci/09269f9fc8423b790bf06fe3b3f708f271e8b5fd/>`_)

- UPD: glibmm: 2.36.2
  (Commit `37ed9cb8 <http://sourceforge.net/p/kaarpux/code/ci/37ed9cb8f84f2d3f2da2b90a5b8d821e14a58274/>`_)

- UPD: libgee: v 0.10.1
  (Commit `3f48d1bb <http://sourceforge.net/p/kaarpux/code/ci/3f48d1bbbfe502a58b715788d164e6350c4199f7/>`_)

- UPD: libxslt: 1.1.28
  (Commit `7aa6d403 <http://sourceforge.net/p/kaarpux/code/ci/7aa6d4030f15f9146ce8902c626f034af37b4ae2/>`_)

- UPD: \*: gnome packages updated
  (Commit `a2c6fab8 <http://sourceforge.net/p/kaarpux/code/ci/a2c6fab85b1a8503ca646206d740b3dc50619604/>`_)

- UPD: libtasn1: 3.3
  (Commit `55e2fe08 <http://sourceforge.net/p/kaarpux/code/ci/55e2fe088484db67c55b855359ea4e3ced7bfb0b/>`_)

- UPD: d-feet: v 0.3.3
  (Commit `6425973c <http://sourceforge.net/p/kaarpux/code/ci/6425973c810baf5cabe75c6b7d433e8ff4cf0b2d/>`_)

- UPD: dbus-python dbus-python-2: v 1.2.0
  (Commit `792f8bf6 <http://sourceforge.net/p/kaarpux/code/ci/792f8bf6b2002b8af6b3bf23650ca37651884ab8/>`_)

- UPD: MesaLib: v 9.1.2; better configure options; add make check
  (Commit `ca812ef2 <http://sourceforge.net/p/kaarpux/code/ci/ca812ef2dbc8d95e496f9c0f821630a3c184ad8c/>`_)

- UPD: freetype: v 2.4.12
  (Commit `312f29ec <http://sourceforge.net/p/kaarpux/code/ci/312f29eceff51b34144a67d35feb897e70d1a5a1/>`_)

- UPD: gnutls: v 3.1.11
  (Commit `d9c09cb7 <http://sourceforge.net/p/kaarpux/code/ci/d9c09cb7ab086c0b4f95bb306c0d55c555aa355a/>`_)

- UPD: icu: v 51.1
  (Commit `6782211c <http://sourceforge.net/p/kaarpux/code/ci/6782211c9236228fa6a16199dfd134a72ffaf9fc/>`_)

- UPD: libgpg-error: v 1.11
  (Commit `753b5f8b <http://sourceforge.net/p/kaarpux/code/ci/753b5f8ba6435960b38dabfacaee36ebf2ffa80e/>`_)

- UPD: pixman: 0.30.0
  (Commit `ca2392fd <http://sourceforge.net/p/kaarpux/code/ci/ca2392fd6b875bdb55aaa4e94d61a9290f8e309e/>`_)

- UPD: gimp: v 2.8.4; and add make check
  (Commit `53ae4379 <http://sourceforge.net/p/kaarpux/code/ci/53ae4379a7ccabc840e649039f2e45503b1afb40/>`_)

- UPD: dhcpcd: v 5.6.8
  (Commit `eabe1dd9 <http://sourceforge.net/p/kaarpux/code/ci/eabe1dd9dbae47af2b337710dbb5bd1d7b12ce64/>`_)

- UPD: gnupg: v 2.0.20
  (Commit `6456bc9c <http://sourceforge.net/p/kaarpux/code/ci/6456bc9c51f0115f7ebb6258eec10b9cab54e3e1/>`_)

- UPD: pinentry: v 0.8.3
  (Commit `7adc65cf <http://sourceforge.net/p/kaarpux/code/ci/7adc65cf92f4463ccc175578d0e698b1bc9bf92b/>`_)

- UPD: kx_verify_gui: Use own kx_gui_test.c instead of ldtp
  (Commit `8096dc66 <http://sourceforge.net/p/kaarpux/code/ci/8096dc66dca2952f7d9b2e98a50cca6a83c96b04/>`_)

- UPD: automake: v 1.13.2
  (Commit `b5a0234a <http://sourceforge.net/p/kaarpux/code/ci/b5a0234aec4eafcd0a923317c2b31ddb77929fff/>`_)

- UPD: glib: v 2.36.2
  (Commit `f78f9173 <http://sourceforge.net/p/kaarpux/code/ci/f78f9173d0ce0db8c9ce2db1311698baf8a824ea/>`_)

- UPD: harfbuzz: v 0.9.17
  (Commit `89c851dc <http://sourceforge.net/p/kaarpux/code/ci/89c851dc8badecd992bac98469b521e8a42169bd/>`_)

- UPD: libdrm: v 2.4.45
  (Commit `9fac2d2d <http://sourceforge.net/p/kaarpux/code/ci/9fac2d2d8ced6333d928d99717690306b5369f08/>`_)

- UPD: libpipeline: v 1.2.3
  (Commit `c5b21e2b <http://sourceforge.net/p/kaarpux/code/ci/c5b21e2b72f4470740eac74948992b519259c136/>`_)

- UPD: pango: v 1.34.1
  (Commit `942a8690 <http://sourceforge.net/p/kaarpux/code/ci/942a8690aa97c015ad2b014d411ab47ff474272d/>`_)

- UPD: libtiff: v 4.0.3
  (Commit `7af53cd9 <http://sourceforge.net/p/kaarpux/code/ci/7af53cd9a26fd8e9b6a76227baea585802c234a5/>`_)

- UPD: vte: 0.34.5
  (Commit `d9d530cc <http://sourceforge.net/p/kaarpux/code/ci/d9d530cc338a6188ffbece35c9428851397d2d56/>`_)

- UPD: automake: v 1.13.1; downgrade; glib chokes on 1.13.2
  (Commit `0a78a2b2 <http://sourceforge.net/p/kaarpux/code/ci/0a78a2b21f280d0523dcf17c3c1155f1aac8eb04/>`_)

- UPD: libtirpc: v 0.2.3
  (Commit `43c05ded <http://sourceforge.net/p/kaarpux/code/ci/43c05ded2b66aae5b7a45a83857c217884d8905f/>`_)

- UPD: pkg-config: v 0.28; move to bootstrap_7; remove _CFLAGS and _LIBS from other packages
  (Commit `ff6ba676 <http://sourceforge.net/p/kaarpux/code/ci/ff6ba676196ae055a4f9bf79aa2c34f331962dc1/>`_)

- UPD: libksba: v 1.3.0
  (Commit `485baf71 <http://sourceforge.net/p/kaarpux/code/ci/485baf7124c62b2903a08b8aec06379d022d1b4a/>`_)

- UPD: gedit: v 3.8.2
  (Commit `746c7523 <http://sourceforge.net/p/kaarpux/code/ci/746c75239628af3fa1a099f7cea2e34831a59501/>`_)

- UPD: MesaLib: v 9.1.3
  (Commit `2024a4cd <http://sourceforge.net/p/kaarpux/code/ci/2024a4cd3937f156b60bdb6c6f2727313c592414/>`_)

- UPD: x*: updated xorg packages
  (Commit `70c54b8d <http://sourceforge.net/p/kaarpux/code/ci/70c54b8d02c537cce8adf8271be451bf7255bcda/>`_)

- UPD: libevent: v 2.0.21
  (Commit `4106d89b <http://sourceforge.net/p/kaarpux/code/ci/4106d89b3e584e35a67d92d230236b7c59a91583/>`_)

- UPD: gnutls: v 3.1.12
  (Commit `008f27ea <http://sourceforge.net/p/kaarpux/code/ci/008f27ea9fe2d3fc00709dfa9a1ea0369ca787ea/>`_)

- UPD: gstreamer gst-plugins-\*: v 1.0.7
  (Commit `7f7d2a63 <http://sourceforge.net/p/kaarpux/code/ci/7f7d2a635a4467cd148f5f1935940349662a0631/>`_)

- UPD: colord: v 1.0.0
  (Commit `e1cce029 <http://sourceforge.net/p/kaarpux/code/ci/e1cce0299254a801e2fbcf08404583d44b82dae2/>`_)

- UPD: fontforge: v 20120731-b
  (Commit `7b60adfc <http://sourceforge.net/p/kaarpux/code/ci/7b60adfc1f6803d74cc3b6de10d6d0ffe4935c65/>`_)

- UPD: harfbuzz: v 0.9.18
  (Commit `03664599 <http://sourceforge.net/p/kaarpux/code/ci/03664599181c1b0268d5c1413e30000702787b50/>`_)

- UPD: cantarell-fonts: v 0.0.12
  (Commit `8651bbc4 <http://sourceforge.net/p/kaarpux/code/ci/8651bbc46e72cfadb5f7bf87f7c1ac313d526023/>`_)

- UPD: poppler: v 0.22.4
  (Commit `c3eefb30 <http://sourceforge.net/p/kaarpux/code/ci/c3eefb3052caedaacdb66ea1e82cb73247fcc89e/>`_)

- UPD: libical: v 1.0
  (Commit `9a291bb8 <http://sourceforge.net/p/kaarpux/code/ci/9a291bb882b5e5cca922a653acd2bcb42d1f2b0b/>`_)

- UPD: distribute: v 0.6.45
  (Commit `25952545 <http://sourceforge.net/p/kaarpux/code/ci/25952545502c9bfa173703ade2ed1753caeae785/>`_)

- UPD: cups: v 1.6.2
  (Commit `19ce5abe <http://sourceforge.net/p/kaarpux/code/ci/19ce5abe1dbe88ad9358739e8fc6081c19d973af/>`_)

- UPD: hplip: v 3.13.5
  (Commit `a43f3f99 <http://sourceforge.net/p/kaarpux/code/ci/a43f3f993b59c4737b993dffc441ce8ab3876cba/>`_)

- UPD: \*: many gnome packages updated (mostly to 3.8.2)
  (Commit `5e715b93 <http://sourceforge.net/p/kaarpux/code/ci/5e715b93be29eda1e187b2850bb120cb5cbb989f/>`_)

- UPD: WebKit: v 2.1.1
  (Commit `87b930e0 <http://sourceforge.net/p/kaarpux/code/ci/87b930e05c3039e890dc968700c79d81ae121ba7/>`_)

- gnome-settings-daemon: v 3.8.1
  (Commit `b15c7f0b <http://sourceforge.net/p/kaarpux/code/ci/b15c7f0bd50496789c4124fc38fba602b4ecca8b/>`_)


Packages added
##############

- ADD: pyatspi3: pyatspi for Python 3
  (Commit `69d3f1cf <http://sourceforge.net/p/kaarpux/code/ci/69d3f1cf95466149074395d243796b221e5cffa1/>`_)

- ADD: distribute: like setuptools for Python3
  (Commit `bc55daf2 <http://sourceforge.net/p/kaarpux/code/ci/bc55daf247992a2e2b9177470cdb9e7e41f7c5fe/>`_)

- ADD: ipython: rich architecture for interactive computing (needed for accerciser)
  (Commit `c38213e5 <http://sourceforge.net/p/kaarpux/code/ci/c38213e5081e8a0d191d61ed59241a6f162d8ab0/>`_)

- ADD: nss-myhostname
  (Commit `99f24c79 <http://sourceforge.net/p/kaarpux/code/ci/99f24c7923953107aa2bcf6f98fd55751bf11f9e/>`_)

- ADD: cdrkit: portable command-line CD/DVD recorder software
  (Commit `c127a26b <http://sourceforge.net/p/kaarpux/code/ci/c127a26b248be82ed57b35ce1802011535c429fa/>`_)

- ADD: rdesktop
  (Commit `fa3add59 <http://sourceforge.net/p/kaarpux/code/ci/fa3add591d88e459621357fc89548f2fffb34731/>`_)

- ADD: gst-libav
  (Commit `d152ff0f <http://sourceforge.net/p/kaarpux/code/ci/d152ff0ffa9fa484c26fafeded5463e213ba2b71/>`_)

- ADD: ocaml
  (Commit `ba9dbb24 <http://sourceforge.net/p/kaarpux/code/ci/ba9dbb24847f3a68352d93b1a4afcc089ba5d9a2/>`_)

- ADD: findlib: Objective CAML package manager and build helper
  (Commit `4a0f0fff <http://sourceforge.net/p/kaarpux/code/ci/4a0f0fff455fff03d5cc83c794fc8b04713efcee/>`_)

- ADD: lablgtk: OCaml interface to GTK+ 1.2 and 2.x
  (Commit `3eb2c6bd <http://sourceforge.net/p/kaarpux/code/ci/3eb2c6bd77ab6c41b0915c11ae3ba537bd8df1fc/>`_)

- ADD: coq: Coq is a formal proof management system
  (Commit `5c30e290 <http://sourceforge.net/p/kaarpux/code/ci/5c30e290ec617a6456a9dc2ac3533e1fb0134fd5/>`_)


Bugs fixed
##########

- FIX: jasper: correct download link
  (Commit `e05d0eca <http://sourceforge.net/p/kaarpux/code/ci/e05d0eca02f4bea9d159cdefde20c368eb704b45/>`_)

- FIX: make_dist: cd into kaarpux directory before proceeding
  (Commit `202ace68 <http://sourceforge.net/p/kaarpux/code/ci/202ace6815c14708bf5f84153c387ac05e60a961/>`_)

- FIX: KxBuild: correct build sequence (at-spi2-core pyatspi3 pyatspi)
  (Commit `13aea4c8 <http://sourceforge.net/p/kaarpux/code/ci/13aea4c89238bf14c4a6f62c4333fdf57d9e483f/>`_)

- FIX: cmake: do NOT install in /usr/local; use system libraries
  (Commit `ab012d83 <http://sourceforge.net/p/kaarpux/code/ci/ab012d83bf90ad9b60c05bbb0ebcb64f44e805bd/>`_)

- FIX: dosfstools: do NOT install in /usr/local
  (Commit `dd0dc5e3 <http://sourceforge.net/p/kaarpux/code/ci/dd0dc5e3f39655e810fb7a74f9f57a8a7d566278/>`_)

- FIX: p11-kit: include path to ssl certificates
  (Commit `3aeb5225 <http://sourceforge.net/p/kaarpux/code/ci/3aeb5225750617fa347c44f73c0a0c6c20971822/>`_)

- FIX: cups-filters cups-pk-helper: upstream patch now part of tarball
  (Commit `adda63fd <http://sourceforge.net/p/kaarpux/code/ci/adda63fd457dae27bcef8495c605d918f0614698/>`_)

- FIX: NetworkManager: --disable-ppp
  (Commit `8aaadd0f <http://sourceforge.net/p/kaarpux/code/ci/8aaadd0f3a2c9e937e3b0650041fe4fcf4aad1a3/>`_)

- FIX: dbus: put make check into test target
  (Commit `7dcc7566 <http://sourceforge.net/p/kaarpux/code/ci/7dcc7566e6204928cc2123bedd26957362a8140d/>`_)

- FIX: nss: fix pkg-config file to require nspr
  (Commit `62dc67bf <http://sourceforge.net/p/kaarpux/code/ci/62dc67bfd9538afd7cab6d11a7c284ffcbb63da6/>`_)


Minor Changes
#############

- IMPROVE: libpng: use latest linpng-apng patch
  (Commit `c668bf40 <http://sourceforge.net/p/kaarpux/code/ci/c668bf40f8429ef8098b06ce0fa0ccbd5152a3b1/>`_)

- MINOR: gedit gedit-plugins: improved build instructions
  (Commit `08a06658 <http://sourceforge.net/p/kaarpux/code/ci/08a06658e56813d82a7ba65cc792c7af8f2e569d/>`_)

- IMPROVE: libarchive: move before cmake
  (Commit `07f27540 <http://sourceforge.net/p/kaarpux/code/ci/07f27540df47034c5e3e3b6ded16381c0279f1f3/>`_)

- IMPROVE: cli.tcl: additional test utilities
  (Commit `8ae06daa <http://sourceforge.net/p/kaarpux/code/ci/8ae06daa552f4d8d21443b80b744741bc1a6bd52/>`_)

- IMPROVE: \*: verify_cli testcases added
  (Commit `0abdab0f <http://sourceforge.net/p/kaarpux/code/ci/0abdab0fb3a6c93624bcdd23ebac1fe765181ad7/>`_)

- IMPROVE: Python2: correct FFI flags; --enable-unicode=ucs4
  (Commit `1e9c7715 <http://sourceforge.net/p/kaarpux/code/ci/1e9c7715365ee455745bbb68eca5fc5e91c021f4/>`_)

- IMPROVE: pygobject: make check
  (Commit `ae879ff8 <http://sourceforge.net/p/kaarpux/code/ci/ae879ff8cea333861e481d10eee8be4caa8ab558/>`_)

- IMPROVE: KaarPux: symlink /etc/localtime
  (Commit `95b9a71d <http://sourceforge.net/p/kaarpux/code/ci/95b9a71d1f60bbb86dc7a8bc5b72389bcc8595da/>`_)

- IMPROVE: bridge-utils: make service depend on hardware device specified
  (Commit `e87a1993 <http://sourceforge.net/p/kaarpux/code/ci/e87a19939367a0251e1f978f40ed7e95b68d6c51/>`_)

- IMPROVE: llvm: better configure options
  (Commit `5015e078 <http://sourceforge.net/p/kaarpux/code/ci/5015e078b019a9a4f9a63c9fe03905438f0898f5/>`_)

- IMPROVE: clutter: make check
  (Commit `f3ceba3f <http://sourceforge.net/p/kaarpux/code/ci/f3ceba3f1a32964d1b8bf7c0a4a1328ff9f57716/>`_)

- IMPROVE: gtk+: --disable-packagekit
  (Commit `9788ae90 <http://sourceforge.net/p/kaarpux/code/ci/9788ae90e327a72ff6fb67f532cf72895085fb04/>`_)

- IMPROVE: librsvg: improved configure options
  (Commit `40648719 <http://sourceforge.net/p/kaarpux/code/ci/40648719b387623cf4c3b0c949ca3a3dad1801ec/>`_)

- MINOR: pygobject2: No test suite
  (Commit `4958a802 <http://sourceforge.net/p/kaarpux/code/ci/4958a8029f853d639d16d767402878e28595c8b9/>`_)

- DEL: ppp
  (Commit `748c29e6 <http://sourceforge.net/p/kaarpux/code/ci/748c29e6ec95cf5094cee432d2ee678fc1e6579c/>`_)

- IMPROVE: \*: verify_cli testcases added
  (Commit `e9b73516 <http://sourceforge.net/p/kaarpux/code/ci/e9b73516d49b42c9ba089167ffe02dcd74e84f5a/>`_)

- IMPROVE: * Use own kx_gui_test.c instead of ldtp for kx_verify_gui
  (Commit `8ac50060 <http://sourceforge.net/p/kaarpux/code/ci/8ac50060ce6a68931e4d5494f1bf4b21d983054d/>`_)

- IMPROVE: verify_cli: send TWO end-of-file instead of one; needed by some programs ?!
  (Commit `8a6b66b8 <http://sourceforge.net/p/kaarpux/code/ci/8a6b66b834f296562b64891fdbe53bb9304ccccc/>`_)

- IMPROVE: openssl: verify_cli testcases
  (Commit `1a253dca <http://sourceforge.net/p/kaarpux/code/ci/1a253dca0adbb73b5ec95534cd81dce2e26791a5/>`_)

- IMPROVE: totem: do not build vegas/flash plugin (as we have the adobe flash_player_11)
  (Commit `aa61f444 <http://sourceforge.net/p/kaarpux/code/ci/aa61f444457ac2007dda7cdda80e0df8b6e0767c/>`_)

- IMPROVE: \*: verify_cli testcases added
  (Commit `e1804d41 <http://sourceforge.net/p/kaarpux/code/ci/e1804d41d645614072cf77db59cd899956509a01/>`_)

- MINOR: provider_for_google_calendar: correct upstream url
  (Commit `c7d045c7 <http://sourceforge.net/p/kaarpux/code/ci/c7d045c751400dda6d28239a1893c6c028d0cdf8/>`_)

- MINOR: liberation-fonts: put updates on hold
  (Commit `4e6ac3d5 <http://sourceforge.net/p/kaarpux/code/ci/4e6ac3d539bb7a8b5a3a60e7bef4e64be9e46cb2/>`_)

- IMPROVE: colord: run as non-root
  (Commit `4bbd2784 <http://sourceforge.net/p/kaarpux/code/ci/4bbd2784ba6e9ff7793b2b3888414bebe1118d25/>`_)

- IMPROVE: kx_ver_wiz: print line with SH command to update yaml automagically
  (Commit `2ce2967b <http://sourceforge.net/p/kaarpux/code/ci/2ce2967bcec51fad0d8e8c6d3e8139fdf01a1d8c/>`_)

- IMPROVE: dangerous_build_rest: do not download packages as root
  (Commit `581844b7 <http://sourceforge.net/p/kaarpux/code/ci/581844b71515302d84865475d560983e372d955c/>`_)

- IMPROVE: KxBuild: Default to virtio device names
  (Commit `5ecf818a <http://sourceforge.net/p/kaarpux/code/ci/5ecf818a1bbc2b62ef77d8f7b3fff822b56646b3/>`_)


