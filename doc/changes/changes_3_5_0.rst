.. 
   KaarPux: http://kaarpux.kaarposoft.dk
   Copyright (C) 2015: Henrik Kaare Poulsen
   License: http://kaarpux.kaarposoft.dk/license.html

.. _changes_3_5_0:


================================
Changes in KaarPux version 3.5.0
================================


:program:`KaarPux` version ``3.5.0`` released on ``2013-mar-22``

- Now using `dash <http://gondor.apana.org.au/~herbert/dash/>`_ as default shell

- Parallel build of bootstrap phase

- Packages updated and bugs fixed


Now using dash as default shell
###############################

:program:`KaarPux` is now using :ref:`pkg_dash` as the default (non-interactive) shell
instead of :ref:`pkg_bash`. This reduces the build-time with about 10%.

The transition from bash to dash as the default shell in :program:`KaarPux` has been significantly aided by:

.. note:: Acknowledgements

   - Thank you to the `Ubuntu developers <https://wiki.ubuntu.com/DashAsBinSh?action=info>`_
     for the `DashAsBinSh <https://wiki.ubuntu.com/DashAsBinSh/>`_ page
   - Thank you to `Mark Hobley <http://sourceforge.net/users/markhobley>`_
     for the `checkbaskisms <http://sourceforge.net/projects/checkbaskisms/>`_ script
   - Thank you to `Herbert Xu <http://gondor.apana.org.au/~herbert/>`_
     for providing `dash <http://gondor.apana.org.au/~herbert/dash/>`_

- ADD: dash: fast posix-compliant shell now used as default
  (Commit `c40d6744 <http://sourceforge.net/p/kaarpux/code/ci/c40d67444b489894eb9ad669c48481681132d128/>`_)

- ADD: time: add 'time' since dash does not provide one build-in
  (Commit `b9a33c78 <http://sourceforge.net/p/kaarpux/code/ci/b9a33c783db040169e82dfa6a6ee31ae174ca6aa/>`_)

- IMPROVE: KxBuild: make scripts more posix compliant
  (Commit `47e66229 <http://sourceforge.net/p/kaarpux/code/ci/47e662299ec6d73ca0d5d63c54a489945de98379/>`_)

- IMPROVE: KxBuild: in enter{_tools,}_chroot, use default shell (sh)
  (Commit `06d3ca3e <http://sourceforge.net/p/kaarpux/code/ci/06d3ca3e7fcab4cbd84d9bf1fbe6210035eb8ee8/>`_)

- IMPROVE: KaarPux: only set up history in bash shell
  (Commit `b09fbdd7 <http://sourceforge.net/p/kaarpux/code/ci/b09fbdd77440f9261449d2829099d9c197cdd56e/>`_)

- IMPROVE: KxBuild: make scripts more posix compliant
  (Commit `3f91152a <http://sourceforge.net/p/kaarpux/code/ci/3f91152a916e91e047a6507cdf964734630978a6/>`_)

- IMPROVE: iproute2 linux systemtap: more posix compatible to compile under dash
  (Commit `8c0d02c2 <http://sourceforge.net/p/kaarpux/code/ci/8c0d02c243b928bac7ad172581e2a34bec40b6f7/>`_)

- IMPROVE: KxBuild: configure_kx_posix tag to replace == with = in configure scripts (for posix compliance)
  (Commit `3e008193 <http://sourceforge.net/p/kaarpux/code/ci/3e008193b7e9b674d1d281318632f1bd5f2dfddf/>`_)

- IMPROVE: systemtap: use configure_kx_posix tag to replace == with = in configure script (for posix compliance)
  (Commit `384e982e <http://sourceforge.net/p/kaarpux/code/ci/384e982e65a85f2564370da371f23b53b3687e26/>`_)

- IMPROVE: gobject-introspection: use configure_kx_posix tag to replace == with = in configure script (for posix compliance)
  (Commit `db480f7a <http://sourceforge.net/p/kaarpux/code/ci/db480f7ad702dea3297a35489fe833c3a0dde60e/>`_)

- IMPROVE: KxBuild: configure_kx_bash tag to set CONFIGURE_SHELL where bash is needed
  (Commit `921f4fce <http://sourceforge.net/p/kaarpux/code/ci/921f4fce8046e10f7f5c754b60706384bdf49eb6/>`_)

- IMPROVE: gnome-shell gnome-themes: use configure_kx_bash as scripts are bash specific
  (Commit `ad3e7754 <http://sourceforge.net/p/kaarpux/code/ci/ad3e77547c838574ace3fe565a4b5bdcfb58ab8d/>`_)

- IMPROVE: KxBuild: configure_kx_bash tag to change configure #! shell as well
  (Commit `fa81db73 <http://sourceforge.net/p/kaarpux/code/ci/fa81db7303191de0967445c81d41c3c931320269/>`_)

- IMPROVE: totem vinagre: use configure_kx_bash
  (Commit `5889be6e <http://sourceforge.net/p/kaarpux/code/ci/5889be6eed7dd1d38156dee517eb8431c4f95b2a/>`_)

- IMPROVE: icedtea: use configure_kx_bash
  (Commit `8635f848 <http://sourceforge.net/p/kaarpux/code/ci/8635f848746c375375e4b1299b83ea7c96bbdd02/>`_)

- IMPROVE: cppunit libcmis: use configure_kx_bash
  (Commit `b9761f6a <http://sourceforge.net/p/kaarpux/code/ci/b9761f6ab5c48bd3e1f68b57730c30dcd300fdc0/>`_)

- IMPROVE: libreoffice: use bash
  (Commit `bb9d5e8d <http://sourceforge.net/p/kaarpux/code/ci/bb9d5e8d864d8ec204db320d7319709d931b6e6f/>`_)


Parallel build of bootstrap phase
#################################

- IMPROVE: KxBuild: Build bootstrap phase in parallel
  (Commit `b7646845 <http://sourceforge.net/p/kaarpux/code/ci/b7646845b2752a2213cf42a6a3f2a970ec16cb77/>`_)


Bugs fixed
##########

- FIX: KxBuild: remember quotes around variables (which may expand to more than one word)
  (Commit `08e114a4 <http://sourceforge.net/p/kaarpux/code/ci/08e114a4d286c7b6e8e5cdbd759336fb42ec05d2/>`_)

- FIX: net-snmp: do not compile in parallel
  (Commit `e56af951 <http://sourceforge.net/p/kaarpux/code/ci/e56af951d886dac767fb4ed1117292460014d5bc/>`_)

- FIX: bridge-utils: struct for ip6 is missing in if_bridge.h from Linux 3.8+
  (Commit `39aa49a9 <http://sourceforge.net/p/kaarpux/code/ci/39aa49a9a63f088981742ed8cf38665a8cb9c5e5/>`_)


Packages updated
################

- UPD: linux: v 3.8.4
  (Commit `0315bb03 <http://sourceforge.net/p/kaarpux/code/ci/0315bb03e4cce0c237edea9e2fc622eb6bd5e366/>`_)

- UPD: util-linux: v 2.22
  (Commit `b385f206 <http://sourceforge.net/p/kaarpux/code/ci/b385f206820aae7945171b98a7b999827110c0c8/>`_)

- UPD: coreutils: v 8.21
  (Commit `ef5eee97 <http://sourceforge.net/p/kaarpux/code/ci/ef5eee971261c7fa2bac7c8fa3967d5d805f8659/>`_)

- UPD: e2fsprogs: v 1.42.7
  (Commit `40513043 <http://sourceforge.net/p/kaarpux/code/ci/405130438b225c2339a9af16621dd28f40179372/>`_)

- UPD: file: v 5.13
  (Commit `0f202d6f <http://sourceforge.net/p/kaarpux/code/ci/0f202d6fcb5cdd7af4ecb6ce136e720f648a4b5a/>`_)

- UPD: gawk: v 4.0.2
  (Commit `9655a643 <http://sourceforge.net/p/kaarpux/code/ci/9655a6433b3e33786b3f0bf7f05293089e6acad5/>`_)

- UPD: man-pages: v 3.48
  (Commit `47ddd52c <http://sourceforge.net/p/kaarpux/code/ci/47ddd52cd729101ef588266d7fcb5627a9403afb/>`_)

- UPD: sed: v 4.2.2
  (Commit `7771b29a <http://sourceforge.net/p/kaarpux/code/ci/7771b29a4fdc44f522a76a0b24bbe0aeec4bf7e4/>`_)

- UPD: gnutls: v 3.1.9.1
  (Commit `a23f8f19 <http://sourceforge.net/p/kaarpux/code/ci/a23f8f19b2a17db26cab10d2f268f95c497b0219/>`_,
  commit `8ffdf6ba <http://sourceforge.net/p/kaarpux/code/ci/8ffdf6ba0aeda62c602959fb0a590bb99d4ac2ad/>`_)

- UPD: ghostery: 2.9.3
  (Commit `bebb4ad6 <http://sourceforge.net/p/kaarpux/code/ci/bebb4ad625ee1f2650bd5b2640c6568082ea7279/>`_)


Minor Changes
#############

- IMPROVE: \*: many additional CLI verification testcases
  (Commit `51c03cf2 <http://sourceforge.net/p/kaarpux/code/ci/51c03cf2909bee678aa775ea156c170e722e99ac/>`_)

- MINOR: KxBuild: show which test scripts are created
  (Commit `55a18299 <http://sourceforge.net/p/kaarpux/code/ci/55a18299bd33e1f6f693914450fd6c37c7df0000/>`_)

- MINOR: \*: small changes to make CLI tests more robust
  (Commit `d6af6fa4 <http://sourceforge.net/p/kaarpux/code/ci/d6af6fa40130bf075bea599988b1b26181ba65be/>`_)

- IMPROVE: KxTools: list 'ignore' files only on first install
  (Commit `841777d8 <http://sourceforge.net/p/kaarpux/code/ci/841777d86236684f96b60ffc2127fc8079fc0c03/>`_)

- IMPROVE: KxTools: ignore python path files in kx_flist.pl
  (Commit `9a8d8010 <http://sourceforge.net/p/kaarpux/code/ci/9a8d80101ff7855eb17e72437051fbeb08ba59be/>`_)

- IMPOROVE: KxTools: kx_flist to ignore aclocal files
  (Commit `fafcfd76 <http://sourceforge.net/p/kaarpux/code/ci/fafcfd7610bb8f5f9f6e3d48fe53ac720e83a569/>`_)

- DOC: www: put older changelogs in separate section
  (Commit `d4261d11 <http://sourceforge.net/p/kaarpux/code/ci/d4261d113d93c44d08982e6c1f4bbb89c0fdb16f/>`_)


