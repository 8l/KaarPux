.. 
   KaarPux: http://kaarpux.kaarposoft.dk
   Copyright (C) 2015: Henrik Kaare Poulsen
   License: http://kaarpux.kaarposoft.dk/license.html

.. _copying_kaarpux:


==================================
Copying KaarPux to another machine
==================================


Overview
########

Copying :program:`KaarPux` to a different machine is simple:

:ref:`copying_kaarpux_create_tarball`
on the source machine
copy the ``tarball``
from the source machine
to the target machine
:ref:`copying_kaarpux_unpack_tarball`
on the target machine
:ref:`copying_kaarpux_configure`
on the target machine

:program:`KaarPux` also provides a :ref:`copying_kaarpux_script_remote`


.. _copying_kaarpux_create_tarball:

Create a KaarPux tarball
########################

In order to copy :program:`KaarPux` to a different machine,
first create a ``tarball``
containing the original :program:`KaarPux` system.
The size of the ``tarball``
will be around 5GB.

It might be possible to create the ``tarball``
directly from the running :program:`KaarPux` system with a command like::

	MNT=/
	TARBALL=/tmp/kaarpux.tar.gz

	cd ${MNT}
	tar czf ${TARBALL} \\
	--format=pax \\
	--one-file-system \\
	--anchored \\
	--exclude=./home/kaarpux/kaarpux/downloads \\
	--exclude=./home/kaarpux/kaarpux/bootstrap/build \\
	--exclude=./home/kaarpux/kaarpux/linux/build \\
	--exclude=./tools* \\
	--exclude=./lost+found \\
	.

This command will only archive the root file system,
not any mounted file systems (``--one-file-system``).
However, files in e.g. :file:`/var`
and :file:`/home` might be
modified during archiving, so this approach is not really recommended.

A much better approach is to boot from another partition
(e.g. the original host system used to build :program:`KaarPux`),
and mount the :program:`KaarPux` partition on :file:`/mnt`.

Then the ``tarball`` can be created with::

	MNT=/mnt
	TARBALL=/tmp/kaarpux.tar.gz

	cd ${MNT}
	tar czf ${TARBALL} \\
	--format=pax \\
	--anchored \\
	--exclude=./home/kaarpux/kaarpux/downloads \\
	--exclude=./home/kaarpux/kaarpux/bootstrap/build \\
	--exclude=./home/kaarpux/kaarpux/linux/build \\
	--exclude=./tools* \\
	--exclude=./lost+found \\
	.

If you have :program:`pigz` installed,
the compression can be done in parallel (i.e. faster)::

	MNT=/mnt
	TARBALL=/tmp/kaarpux.tar.gz

	cd ${MNT}
	tar cf - \\
	--format=pax \\
	--anchored \\
	--exclude=./home/kaarpux/kaarpux/downloads \\
	--exclude=./home/kaarpux/kaarpux/bootstrap/build \\
	--exclude=./home/kaarpux/kaarpux/linux/build \\
	--exclude=./tools* \\
	--exclude=./lost+found \\
	. \\
	| pigz --stdout - \\
	> ${TARBALL}

Or, if you are willing to wait for an even more compressed snapshot::

	MNT=/mnt
	TARBALL=/tmp/kaarpux.tar.gz

	cd ${MNT}
	tar cJf ${TARBALL} \\
	--format=pax \\
	--anchored \\
	--exclude=./home/kaarpux/kaarpux/downloads \\
	--exclude=./home/kaarpux/kaarpux/bootstrap/build \\
	--exclude=./home/kaarpux/kaarpux/linux/build \\
	--exclude=./tools* \\
	--exclude=./lost+found \\
	.

If you have build :program:`KaarPux` in a Virtual Machine
( see :ref:`build_in_own_kvm` ),
the image file may be mounted with a command like::

	IMG=kx_50.img
	MNT=/mnt

	mount -o loop,offset=$((2048 * 512)) ${IMG} ${MNT}


.. _copying_kaarpux_unpack_tarball:

Unpack the KaarPux tarball
##########################

Boot into an existing linux distribution on the target machine, and
prepare a partition for :program:`KaarPux`.

.. warning:: Be *very* careful here.
   Check and double check that you are pointing to the right partition!

::

	DEV=/dev/sdb2

	mke2fs -t ext4 -jv ${DEV}
	fsck ${DEV}

Mount the partition and unpack the :program:`KaarPux` ``tarball``
(see :ref:`copying_kaarpux_create_tarball`)::

	MNT=/mnt
	DEV=/dev/sdb2
	TARBALL=/tmp/kaarpux.tar.gz

	mount ${DEV} ${MNT}
	cd ${MNT}
	tar xf ${TARBALL} --numeric-owner


.. _copying_kaarpux_configure:

Configure KaarPux after copying
###############################

After copying :program:`KaarPux` to another machine
(see :ref:`copying_kaarpux_unpack_tarball`)
a few things need to be configured.

:file:`/etc/fstab` will need to be updated.

You should have one line for the root file system like::

	UUID=75bac34a-d535-4e51-9467-0b94e27d72ac / ext4 defaults 1 1

where the ``UUID`` can (depending on the linux distribution you booted into)
be found with a command like::

	blkid

For swap, you may have zero or more lines like::

	UUID=066af73a-d8fd-49b7-b806-05f625681d4d swap swap pri=1 0 0

Add :program:`KaarPux` to the bootloader already found on the target machine.

Depending on the linux distribution you booted into,
the command may be something like::

	CFG=/boot/grub/grub.cfg
	grub-mkconfig -o ${CFG}

You should now be ready to boot into :program:`KaarPux`!

After booting into :program:`KaarPux` you may want further configurations
as described in :ref:`post_install`.

You may also want to install :program:`grub`
from :program:`KaarPux` as your bootloader.
Follow the instructions in :ref:`prepare_boot_grub`,
but do *not* enter the :program:`chroot`.


.. _copying_kaarpux_script_remote:

Script to install KaarPux on a remote machine
#############################################

Boot the remote machine
(from a different partition than where you want :program:`KaarPux`)

Create and install ssh key:

On the *local* machine::

	REMOTE_IP=192.168.42.42
	KEY_NAME=id_remote

	ssh-keygen -f ~/.ssh/${KEY_NAME}
	scp ~/.ssh/${KEY_NAME}.pub ${REMOTE_IP}:

	REGULAR_USER=kaarpux

	cd /root
	mkdir -pv -m 700 .ssh
	cp -rp /home/${REGULAR_USER}/.ssh/${KEY_NAME}* .ssh

On the *remote* machine::

	KEY_NAME=id_remote
	REGULAR_USER=kaarpux

	cd /root
	mkdir -pv -m 700 .ssh
	touch .ssh/authorized_keys
	chmod 600 .ssh/authorized_keys
	cat /home/${REGULAR_USER}/${KEY_NAME}.pub >> .ssh/authorized_keys

On the *local* machine::

	REMOTE_IP=192.168.42.42
	ssh root@${REMOTE_IP} id

Run the install script

On the *local* machine::

	LOCAL_IMG=/kvm/kx_50.img
	LOCAL_MNT=/mnt
	REMOTE_IP=192.168.42.42
	REMOTE_PARTITION=/dev/sdccc
	REMOTE_MNT=/mnt
	REMOTE_KEEP=Y

	master/expert/dangerous_install_remote.sh \\
	"${LOCAL_IMG}" "${LOCAL_MNT}" \\
	"${REMOTE_IP}" "${REMOTE_PARTITION}" "${REMOTE_MNT}" \\
	"${REMOTE_KEEP}"

Grub set-up
###########

Update the remote grub configuration,
either by using the distro's grub configuration update utilities,
or by adding the output from the command above to the grub.cfg file.
