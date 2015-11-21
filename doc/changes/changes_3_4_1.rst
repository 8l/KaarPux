.. 
   KaarPux: http://kaarpux.kaarposoft.dk
   Copyright (C) 2015: Henrik Kaare Poulsen
   License: http://kaarpux.kaarposoft.dk/license.html

.. _changes_3_4_1:


================================
Changes in KaarPux version 3.4.1
================================


:program:`KaarPux` version ``3.4.1`` released on ``2013-jan-04``

- Security update (TurkTrust cert)

- Bugs fixed (minor issues)

- Improved dependency tracking

- Packages updated (pulseaudio, libcanberra)


Security Update
###############

UPD: certdata: v 1.87 - Revoking Trust in Two TurkTrust Certificates
====================================================================

- Commit `7d59bea2 <http://sourceforge.net/p/kaarpux/code/ci/7d59bea24aa869fbbbade1c2a8bc4dd2c584955b/>`_

- See `Mozilla Security Blog <https://blog.mozilla.org/security/2013/01/03/revoking-trust-in-two-turktrust-certficates/>`_


Bugs fixed
##########

- FIX: KxBuild: remove /tools directory completely; not just the contents
  (Commit `29f2b152 <http://sourceforge.net/p/kaarpux/code/ci/29f2b15267c07a40c6704878a4d361e479bf8e31/>`_)

- FIX: KxBuild: in SYSTEMTAP look at ALL files in /opt
  (Commit `8efd2057 <http://sourceforge.net/p/kaarpux/code/ci/8efd2057f7075c5b92d1b9ab2c6ca898be78da56/>`_)

- FIX: flash_player_11: Do not install KDE4 stuff
  (Commit `1a5af04f <http://sourceforge.net/p/kaarpux/code/ci/1a5af04f0f674d3e03451b2f65de52ea672ddc48/>`_)

- FIX: graphviz: build in linux phase (not opt)
  (Commit `f6c69293 <http://sourceforge.net/p/kaarpux/code/ci/f6c69293777ca62a1cc8a050a57aabbfa5b01ddf/>`_)


Improved dependency tracking
############################

- ADD: kx_dependencies.pl: Tool to extract dependencies
  (Commit `f4ccf7fc <http://sourceforge.net/p/kaarpux/code/ci/f4ccf7fcb62cdbe8f9e115ef8bd527eabd921f14/>`_)

- IMPROVE: kx_flist.pl: Better dependency tracking
  (Commit `ea41793f <http://sourceforge.net/p/kaarpux/code/ci/ea41793f3501734748405b99e6ecd94293bf66ee/>`_)


Packages updated
################

- UPD: pulseaudio: v 3.0
  (Commit `3de6c685 <http://sourceforge.net/p/kaarpux/code/ci/3de6c6857291c2aa986971508e71f07a42d3907a/>`_)

- UPD: libcanberra: v 0.30
  (Commit `fb4fbdd2 <http://sourceforge.net/p/kaarpux/code/ci/fb4fbdd26926e0ae13aba921a780e8ef6bfb3b45/>`_)


Minor Changes
#############

- IMPROVE: KaarPux: source /etc/profile.d files from /etc/bashrc from ~/.bashrc if interactive non-login shell
  (Commit `5b674087 <http://sourceforge.net/p/kaarpux/code/ci/5b67408752426f32b4e1e2aed1effec6c54fe0d6/>`_)

- IMPROVE: KaarPux: merge bash history
  (Commit `ea2cff4c <http://sourceforge.net/p/kaarpux/code/ci/ea2cff4c1cbb902d1d4dde0e39ca70114abc3e55/>`_)

- MINOR: KxBuild: Do not build skype, xen, and related until we have 32/64 multilib
  (Commit `e1674c8f <http://sourceforge.net/p/kaarpux/code/ci/e1674c8f7b66c9a992639cc7f6fed9f822324a89/>`_)

- IMPROVE: kx_opt: link to the end of symlink chain
  (Commit `0f8c0cee <http://sourceforge.net/p/kaarpux/code/ci/0f8c0cee151e59cde3886ff77498a9fc259a4d29/>`_)


