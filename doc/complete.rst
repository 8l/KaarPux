.. 
   KaarPux: http://kaarpux.kaarposoft.dk
   Copyright (C) 2015: Henrik Kaare Poulsen
   License: http://kaarpux.kaarposoft.dk/license.html

.. _complete:


====================================
Building the complete KaarPux system
====================================

After bootstrapping and booting into the new system
as described in :ref:`bootstrap`,
we are now ready to build the rest of :program:`KaarPux`.


Downloading All Packages
########################

Download all the source packages needed::

	cd /home/kaarpux/kaarpux
	linux/download_all_packages.sh

or::

	cd /home/kaarpux/kaarpux
	linux/download_packages_2.sh


Linux base
##########

Build and install ``linux_base``::

	cd /home/kaarpux/kaarpux
	linux/scripts/complete_linux_base.sh

Progress (or error) messages will be shown on the terminal,
and also piped to :file:`build.log`

``linux_base`` contains around 100 packages,
none of which requres an :program:`X11` environment
(but many of which are prerequisites for building :program:`Xorg`).


Xorg
####

Build and install ``linux_xorg``::

	cd /home/kaarpux/kaarpux
	linux/scripts/complete_linux_xorg.sh

``linux_xorg`` contains the :program:`Xorg`
libraries, server, and a number of :program:`Xorg` applications and utilities.

It also contains :program:`mesa` for hardware accelerated graphics.

Now start the :program:`Xorg` server::

	cp /home/kaarpux/kaarpux/master/files/dot.xinitrc ~/.xinitrc

	cp /share/X11/twm/system.twmrc ~/.twmrc
	echo 'UsePPosition "on"' >> ~/.twmrc
	echo 'RandomPlacement' >> ~/.twmrc

	startx

You should see :program:`xterm` and :program:`xclock`
running under the :program:`twm` window manager.

.. important:: Unless KX_DISABLE_TEST is set,
   the rest of the build process must be run under :program:`X11`,
   either directly on the target system or from remote by :command:`ssh -Y`.


Gnome
#####

Build and install ``linux_gnome``::

	cd /home/kaarpux/kaarpux
	linux/scripts/complete_linux_gnome_pre.sh
	linux/scripts/complete_linux_gnome.sh
	linux/scripts/complete_linux_gnome_post.sh

This will install a complete `Gnome <http://www.gnome.org/gnome-3/>`_
desktop environment.

Now exit the :program:`Xorg`,
and start the :program:`Gnome Display Manager`::

	gdm

and try to log in.


Desktop applications
####################

Build and install ``opt_desktop``::

	cd /home/kaarpux/kaarpux
	linux/scripts/complete_opt_desktop.sh
	linux/scripts/complete_opt_libreoffice.sh

This will install a number of packages including:

- icedtea (Java)
- firefox
- thunderbird
- Qt framework
- libreoffice


Programming environment
#######################

Programming languages and utilities::

	cd /home/kaarpux/kaarpux
	linux/scripts/complete_opt_programming.sh


Crypto currencies
#################

Wallets and miners for
`bitcoin <https://bitcoin.org>`_,
`litecoin <https://litecoin.org/>`_,
`dogecoin <http://dogecoin.com/>`_::

	cd /home/kaarpux/kaarpux
	linux/scripts/complete_opt_coins.sh


Closed source applications
##########################

You may want some applications, even though they are only
available as closed source:

- Flash Player
- Skype

Run::

	cd /home/kaarpux/kaarpux
	linux/scripts/complete_opt_closed_source.sh
