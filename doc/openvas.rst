.. 
   KaarPux: http://kaarpux.kaarposoft.dk
   Copyright (C) 2015: Henrik Kaare Poulsen
   License: http://kaarpux.kaarposoft.dk/license.html

.. _openvas:

=======
OpenVAS
=======


About OpenVAS
#############

:program:`OpenVAS` is a framework of several services and tools
offering a comprehensive and powerful vulnerability scanning and vulnerability management solution.

See `openvas.org <http://www.openvas.org/>`_


The OpenVAS user
################

:program:`OpenVAS` is run under a dedicated user,
so as user ``root``::

	passwd openvas

The following commands should be run as user ``openvas``.


Generate OpenVAS keys certificates
##################################

A :program:`gnupg` key is used
to verify the integrety of downloaded data.
So, create our own :program:`gnupg`
key, and sign the :program:`OpenVAS`:program:`gnupg` key with it::

	gpg --homedir=/var/lib/openvas/gnupg --gen-key --batch < /var/lib/openvas/gnupg/gnupg_genkey_batch.txt
	gpg --homedir=/var/lib/openvas/gnupg --import /var/lib/openvas/gnupg/OpenVAS_TI.asc
	gpg --homedir=/var/lib/openvas/gnupg --yes --lsign-key 48DB4530

Create the certificates needed for communication::

	openvas-mkcert -q
	openvas-mkcert-client -n -i


Download OpenVAS data
#####################

Download OpenVAS data (may take half an hour or more)::

	openvas-nvt-sync
	openvas-scapdata-sync
	openvas-certdata-sync


Rebuild OpenVAS databases
#########################

The first time :program:`openvassd`
is started, it will rebuild its cache::

	openvassd

This may take 10 minutes or more.
You can watch the progress with::

	ps u -C openvassd

When cache rebuilding is complete, you should see::

	openvassd: Waiting for incoming connections

Then rebuild the :program:`openvasmd` database::

	openvasmd --rebuild


OpenVAS admin user
##################

Add an administrative user::

	openvasmd --create-user admin

Remember the password ...


Start OpenVAS
#############

:program:`openvassd`
should already have been started above.

Start manager and :program:`greenbone-security-assistant`::

	openvasmd
	gsad --port=9392

You should now have an :program:`OpenVAS` interface on `localhost:9392 <https://localhost:9392>`_


Check that everything is OK
###########################

As ``openvas``::

	wget https://svn.wald.intevation.org/svn/openvas/trunk/tools/openvas-check-setup --no-check-certificate
	chmod +x openvas-check-setup
	./openvas-check-setup


Pretending to be another Linux distribution
###########################################

Many :program:`OpenVAS` checks are distribution specific,
and :program:`KaarPux` is not recognized by :program:`OpenVAS`.
Hence you may want to set up :program:`KaarPux` to pretend to be another
Linux distribution.

Then, if you run an :program:`OpenVAS` scan,
more vulnerabilities may be picked up.

Note however, that some package names differ between :program:`KaarPux`
and other Linux distributions, so some vulnerabilities
may be missed.

As ``root``,
create the file :file:`/bin/rpm`
containing::

	#!/bin/sh
	/home/kaarpux/kaarpux/master/tools/kx_version.pl --rpm --threads=10 2>/dev/null

and the file :file:`/bin/dpkg`
containing::

	#!/bin/sh
	/home/kaarpux/kaarpux/master/tools/kx_version.pl --dpkg --threads=10 2>/dev/null | \\
	/home/kaarpux/kaarpux/master/tools/kx_pkg_dpkg.sh

and make them executable::

	chmod +x /bin/rpm /bin/dpkg

Pretending to be Fedora
=======================

As ``root``,
create the file
:file:`/etc/redhat-release`
containing::

	KaarPux pretending to be Fedora release 20 (Heisenbug)

You may want to try other :program:`Fedora` versions:
grep Fedora /var/lib/openvas/plugins/gather-package-list.nasl

Pretending to be Debian
=======================

As ``root``,
create the file
:file:`/etc/debian_version`
containing::

	KaarPux pretending to be Debian 7.0

You may want to try other :program:`Debian` versions::

	grep \\"Debian /var/lib/openvas/plugins/gather-package-list.nasl


OpenVAS network scanning
########################

A part of :program:`OpenVAS` is scanning
hosts for network vulnerabilities.
If you want to run those scans, you need to start:program:`OpenVAS`
as ``root``::

	sudo openvassd

.. warning:: If you do not run :program:`OpenVAS`
   as ``root``,
   you need to set :guilabel:`Alive Test` to :guilabel:`Consider Alive`
   when creating a :guilabel:`New Target`
   One indicator of the above problem is a log item stating:
   Remote host is dead.

