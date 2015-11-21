.. 
   KaarPux: http://kaarpux.kaarposoft.dk
   Copyright (C) 2015: Henrik Kaare Poulsen
   License: http://kaarpux.kaarposoft.dk/license.html

.. _bootstrap:

=====================
Bootstrapping KaarPux
=====================


Build bootstrap packages
########################

After setting everything up properly as described in :ref:`prepare`, :program:`KaarPux` can now be bootstrapped::

	MNT=/mnt/kxmnt
	cd ${MNT}/home/kaarpux/kaarpux
	touch build.log
	chown kaarpux:kaarpux build.log
	master/bin/kx_build kaarpux.conf bootstrap

Progress (or error) messages will be shown on the terminal,
and also piped to :file:`build.log`

