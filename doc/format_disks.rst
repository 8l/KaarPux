.. 
   KaarPux: http://kaarpux.kaarposoft.dk
   Copyright (C) 2015: Henrik Kaare Poulsen
   License: http://kaarpux.kaarposoft.dk/license.html

.. _format_disks:

================
Formatting disks
================

.. warning:: Be *very* careful here.
   Check and double check that you are pointing to the right disks and partitions
   before each command.



Disk and partition sizes
########################

The final :program:`KaarPux` system takes up more than 14GB space:

=================== ========
file system         size
=================== ========
:file:`/bin`        800MB
:file:`/boot`       30MB
:file:`/etc`        30MB
:file:`/home`       400MB
:file:`/include`    300MB
:file:`/lib`        6.1GB
:file:`/libexec`    300MB
:file:`/opt`        4.5GB
:file:`/share`      1.6GB
:file:`/var`        10MB
=================== ========

Unless you use ``tmpfs`` for the build directories,
you will also have:

:file:`/home`: 5-10 GB

You should add a good margin to this to allow for further
operation and development of the :program:`KaarPux` system.
A 48GB disk partition is probably a good choice.

If you use ``tmpfs`` for the build directories,
a 32 GB disk partition is probably a good choice.

You will aso need a :file:`swap` partition.
4 GB is probably a good size for the :file:`swap` partition.

Finally it is recommended to set aside a separate partition
for downloads of at least 8GB.


About BIOS, UEFI, MBR and GPT
#############################

When your computer boots up, it will controlled by one of:

- a legacy ``BIOS``
  (see `Wikipedia: BIOS <http://en.wikipedia.org/wiki/BIOS>`_)

- a ``UEFI`` interface
  (see `Wikipedia: UEFI <http://en.wikipedia.org/wiki/Unified_Extensible_Firmware_Interface>`_)

Disks can be partitioned in two "styles":

- legacy ``MBR`` partitioning
  (see `Wikipedia: MBR <http://en.wikipedia.org/wiki/Master_boot_record>`_)

- ``GPT`` partitioning
  (see `Wikipedia: GPT <http://en.wikipedia.org/wiki/GUID_Partition_Table>`_)

:program:`KaarPux` contains tools for manipulating both ``MBR`` and ``GPT`` partitioning,
and can be booted using either the legacy ``BIOS`` or the ``UEFI`` interface.

However, the instructions for building :program:`KaarPux` covers only the following two cases:

- legacy ``BIOS`` with legacy ``MBR`` partitioning.

- ``UEFI`` interface with ``GPT`` partitioning


Default partitioning - legacy MBR style
#######################################

By default, a :program:`KaarPux` system is set up with a swap partition,
a downloads partions, and a target partition.
If you are installing on a separate disk, his might be accomplished with::

   FDEV=/dev/sdb # replace /dev/sdb with the device name of your target disk

   fdisk ${FDEV}
   n
   p
   1
   
   +4G
   n
   p
   2
   
   +8G
   n
   p
   3
   
   
   t
   1
   82
   p
   w

which will set up a 4G swap partition, a 8G downloads partitions,
and the rest of the disk as root partition.


Disk partitioning - GPT style
#############################

If you are using the "new" ``GPT`` style disk partitioning,
you can use :program:`gdisk` to patition the disks::

   FDEV=/dev/sdb   # replace /dev/sdb with the device name of your target disk

   gdisk ${FDEV}

You will probably want to set aside a small ``FAT`` partition
as the ``UEFI`` partition, but your host system has probably
already done that. If not, create the partition and then create a ``FAT`` filesystem on it::

   EDEV=/dev/sdb1   # replace /dev/sdb1 with the device name of your target partition

   mkfs.vfat -F32 ${EDEV}


.. _disk_formatting:


Swap formatting
###############

Format the swap partition::

   SWAP=/dev/sdb1   # replace /dev/sdb1 with the device name of your target partition
   mkswap ${SWAP}


Downloads partition formatting
##############################

Create a filesystem on the downloads partition::

   DEV=/dev/sdb2   # replace /dev/sdb2 with the device name of your downloads partition

   mke2fs -t ext4 -jv ${DEV}
   fsck ${DEV}


Target partition formatting
###########################

Now create a filesystem on the target partition::

   DEV=/dev/sdb3   # replace /dev/sdb3 with the device name of your target partition

   mke2fs -t ext4 -jv ${DEV}
   fsck ${DEV}
