.. 
   KaarPux: http://kaarpux.kaarposoft.dk
   Copyright (C) 2015: Henrik Kaare Poulsen
   License: http://kaarpux.kaarposoft.dk/license.html

.. _changes_3_5_1:


================================
Changes in KaarPux version 3.5.1
================================


:program:`KaarPux` version ``3.5.1`` released on ``2013-apr-04``

- Upstream Security Fixes

- Merge core phase into bootstrap_8

- Make systemtap work with dash

- Several minor updates and bugs fixed


Upstream Security Fixes
#######################

- UPD: gnutls: v 3.1.10
  (Commit `45f0862f <http://sourceforge.net/p/kaarpux/code/ci/45f0862fdca37f3aadfd86dffe5b54de03c1242d/>`_)

- UPD: xulrunner firefox: v 20.0
  (Commit `3c1f106c <http://sourceforge.net/p/kaarpux/code/ci/3c1f106cfbdccb25ca23e1b6fed827b9d1393e05/>`_)

- UPD: thunderbird: v 17.0.5
  (Commit `ecdf120a <http://sourceforge.net/p/kaarpux/code/ci/ecdf120a0746164461b4b6f9144539869dd5acb3/>`_)

- UPD: noscript: v 2.6.5.9
  (Commit `1985f2d2 <http://sourceforge.net/p/kaarpux/code/ci/1985f2d2e7573992e15de2f64a240ba1312a844f/>`_)


Merge core phase into bootstrap_8
#################################

Commit `10d6d905 <http://sourceforge.net/p/kaarpux/code/ci/10d6d9058acb1e45658c906f8ca6294c50e00192/>`_

In earlier versions, we would build the
``boostrap_8`` phase
giving us a system with static IP,
then reboot, and then build the
``core`` phase,
giving us ``dhcpcd``
and ``OpenSSH``,
i.e. dynamic IP and remote login with
``ssh``.

With version ``3.5.1``, the
``core`` phase has been merged into the
``boostrap_8`` phase,
so we get dynamic IP and remote login with
``ssh`` "out of the box".


Make systemtap work with dash
#############################

Commit `1bf177e3 <http://sourceforge.net/p/kaarpux/code/ci/1bf177e35279b27b0a0efdc4e08b3ec95bf3a6a1/>`_

- make systemtap work with dash, which does not have ``$PIPESTATUS``

- improved messages during build

- all build messages logged to :file:`build.log`

- detect non-virtualization in :file:`master/expert/dangerous*`


Bugs fixed
##########

- FIX: KxBuild: Remove stray kx_time_diff
  (Commit `5b1aae87 <http://sourceforge.net/p/kaarpux/code/ci/5b1aae87810dcef84b527f9f7d3451bb6ce3cd8c/>`_)

- FIX: KxBuild: correct stderr redirection under staprun
  (Commit `c0faa76b <http://sourceforge.net/p/kaarpux/code/ci/c0faa76b43a91bd7bf1a508cfaab265ba374333d/>`_)


Minor Changes
#############

- IMPROVE: KxBuild: Improved dependency tracking
  (Commit `c6df52a9 <http://sourceforge.net/p/kaarpux/code/ci/c6df52a9d10694f64f973fcc6e715cc5c7b8c4fe/>`_)

- IMPROVE: KxBuild: build more bootstrap and core packages in parallel
  (Commit `6de8a96c <http://sourceforge.net/p/kaarpux/code/ci/6de8a96cb544c90d36e0589f1fa6cbbc0181896f/>`_,
  `58148731 <http://sourceforge.net/p/kaarpux/code/ci/58148731b63ed129ac3a5629256bb644e87bc57e/>`_)

- IMPROVE: kx_dependencies: remove self-reference loops
  (Commit `a548b3d7 <http://sourceforge.net/p/kaarpux/code/ci/a548b3d73213d3057b5e67fd107d690617bfbb1e/>`_)

- IMPROVE: iptables: do not filter on bridge interface br0
  (Commit `04f2d610 <http://sourceforge.net/p/kaarpux/code/ci/04f2d6105487e7fc6e602282b19644ddc36f9c79/>`_)

- IMPROVE: KxBuild: build more base packages in parallel
  (Commit `63c48807 <http://sourceforge.net/p/kaarpux/code/ci/63c488079950dbcad212c3d8f21e4aa2c55135e9/>`_)

- IMPROVE: KxBuild: minimal improvememnt in xorg building in parallel
  (Commit `85cb95a0 <http://sourceforge.net/p/kaarpux/code/ci/85cb95a0b3e666309931e1d42e0acb52166d82aa/>`_)

- MINOR: thunderbird: make_repeat is not needed
  (Commit `36d03720 <http://sourceforge.net/p/kaarpux/code/ci/36d0372030fd256e4202344d2b32834fe7c21aa7/>`_)

- MINOR: KxBuild: log all elapsed times in seconds
  (Commit `6ea6c8d1 <http://sourceforge.net/p/kaarpux/code/ci/6ea6c8d1867049ad17687c7e1e971c98af68d5c1/>`_)

- Minor documentation updates


