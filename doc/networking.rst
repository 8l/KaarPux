.. 
   KaarPux: http://kaarpux.kaarposoft.dk
   Copyright (C) 2015: Henrik Kaare Poulsen
   License: http://kaarpux.kaarposoft.dk/license.html

.. _networking:


=================
Networking Set-up
=================

You may change the system hostname in :file:`/etc/hostname`
and :file:`/etc/hosts`.
This change should take effect after the next reboot.

If you have build :program:`KaarPux` according to the instructions,
your network interface will be handled directly
by :program:`systemd-networkd`, which is started
automatically by :program:`systemd`.

See

- `systemd-networkd.service <http://www.freedesktop.org/software/systemd/man/systemd-networkd.service.html>`_

- `systemd.network <http://www.freedesktop.org/software/systemd/man/systemd.network.html>`_

- `intro-to-systemd-networkd <https://coreos.com/blog/intro-to-systemd-networkd>`_

Alternative: Network Manager
############################

As an alternative to :program:`systemd-networkd`
you can use :program:`NetworkManager`
(see  :ref:`pkg_NetworkManager`)
with the :program:`NetworkManager Applet`
(see  :ref:`pkg_network-manager-applet`).

To disable :program:`systemd-networkd`
and enable :program:`NetworkManager` instead::

	systemctl stop systemd-networkd
	systemctl disable systemd-networkd
	systemctl enable NetworkManager
	systemctl start NetworkManager


