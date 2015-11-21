.. 
   KaarPux: http://kaarpux.kaarposoft.dk
   Copyright (C) 2015: Henrik Kaare Poulsen
   License: http://kaarpux.kaarposoft.dk/license.html

.. _changes_3_0_1:


================================
Changes in KaarPux version 3.0.1
================================

:program:`KaarPux` version ``3.0.1`` released on ``2012-sep-10``

Package updates and bugfixes.


Package Updates
###############

- UPD: alsa-\*: v 1.0.26
  (Commit `1741e313 <http://sourceforge.net/p/kaarpux/code/ci/1741e31395e4aa0e9c69fa4dbc473bb01f1e278a/>`_)

- UPD: xulrunner firefox: v 15.0.1
  (Commit `fe693a1f <http://sourceforge.net/p/kaarpux/code/ci/fe693a1ffb4f79d735f9f54ddc65d3a693bbe661/>`_)

- UPD: icedtea-web: v 1.3
  (Commit `0256f1ee <http://sourceforge.net/p/kaarpux/code/ci/0256f1ee5165e581dbde26b4fe103c7fa3c1b33d/>`_)

- UPD: noscript: v 2.5.4
  (Commit `4df851bf <http://sourceforge.net/p/kaarpux/code/ci/4df851bf0e865c4b2b8dd729268e793ec5fa1533/>`_)


Bugfixes
########

- FIX: gdm: register gdm sessions with systemd/logind in pam
  (Commit `5983168c <http://sourceforge.net/p/kaarpux/code/ci/5983168c052092dc8f8a003ede766b02283ecf10/>`_)

- FIX: polkit: new download location
  (Commit `eb6d22de <http://sourceforge.net/p/kaarpux/code/ci/eb6d22defed5ca447199a7bf1be4b81ab6106948/>`_)


Minor Changes
#############

- IMPROVE: boost: install both static and shared libraries
  (Commit `56ed3a97 <http://sourceforge.net/p/kaarpux/code/ci/56ed3a97712771892554b9022d95ef6a7e55f452/>`_)

- IMPROVE: xulrunner firefox thunderbird: set mozonfig version by script, not manually
  (Commit `330634d4 <http://sourceforge.net/p/kaarpux/code/ci/330634d4de64aea51f0fc679139c1bbdb6d93d50/>`_)

- MINOR: \[m-s]*: improved version check
  (Commit `86ada3d1 <http://sourceforge.net/p/kaarpux/code/ci/86ada3d1ef325ed77f5d400bf59f1ad4b99016ad/>`_)

- MINOR: kx_changelog.pl: list changes in chronological order
  (Commit `0c259e59 <http://sourceforge.net/p/kaarpux/code/ci/0c259e5931084b67ac5b24d3a5a3266d217827af/>`_)


Upgrade instructions
####################

The upgrades can be applied to a:program:`KaarPux` version ``3.0.0`` system
by re-installing the packages in this recommended sequence:

- ``alsa-lib``

- ``alsa-plugins``

- ``alsa-utils``

- ``gdm``

- ``xulrunner``

- ``firefox``

- ``icedtea-web``

- ``noscript``
