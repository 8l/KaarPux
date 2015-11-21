.. 
   KaarPux: http://kaarpux.kaarposoft.dk
   Copyright (C) 2015: Henrik Kaare Poulsen
   License: http://kaarpux.kaarposoft.dk/license.html

.. _gdm_startup:


=====================
Enable GDM at startup
=====================

To start the Graphical Display Manager
(:program:`GDM`)::

	systemctl enable gdm.service
	systemctl start graphical.target

To enable the Graphical Display Manager
(:program:`GDM`)
at system startup::

	systemctl enable gdm.service
	ln -svf /usr/lib/systemd/system/graphical.target /etc/systemd/system/default.target


