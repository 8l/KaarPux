.. 
   KaarPux: http://kaarpux.kaarposoft.dk
   Copyright (C) 2015: Henrik Kaare Poulsen
   License: http://kaarpux.kaarposoft.dk/license.html

.. _prepare:


==========================
Preparing to build KaarPux
==========================

Configuring KaarPux
###################

Generic information about configuration
can be found in :ref:`configure_kaarpux`.

Run the configuration program::

   master/bin/kx_configure kaarpux.conf menuconfig

Under :guilabel:`Build type` select :guilabel:`local`.

Under :guilabel:`Host definitions` specify the device names for your disks.

.. warning:: Check and double check that you are pointing to the right disks and partitions.


Pepare the target
#################

Pepare the target disk on the host system::

	master/bin/kx_sys_setup kaarpux.conf mount_target_disk
	master/bin/kx_sys_setup kaarpux.conf prepare_bootstrap_dir
	master/bin/kx_sys_setup kaarpux.conf mount_downloads_bootstrap

Copy the program:`KaarPux` source files to the target::

	cp -rp ./master /mnt/kxmnt/home/kaarpux/kaarpux/master
	cp -p ./kaarpux.conf /mnt/kxmnt/home/kaarpux/kaarpux/
	cd /mnt/kxmnt/home/kaarpux/kaarpux

Create scripts on target::

	master/make_scripts.sh

Download tarballs (may take a long time)::

	master/bin/kx_build kaarpux.conf downloads
