.. 
   KaarPux: http://kaarpux.kaarposoft.dk
   Copyright (C) 2015: Henrik Kaare Poulsen
   License: http://kaarpux.kaarposoft.dk/license.html

.. _changes_2_0_0:


================================
Changes in KaarPux version 2.0.0
================================

:program:`KaarPux` version ``2.0.0`` released on ``2012-08-21``

Controlling system boot with ``systemd`` instead of ``sysvinit``.


Use systemd instead of sysvinit
###############################

Commit `62f65b25 <http://sourceforge.net/p/kaarpux/code/ci/62f65b25a04652aff3d28994ebf1efae1428b9c2/>`_,
`f089d6fb <http://sourceforge.net/p/kaarpux/code/ci/f089d6fbea4403a43d0431660518b14051ec008e/>`_.

Introducing systemd
===================

``systemd`` is a system and service manager for Linux, compatible with SysV and LSB init scripts.
``systemd`` provides aggressive parallelization capabilities,
uses socket and D-Bus activation for starting services, offers on-demand starting of daemons,
keeps track of processes using Linux control groups, supports snapshotting and restoring of the system state,
maintains mount and automount points and implements an elaborate transactional dependency-based service control logic.

See `systemd <http://freedesktop.org/wiki/Software/systemd/>`_ for more information and links.

Replacing ``sysvinit`` with ``systemd`` has some advantages:

- we get rid of a lot of unmaintained :file:`init.d` scripts

- we get much faster booting

- we have a cleaner definition on what to do on boot

However, the disadvantages:

- we need to pull a lot of ("unwanted") packages into the core system

- we loose the :file:`/` vs.
  :file:`/usr` separation,
  so we cannot boot without :file:`/usr` mounted

- we cannot boot without e.g. ``dbus``

To the author of :program:`KaarPux` the advantages seems to outweight the disadvantages!
So, :program:`KaarPux` is switching to ``systemd``.

Packages have been added, removed, and modified (see below) and:

- remove all :file:`/etc/rc.d scripts`

- remove all :file:`/etc/sysconfig files`

- add configuration files for ``systemd``

- move a lot of prerequisite packages from ``linux_base`` to ``bootstrap``


Added packages
==============

The following package has been added:

- ``systemd``
  (Commit `62f65b25 <http://sourceforge.net/p/kaarpux/code/ci/62f65b25a04652aff3d28994ebf1efae1428b9c2/>`_,
  `f089d6fb <http://sourceforge.net/p/kaarpux/code/ci/f089d6fbea4403a43d0431660518b14051ec008e/>`_)


Removed packages
================

The following packages have been removed:

- ``sysvinit``
  (Commit `62f65b25 <http://sourceforge.net/p/kaarpux/code/ci/62f65b25a04652aff3d28994ebf1efae1428b9c2/>`_,
  `f089d6fb <http://sourceforge.net/p/kaarpux/code/ci/f089d6fbea4403a43d0431660518b14051ec008e/>`_)

- ``sysklogd``; now handled by the journal in ``systemd``
  (Commit `62f65b25 <http://sourceforge.net/p/kaarpux/code/ci/62f65b25a04652aff3d28994ebf1efae1428b9c2/>`_,
  `f089d6fb <http://sourceforge.net/p/kaarpux/code/ci/f089d6fbea4403a43d0431660518b14051ec008e/>`_)

- ``udev``; now part of ``systemd``
  (Commit `62f65b25 <http://sourceforge.net/p/kaarpux/code/ci/62f65b25a04652aff3d28994ebf1efae1428b9c2/>`_,
  `f089d6fb <http://sourceforge.net/p/kaarpux/code/ci/f089d6fbea4403a43d0431660518b14051ec008e/>`_)

- ``ConsoleKit``
  (Commit `f8b9c4cb <http://sourceforge.net/p/kaarpux/code/ci/f8b9c4cb64777bde5fe5ed0414e6b390e1e0cef7/>`_)


Modified packages
=================

The following packages have been modified to support ``systemd``:

- ``gnome-settings-daemon``
  (Commit `de832eea <http://sourceforge.net/p/kaarpux/code/ci/de832eead9b592ee7145ba3c966185e79301b0e9/>`_)

- ``cups``; updated to version 1.5.4
  (Commit	`bb2604db <http://sourceforge.net/p/kaarpux/code/ci/bb2604dbef4cfc3f922134c47875f3806349d307/>`_,
  `f92de388 <http://sourceforge.net/p/kaarpux/code/ci/f92de3882ea842c85f46d8a5e062dc8d8b9d9e4b/>`_,
  `a32e3e2c <http://sourceforge.net/p/kaarpux/code/ci/a32e3e2c98a689e6a1fb8a2bc4b2b7884e27c7a0/>`_,
  `efe657a5 <http://sourceforge.net/p/kaarpux/code/ci/efe657a500f8278464c50a6bba416dac62b10ce7/>`_)

- ``pulseaudio``; updated to v 2.1
  (Commit `48926ba8 <http://sourceforge.net/p/kaarpux/code/ci/48926ba845f6bd2b03d6efb06c208ed042812119/>`_)

- ``NetworkManager``
  (Commit `221e5198 <http://sourceforge.net/p/kaarpux/code/ci/221e5198c0e8d965dae09b9e1e216222d884161b/>`_,
  `b36e1c21 <http://sourceforge.net/p/kaarpux/code/ci/b36e1c21e4177255071ce34619e00835f1f56e3d/>`_)

- ``iptables``
  (Commit `8f0c6e2f <http://sourceforge.net/p/kaarpux/code/ci/8f0c6e2fd1f3137d747317b0c81bfd86c9fa5507/>`_,
  `7bf61175 <http://sourceforge.net/p/kaarpux/code/ci/7bf611759695b9234a8b13b310c4184c8124fd2b/>`_)

- ``openssh``
  (Commit `4075c121 <http://sourceforge.net/p/kaarpux/code/ci/4075c12155aa15f3d882714bec552f85ad0086a0/>`_)

- ``dhcpcd``
  (Commit `2547aaa8 <http://sourceforge.net/p/kaarpux/code/ci/2547aaa89f9143dfc88c00301e08a362daec77cc/>`_)

- ``usbutils``; updated to version 006
  (Commit `62f65b25 <http://sourceforge.net/p/kaarpux/code/ci/62f65b25a04652aff3d28994ebf1efae1428b9c2/>`_,
  `f089d6fb <http://sourceforge.net/p/kaarpux/code/ci/f089d6fbea4403a43d0431660518b14051ec008e/>`_)

- ``gdm``
  (Commit `bf9ff663 <http://sourceforge.net/p/kaarpux/code/ci/bf9ff663d540687c0727e8d8368d2ebe99a62539/>`_)


Other Changes
#############

- ADD: kx_changelog: Nifty little tool to generate yaml changelog from git
  (Commit `4d1f6d2b <http://sourceforge.net/p/kaarpux/code/ci/4d1f6d2b63dbd3a2100201566abe6a2413a43c1f/>`_)

- IMPROVE: cyrus-sasl: make: -j 1
  (Commit `2a038895 <http://sourceforge.net/p/kaarpux/code/ci/2a0388951ef537b647b6271b1a3699b1ffdde668/>`_)

- IMPROVE: linux-pam: add /usr/lib/security symlink
  (Commit `dd0e0385 <http://sourceforge.net/p/kaarpux/code/ci/dd0e038586f15ef7e7fe197c8e6d21915cbcddab/>`_)

- IMPROVE: dbus: add dbus-launch symlink
  (Commit `4f0ba38f <http://sourceforge.net/p/kaarpux/code/ci/4f0ba38f4b33f653ddb6591c3c0e07ec3610ba43/>`_)

- FIX: wget: configuration files in /etc
  (Commit `066c288c <http://sourceforge.net/p/kaarpux/code/ci/066c288cb6fd57be329b705e2b4519df604c8d1c/>`_)

- FIX: systemtap: configuration files in /etc
  (Commit `c4f803b2 <http://sourceforge.net/p/kaarpux/code/ci/c4f803b2b475fac64c59b00a4e19cf85a045da3e/>`_)

- :file:`motd` removed; who cares anyway

- Many documentation updates
