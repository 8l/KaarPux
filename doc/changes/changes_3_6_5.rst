.. 
   KaarPux: http://kaarpux.kaarposoft.dk
   Copyright (C) 2015: Henrik Kaare Poulsen
   License: http://kaarpux.kaarposoft.dk/license.html

.. _changes_3_6_5:


================================
Changes in KaarPux version 3.6.5
================================


:program:`KaarPux` version ``3.6.5`` released on ``2013-jun-27``

- Mozilla and LibreOffice Updated

- Other packages updated and added

- Signature check on many upstream packages

- Bugs fixed and minor improvements


Mozilla and LibreOffice Updated
###############################

- UPD: firefox: v 22.0
  (Commit `d5b24fab <http://sourceforge.net/p/kaarpux/code/ci/d5b24faba02df9215155aa855bf74e901e64a89b/>`_)

- UPD: flash_player_11: v 11.2.202.291
  (Commit `8be0525e <http://sourceforge.net/p/kaarpux/code/ci/8be0525ef0d6cb558ee6ee40a1d93344a04874b2/>`_)

- UPD: noscript: v 2.6.6.6
  (Commit `eb6ceab2 <http://sourceforge.net/p/kaarpux/code/ci/eb6ceab2610099bcbf68288d7465dd76eaade1c0/>`_)

- UPD: thunderbird: v 17.0.7
  (Commit `7c6183fc <http://sourceforge.net/p/kaarpux/code/ci/7c6183fc132e860a02c3033eba00fe0d8f9ad721/>`_)

- UPD: libreoffice: v 4.0.4.2
  (Commit `17f6e322 <http://sourceforge.net/p/kaarpux/code/ci/17f6e32288263962160df20908366876c54d9e63/>`_)


Other packages updated and added
################################

- UPD: nemiver: v 0.9.4
  (Commit `9aa306cb <http://sourceforge.net/p/kaarpux/code/ci/9aa306cbd1622f8d1d37265853611023ef0fca8d/>`_)

- UPD: freetype: v 2.5.0.1
  (Commit `96f46b7f <http://sourceforge.net/p/kaarpux/code/ci/96f46b7f8a87f11757ddba362feca2197f902111/>`_)

- UPD: graphviz: v 2.30.1
  (Commit `2cec7466 <http://sourceforge.net/p/kaarpux/code/ci/2cec746600b43e97065a54bc78859118a81c4e54/>`_)

- UPD: dhcpcd: v 6.0.2; also small configuration changes
  (Commit `6a49c25d <http://sourceforge.net/p/kaarpux/code/ci/6a49c25d57abfef8887e4ca196d032e1d62b1f93/>`_)

- UPD: sqlite: v 3.7.17
  (Commit `28a39ca6 <http://sourceforge.net/p/kaarpux/code/ci/28a39ca66a9fd32449ce46c2d76698d9c22abae5/>`_)

- ADD: wxWidgets codelite
  (Commit `92a807f3 <http://sourceforge.net/p/kaarpux/code/ci/92a807f3df2e3c072c23b3c43bcc28ed557b31c7/>`_)

- ADD: gd: prereq for graphviz
  (Commit `2359cc69 <http://sourceforge.net/p/kaarpux/code/ci/2359cc698a60de52e3b597dc6b158f58dc351fb3/>`_)


Signature check on many upstream packages
#########################################

- IMPROVE: KxBuild: add functions for verifying GPG signatures on upstream tarballs
  (Commit `e7e9be23 <http://sourceforge.net/p/kaarpux/code/ci/e7e9be2365714e3659291e0e922fcdc90de65d67/>`_)

- IMPROVE: KxBuild: add trusted keys for verifying GPG signatures on upstream tarballs
  (Commit `41b1e3f3 <http://sourceforge.net/p/kaarpux/code/ci/41b1e3f3094e3c823a4f1d9970824b86aaf3462e/>`_)

- IMPROVE: \*: verify GPG signature on upstream tarball
  (Commit `ce46d360 <http://sourceforge.net/p/kaarpux/code/ci/ce46d3605bfdb83f9202add1b60c47e43831bbd3/>`_)

- IMPROVE: KxBuild: Gracefully handle file downloads when no GnuPG is available
  (Commit `d5042093 <http://sourceforge.net/p/kaarpux/code/ci/d504209365cb5bead54ca051105826459d70b849/>`_)


Bugs fixed
##########

- FIX: libpng freetype: move libpng before freetype
  (Commit `62ca5b5c <http://sourceforge.net/p/kaarpux/code/ci/62ca5b5cb9320bb6da0939bcfcd3996b40134bbf/>`_)

- FIX: kx_version.plinc: replace  in url and filename
  (Commit `aed3dfd1 <http://sourceforge.net/p/kaarpux/code/ci/aed3dfd1b2cad58754c155d5f52776f02836718a/>`_)


Minor Changes
#############

- MINOR: man-pages: use kernelxz for download
  (Commit `9ea042f9 <http://sourceforge.net/p/kaarpux/code/ci/9ea042f90038f60f577fe7cee7c1003b33619ba1/>`_)

- MINOR: pciutils: use kernelxz for download
  (Commit `81529a9e <http://sourceforge.net/p/kaarpux/code/ci/81529a9e941c40c6747942e8b43fb423db969ef2/>`_)

- MINOR: kmod: use kernelxz for download
  (Commit `17c338d2 <http://sourceforge.net/p/kaarpux/code/ci/17c338d27d6205c0cf693346244f536fb79b8e5c/>`_)

- MINOR: usbutils: use kernelxz for download
  (Commit `f93d55fb <http://sourceforge.net/p/kaarpux/code/ci/f93d55fb3e53c173c58e34cf5cc9cb15048431cd/>`_)

- IMPROVE: \*: add verify_cli testcases
  (Commit `4ee91e34 <http://sourceforge.net/p/kaarpux/code/ci/4ee91e34823c81938524a6d999ba700f711d4a34/>`_)

- IMPROVE: kx_ver_wiz: option to update to specified upstream version
  (Commit `50bb3cc8 <http://sourceforge.net/p/kaarpux/code/ci/50bb3cc8878fc2d531cf9ef6edf584232784d7be/>`_)


