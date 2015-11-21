.. 
   KaarPux: http://kaarpux.kaarposoft.dk
   Copyright (C) 2015: Henrik Kaare Poulsen
   License: http://kaarpux.kaarposoft.dk/license.html

.. _prepare_boot:

=========================
Preparing to Boot KaarPux
=========================


After bootstrapping :program:`KaarPux` as described in :ref:`bootstrap`,
now prepare :program:`KaarPux` for booting.


.. _prepare_boot_grub:

GRUB setup
##########

If you want the target system boot to be controlled by :program:`KaarPux` you must set up
`GRUB <http://www.gnu.org/software/grub/>`_.

Enter the :program:`chroot`::

	MNT=/mnt/kxmnt
	cd ${MNT}/home/kaarpux/kaarpux
	bootstrap/host_scripts/enter_chroot.sh

Now install GRUB on the target disk.

.. warning:: Be *very* careful here.
   If you specify the wrong partition, you may brick the host system.

If you are using legacy ``MBR`` partitioning::

	DEV=/dev/sdb   # replace with the device name of your target disk
	CFG=/boot/grub/grub.cfg

	grub-install ${DEV}

If you are using ``GPT`` partitioning::

	CFG=/boot/efi/EFI/kaarpux/grub/grub.cfg

	grub-install --target=x86_64-efi --efi-directory=/boot/efi --bootloader-id=kaarpux --boot-directory=/boot/efi/EFI/kaarpux/ --recheck

Finally, create the :program:`GRUB` configuration,
and verify that it is OK.

You may also edit the configuration file, but it will be overwritten
next time :command:`grub-mkconfig` is run.::


	grub-mkconfig -o ${CFG}
	cp ${CFG} ${CFG}.ORIG
	vi ${CFG}

If you have an ``UEFI`` system, you need to register the new bootloader::

	FDEV=/dev/sdb   # replace with the device name of your target disk
	FPART=1      # replace with the partition number on your target disk

	efibootmgr --create --gpt --disk ${FDEV} --part ${FPART} --write-signature --label "KaarPux" --loader "\\\\EFI\\\\kaarpux\\\\grubx86.efi"

Exit the :program:`chroot`::

	exit


Final preparations
##################

Enter the :program:`chroot`::

	MNT=/mnt/kxmnt
	cd ${MNT}/home/kaarpux/kaarpux
	bootstrap/host_scripts/enter_chroot.sh

Setup passwords::

	passwd root
	passwd kaarpux

Change ownership::

	chown -R kaarpux:kaarpux /home/kaarpux

Clean out :file:`/tmp`::

	rm -rf /tmp/*

Optionally, if you are short on diskspace::

	rm -rf /home/kaarpux/kaarpux/bootstrap/build

or even::

	rm -rf /home/kaarpux/kaarpux/bootstrap

Exit the :program:`chroot`::

	exit

Unmount virtual file systems::

	bootstrap/host_scripts/umount_virtual_kernel_fs.sh
	cd /
	umount ${MNT}


Create a snapshot
#################

If you want a "snapshot" of the system, create a ``tarball``
as described in :ref:`copying_kaarpux_create_tarball`.

Make sure :file:`${MNT}` is mounted,
but that the virtual file systems are not mounted. Use settings similar to the following::

	MNT=/mnt/kxmnt
	TARBALL=/somewhere/kaarpux-boot.tar.gz


Boot into the new system
########################

That's it! You should now be able to boot into the new system!

When you reboot, you should have a system which obtains it's IP-address
by :program:`DHCP`, is protected by by :program:`iptables`,
and which allows remote login with :program:`ssh`,
as well as console login.


