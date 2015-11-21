.. 
   KaarPux: http://kaarpux.kaarposoft.dk
   Copyright (C) 2015: Henrik Kaare Poulsen
   License: http://kaarpux.kaarposoft.dk/license.html

.. _changes_3_4_2:


================================
Changes in KaarPux version 3.4.2
================================


:program:`KaarPux` version ``3.4.2`` released on ``2013-jan-13``

Mozilla, Mesa, and printing updated.

Added expert scripts (to build KaarPux with just two commands) and parallel building.


Mozilla updated
###############

- UPD: sqlite: v 3.7.15.2
  (Commit `dffce1aa <http://sourceforge.net/p/kaarpux/code/ci/dffce1aa7b8a55415b2e4965003276683e6ec491/>`_)

- UPD: xulrunner firefox: v 18.0
  (Commit `189ed2b6 <http://sourceforge.net/p/kaarpux/code/ci/189ed2b6ef68056977c1691182789851abcea1b0/>`_)

- UPD: thunderbird: v 17.0.2
  (Commit `5c03ece5 <http://sourceforge.net/p/kaarpux/code/ci/5c03ece5e5bc949d8be63b8d2c161e276ecd027c/>`_)

- UPD: ghostery: v 2.8.4
  (Commit `744ac729 <http://sourceforge.net/p/kaarpux/code/ci/744ac7293a9fd6568871c48d98094cbb8152f33a/>`_)

- UPD: noscript: v 2.6.4.2
  (Commit `0a342e41 <http://sourceforge.net/p/kaarpux/code/ci/0a342e41e12a9bd63a9043fc0720691ec2e46d64/>`_)

- UPD: flash_player_11: v 11.2.202.261
  (Commit `0c2e804c <http://sourceforge.net/p/kaarpux/code/ci/0c2e804c0cece6f318961af677e7f1b42ba70c8f/>`_)

- ADD: libjpeg-turbo: replaces libjpeg
  (Commit `3a1b937a <http://sourceforge.net/p/kaarpux/code/ci/3a1b937a151a8b17b9cc261272aecdc16a526686/>`_)


MesaLib updated
###############

- UPD: libdrm: v 2.4.40
  (Commit `c55c471b <http://sourceforge.net/p/kaarpux/code/ci/c55c471be5ba81f858ed4e81e4fb9c04bb2b504f/>`_)

- UPD: llvm: v 3.2
  (Commit `8cd2296d <http://sourceforge.net/p/kaarpux/code/ci/8cd2296d24b781587f740dd7692e691c44fc421d/>`_)

- UPD: MesaLib: v 9.0.1
  (Commit `d4c2fb03 <http://sourceforge.net/p/kaarpux/code/ci/d4c2fb0332bb853bbfd1b89c6b8ea6809f4a4928/>`_)

- UPD: glew: v 1.9.0
  (Commit `c04a6a82 <http://sourceforge.net/p/kaarpux/code/ci/c04a6a82d5a1bde5a42923e09ba22f4c82bfc179/>`_)

- ADD: glu: OpenGL Utility Library (now separated from MesaLib)
  (Commit `9e1cd608 <http://sourceforge.net/p/kaarpux/code/ci/9e1cd608431728a89fefccf0d0bf2a5584e4b7ce/>`_)

- FIX: freeglut: fix incompatibility with new GLU
  (Commit `46d54f33 <http://sourceforge.net/p/kaarpux/code/ci/46d54f33087afc52d8beffbdf7fce7c264c56899/>`_)


Printing updated
################

- UPD: cups-filters: v 1.0.29
  (Commit `5f38fd38 <http://sourceforge.net/p/kaarpux/code/ci/5f38fd38ac3f52c67616c12fb73a9f1e00ae1dd8/>`_)

- UPD: qpdf: v 4.0.0
  (Commit `bd1a28a8 <http://sourceforge.net/p/kaarpux/code/ci/bd1a28a8795c3bcb78ea0e204cc3498d05da8f4f/>`_)

- UPD: hplip: v 3.12.11
  (Commit `43644541 <http://sourceforge.net/p/kaarpux/code/ci/43644541978149ce85ab6b703047276be59dec85/>`_)


Bugs fixed
##########

- FIX: kx_flist.pl: Collect build dependencies correctly in bootstrap phase
  (Commit `f0a2884f <http://sourceforge.net/p/kaarpux/code/ci/f0a2884f84d6e3fbd150de5f90ac932cf9df6c43/>`_)

- FIX: kx_dependencies.pl: Correct --merge- and --ignore-bootstrap when --raw specified
  (Commit `fd23c73b <http://sourceforge.net/p/kaarpux/code/ci/fd23c73b09e9f74599b51c3fcac91b8589a480f9/>`_)

- FIX: doc/packages.pl: Correct parser for parallel instructions
  (Commit `1fa7fdb6 <http://sourceforge.net/p/kaarpux/code/ci/1fa7fdb697f1ad777819873a1aa32a88999f4879/>`_)

- FIX: KxBuild: build junit before apache-ant
  (Commit `54b7352e <http://sourceforge.net/p/kaarpux/code/ci/54b7352eaceaaf03542a3c1d39113f39f4ef68a9/>`_)


Expert scripts - build KaarPux with just two commands
#####################################################

- ADD: KxBuild: expert scripts to build KaarPux with just two commands
  (Commit `a5366a65 <http://sourceforge.net/p/kaarpux/code/ci/a5366a650133d9407129712d4e265ef1470f0c89/>`_)


Build linux/opt packages in parallel
####################################

- IMPROVE: KxBuild: build linux/opt packages in parallel
  (Commit `924fc40b <http://sourceforge.net/p/kaarpux/code/ci/924fc40b19d4d471d2e7b47d283543e52f041515/>`_)


Minor Changes
#############

- Documentation updates


