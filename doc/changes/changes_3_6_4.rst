.. 
   KaarPux: http://kaarpux.kaarposoft.dk
   Copyright (C) 2015: Henrik Kaare Poulsen
   License: http://kaarpux.kaarposoft.dk/license.html

.. _changes_3_6_4:


================================
Changes in KaarPux version 3.6.4
================================


:program:`KaarPux` version ``3.6.4`` released on ``2013-jun-20``

- Java update

- Systemtap improvements

- OpenVAS


Java update
###########

- UPD: icedtea7: v 2.4.0
  (Commit `c852af46 <http://sourceforge.net/p/kaarpux/code/ci/c852af463e4cfeb8b4a08edb168932ae3047f9ef/>`_)


Systemtap improvements
######################

- UPD: systemtap: v 2.2.1
  (Commit `038fa825 <http://sourceforge.net/p/kaarpux/code/ci/038fa8257e3cfec4a7dab64f796e695ec2aa19e7/>`_)

- FIX: KxBuild: staprun with -R to enable parallel build
  (Commit `b177899a <http://sourceforge.net/p/kaarpux/code/ci/b177899a6a6227e74edec784bfc194a325c35ece/>`_)

- FIX: KxBuild: pass LD_LIBRARY_PATH to staprun
  (Commit `fccadb19 <http://sourceforge.net/p/kaarpux/code/ci/fccadb19c21fd4255fcd15fedabebec1a8bd81c3/>`_)

- FIX: KxBuild: use default LD_LIBRARY_PATH if not set
  (Commit `ed78e2fc <http://sourceforge.net/p/kaarpux/code/ci/ed78e2fc692e5e3bc170e222fcd8edf7c6b194a4/>`_)

- IMPROVE: KxBuild: kx_open to use kernel.function("do_filp_open").return instead of syscall.open.return and kernel.function("path_openat").return
  (Commit `2bf0e39f <http://sourceforge.net/p/kaarpux/code/ci/2bf0e39f17674305ec6efa7cb448d5aefc1b9015/>`_)

- IMPROVE: KxBuild: install kx_open with --suppress-handler-errors
  (Commit `be342bf5 <http://sourceforge.net/p/kaarpux/code/ci/be342bf5667253421f562b7bc29bab8e0a2560aa/>`_)


OpenVAS
#######

- ADD: nmap
  (Commit `daec461b <http://sourceforge.net/p/kaarpux/code/ci/daec461b6dc27257bd907420768933854717d334/>`_)

- ADD: OpenVAS: OpenVAS and prerequisites
  (Commit `2ad95dc1 <http://sourceforge.net/p/kaarpux/code/ci/2ad95dc1028011a5d955a60f4924e3d7a0551af9/>`_)

- FIX: KxBuild: Correct build sequence (openvas prereqs)
  (Commit `dc24d98d <http://sourceforge.net/p/kaarpux/code/ci/dc24d98d7029416780c69c30ba5fea2f46b4c2b8/>`_)

- IMPROVE: rsync: move to linux phase
  (Commit `52299ee0 <http://sourceforge.net/p/kaarpux/code/ci/52299ee0ec7097a76c90e6302815d54dc91d82ee/>`_)

- IMPROVE: KxBuild: move rsync and nmap earlier
  (Commit `35cacc03 <http://sourceforge.net/p/kaarpux/code/ci/35cacc03e8c374d45ad64c83338c4bf2116c82a9/>`_)

- IMPROVE: pinentry: move from opt to linux
  (Commit `28d35fad <http://sourceforge.net/p/kaarpux/code/ci/28d35fad24d3a98dc4be53a3c455306308f56110/>`_)


Minor Changes
#############

- IMPROVE: pygobject: comment out test cases
  (Commit `515d5c08 <http://sourceforge.net/p/kaarpux/code/ci/515d5c087fb9eeb34df83b3b6804f0291e72fd82/>`_)

- IMPROVE: WebKit: reintroduce make_repeat
  (Commit `22505945 <http://sourceforge.net/p/kaarpux/code/ci/225059457676fd190d74d6d060256e90039c41d7/>`_)

- IMPROVE: KxBuild: make_repeat to just make a single -j1 after failure
  (Commit `94ecbc18 <http://sourceforge.net/p/kaarpux/code/ci/94ecbc18eb94764d4edc3e61f6bc3079718e5f7f/>`_)

- IMPROVE: pkg-config: comment out check
  (Commit `518715a2 <http://sourceforge.net/p/kaarpux/code/ci/518715a28aadcf9eb6c1c7f3b6391189f4dfd1f4/>`_)

- IMPROVE: linux: add more random entropy sources
  (Commit `95314f3b <http://sourceforge.net/p/kaarpux/code/ci/95314f3b1b8ef247f75301f8b2f72a375c964851/>`_)

- IMPROVE: libical: make_repeat
  (Commit `fc344db5 <http://sourceforge.net/p/kaarpux/code/ci/fc344db57e4f24abe6143ea49842cb5ff35abab3/>`_)

- IMPROVE: gdm: make_repeat
  (Commit `65421de2 <http://sourceforge.net/p/kaarpux/code/ci/65421de26edb000ee0c77477cc38f55432af8fe8/>`_)


