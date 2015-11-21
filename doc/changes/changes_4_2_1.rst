.. 
   KaarPux: http://kaarpux.kaarposoft.dk
   Copyright (C) 2015: Henrik Kaare Poulsen
   License: http://kaarpux.kaarposoft.dk/license.html

.. _changes_4_2_1:


================================
Changes in KaarPux version 4.2.1
================================


:program:`KaarPux` version ``4.2.1`` released on ``2014-mar-26``

- Several Security Updates (mozilla, openssh, libpng, freetype, logilab)

- Better Dependency Tracking with systemtap

- Install packages in parallel

- Tool for analyzing build performance

- Bugs fixed, minor improvements


Several Security Updates
########################

- UPD: nss: v 3.16
  (Commit `ca3aee52 <http://sourceforge.net/p/kaarpux/code/ci/ca3aee52b83a8246accb24a8d746cebe10de8865/>`_)

- UPD: thunderbird: v 24.4.0
  (Commit `67630c92 <http://sourceforge.net/p/kaarpux/code/ci/67630c92c2051d174be0f6eb7deb8438d3ad8104/>`_,
  `db0354dc <http://sourceforge.net/p/kaarpux/code/ci/db0354dc4fc8392635b559fdbd4d29f75d80ed09/>`_)

- UPD: firefox: v 28.0
  (Commit `0df1b5ff <http://sourceforge.net/p/kaarpux/code/ci/0df1b5fff20dc990c6af0308c6b0e491809e53fc/>`_)

- UPD: openssh: v 6.6p1
  (Commit `ac8460ac <http://sourceforge.net/p/kaarpux/code/ci/ac8460ac5d19e91c60d7bea0bddaf9b27822f4ae/>`_,
  `3d16ff8c <http://sourceforge.net/p/kaarpux/code/ci/3d16ff8c204d6b41763f28869fec8cdf74fc1a15/>`_)

- UPD: libpng: v 1.6.10
  (Commit `a9d10baf <http://sourceforge.net/p/kaarpux/code/ci/a9d10baf3a27d883f44f32fdf6a3581d02efc166/>`_)

- UPD: logilab-common: v 0.61.0 (CVE-2014-1838)
  (Commit `934c7b36 <http://sourceforge.net/p/kaarpux/code/ci/934c7b361457524d8dc8bd5712b5a1f4cda5b2ee/>`_)

- UPD: freetype: v 2.5.3
  (Commit `975f6d39 <http://sourceforge.net/p/kaarpux/code/ci/975f6d398ec93c3ecd6d885720d2bab58a3451e8/>`_)


Better Dependency Tracking with systemtap
#########################################

Commit `5dcbc2d0 <http://sourceforge.net/p/kaarpux/code/ci/5dcbc2d0321a60373b30128c047d5df099040dfd/>`_

- systemtap: v 2.5-0.349.g2dd920e34796

Commit `038fbc79 <http://sourceforge.net/p/kaarpux/code/ci/038fbc793742d3df8343fe389b031485d0621f73/>`_

- do NOT use find or perl/flist.pl to track installed files (speeding up regular builds)

- use fsnotify to track file access

Commit `c68e1300 <http://sourceforge.net/p/kaarpux/code/ci/c68e1300f0b76a0b70bcb7f2e096f963986ff9b4/>`_

- do not reference defunct flist.pl


Install packages in parallel
############################

Commit `3dd7bc58 <http://sourceforge.net/p/kaarpux/code/ci/3dd7bc5811285930b2b4fb4bbaf118133220c96b/>`_

- remove kx_lock_install

- add glib-compile-schemas to update-desktop-database.sh

- add --disable-schemas-compile to gnome packages

- re-order building of fonts (due to mkfontdir, mkfontscale, and fc-cache)

- use make -j NNN install

- do not sleep in the beginning of parallel builds

Commit `3c4bc98a <http://sourceforge.net/p/kaarpux/code/ci/3c4bc98a27ab2ebb79b42092e73b7e53f6a8b1c6/>`_

- do NOT install with -j NNN; too many packages are breaking


Tool for analyzing build performance
####################################

- ADD: gnuplot
  (Commit `165b8fce <http://sourceforge.net/p/kaarpux/code/ci/165b8fcee5be6245e63455c0728c5b0f93a181a9/>`_)

- IMPROVE: KxBuild: add kx_sar tool to analyse build performance
  (Commit `d8b485ed <http://sourceforge.net/p/kaarpux/code/ci/d8b485edda2d067699ff20d0d50a76d47d275d19/>`_)

- DOC: build_performance: add paragraph on combining statistics
  (Commit `6b70f23e <http://sourceforge.net/p/kaarpux/code/ci/6b70f23ee1eb8fb6b2ddc00a1403ed0b19584439/>`_)


Bugs fixed
##########

- FIX: lcms2 libsigc++: do not build twice
  (Commit `dc57696a <http://sourceforge.net/p/kaarpux/code/ci/dc57696a0f1c1b7cb1a1aa2cfc0beb042561255f/>`_)

- FIX: cdrkit d-feet lm_sensors xerces-c: do NOT install in /usr/local
  (Commit `39e155ad <http://sourceforge.net/p/kaarpux/code/ci/39e155ade67bebd376671faecabf96a6d9eb27c4/>`_)


Packages updated
################

- UPD: nspr: v 4.10.4
  (Commit `5c597d70 <http://sourceforge.net/p/kaarpux/code/ci/5c597d7023e23f1eaefd2771d297393ea210d0bc/>`_)

- UPD: ghostery: v 5.1.2
  (Commit `f738624d <http://sourceforge.net/p/kaarpux/code/ci/f738624dc21b247a6bfd2d6faf7fb385b558515f/>`_)

- UPD: noscript: v 2.6.8.19
  (Commit `36a1c869 <http://sourceforge.net/p/kaarpux/code/ci/36a1c869235aafeef3388dba88cb5ef745bfb73b/>`_)

- UPD: linux: v 3.13.7
  (Commit `061e3160 <http://sourceforge.net/p/kaarpux/code/ci/061e31605b9870b59a0dfa10eb21cdda00a6c941/>`_)


Minor Changes
#############

- IMPROVE: certdata: only mark upstream outdated if SHA256-sum of CONTENTS have changed
  (Commit `e657dcef <http://sourceforge.net/p/kaarpux/code/ci/e657dcefc7f3428633388ce8a8fc584a2dcbda90/>`_)

- IMPROVE: systemd: better configure options
  (Commit `241fc2a1 <http://sourceforge.net/p/kaarpux/code/ci/241fc2a1414b8bed79e959375a7590f7bd819bbe/>`_)

- MINOR: KxBuild: pass download image when launching kvm
  (Commit `08746ebc <http://sourceforge.net/p/kaarpux/code/ci/08746ebcfbced8725ecf6ca476147249ee692d46/>`_)

- MINOR: KxBuild: typo in error message in kvm.sh
  (Commit `cb337701 <http://sourceforge.net/p/kaarpux/code/ci/cb337701250302d62c6a95d4746fda6ae6a3e78f/>`_)

- MINOR: kx_ver_wiz: more robust sed command
  (Commit `f8e0db90 <http://sourceforge.net/p/kaarpux/code/ci/f8e0db900a9c4c78822a31703bf77678301080c9/>`_)

- MINOR: KxBuild: do not update lsb_release number
  (Commit `6e07a0c4 <http://sourceforge.net/p/kaarpux/code/ci/6e07a0c495d894ee04dd6ee5e89e8439b40d902a/>`_)

- IMRPOVE: xorg: do not install static libraries
  (Commit `83f3a327 <http://sourceforge.net/p/kaarpux/code/ci/83f3a32718c92eeab0502df857090287904c7152/>`_)

- IMRPOVE: qpdf spice-gtk xerces-c: do not install static libraries
  (Commit `a9c913f2 <http://sourceforge.net/p/kaarpux/code/ci/a9c913f2c2ee4449dc47b9d5627314ef06f4f939/>`_)

- FIX: spice-gtk: do not use --disable-static; it does not work?!
  (Commit `ecc11133 <http://sourceforge.net/p/kaarpux/code/ci/ecc11133adebf05715624f6e00cc6e60ebce72a0/>`_)

- MINOR: freetype: correct installed version check
  (Commit `0d844999 <http://sourceforge.net/p/kaarpux/code/ci/0d844999cf316652e8963585ca3a96ba3e833526/>`_)


Documentation Changes
#####################

- DOC: www: update Copyright year in license
  (Commit `a8365bf1 <http://sourceforge.net/p/kaarpux/code/ci/a8365bf188f10077f0fc53b929dffffe707cbf1c/>`_)

- DOC: KaarPux: updated CVE info
  (Commit `3b90535c <http://sourceforge.net/p/kaarpux/code/ci/3b90535c760caece2abd418e51f8aad548ec111e/>`_)


