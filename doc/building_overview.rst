.. 
   KaarPux: http://kaarpux.kaarposoft.dk
   Copyright (C) 2015: Henrik Kaare Poulsen
   License: http://kaarpux.kaarposoft.dk/license.html

.. _building_overview:

=================
Building overview
=================

There are two major steps involved in building :program:`KaarPux`:

   - Use an existing Linux distribution (called the *Host System*) to build 
     a minimal, bootable version of :program:`KaarPux`

   - Boot into the minimal :program:`KaarPux` version to build a complete :program:`KaarPux` distribution.


Different ways to build KaarPux
###############################

**Kaarpux** can be build in many ways; here we describe three:

   - :ref:`build_in_own_kvm`
   - :ref:`build_on_amazon_ec2`
   - :ref:`build_in_own_machine`


.. _building_overview_step_by_step:

Step-by-step
############

The steps involved in building :program:`KaarPux`
(as described in more detail in the following sections)
are:

Get ready
    - :ref:`host_system`:
      Make sure the tools needed to build :program:`KaarPux` are installed on the *Host System*
    - :ref:`format_disks`:
      Format the disk partition(s) :program:`KaarPux` will be install onto.
    - :ref:`download_and_prepare`:
      Download the bleeding edge or stable version of :program:`KaarPux` as a tarball.
    - :ref:`configure_kaarpux`:
      Create a configuration file with suitable options for your system and build

       - mount disks
       - prepare a host directory for :program:`KaarPux`
       - unpack tarballl
       - configure :program:`KaarPux`
       - create scripts
       - download packages
       - add a dedicated build user


Bootstrap
    - :ref:`bootstrap`: Build all packages needed for a bootable system.
    - :ref:`prepare_boot`: Install :program:`grub`, set passwords, cleanup


Build
     - :ref:`complete`: Boot into the new (minimal) system.
       Build the rest of the :program:`KaarPux` packages there.

Use it
     - Reboot, and :program:`KaarPux` is at your service
     - :ref:`post_install`: Add a final touch to :program:`KaarPux`

All the above steps are described in detail in :ref:`build_in_own_machine`


.. _building_overview_easier:

Easier ways to build KaarPux
############################

In order to automate the building of :program:`KaarPux` further, 
you can use a virtual machine:

   - :ref:`build_in_own_kvm`
   - :ref:`build_on_amazon_ec2`


.. _building_overview_duration:

KaarPux Build Duration
######################

KaarPux can be build in less than 5 hours on this reference installation:

   - Intel Core i7-3970X Extreme, 6-Core, 3.5GHz CPU
   - ASUS P9X79 WS motherboard
   - 64 GB 1333MHz CL-9-9-9-24 memory

Host and target where run under :program:`kvm` with testing disabled,
using  :program:`tmpfs` for build directories.

Durations for each phase:

============= ============
phase         duration
============= ============
bootstrap     40 minutes
linux base    40 minutes
xorg          10 minutes
gnome         1 hour
desktop       1 hour
libreoffice   45 minutes
programming   30 minutes
============= ============

