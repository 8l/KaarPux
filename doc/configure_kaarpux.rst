.. 
   KaarPux: http://kaarpux.kaarposoft.dk
   Copyright (C) 2015: Henrik Kaare Poulsen
   License: http://kaarpux.kaarposoft.dk/license.html

.. _configure_kaarpux:


=================
Configure KaarPux
=================

Most aspects of how **KaarPux** is build,
and how the final **KaarPux** system works,
is defined in a configuration file.

The configuration file is created in a way similar to the configuration of the Linux kernel.


Install required packages
#########################

To be able to run ``master/bin/kx_configure`` at least those packages are needed:

   - ``make``
   - ``gcc``
   - ``patch``
   - ``libncurses*``

For some distributions, most of those are included in 

   - ``build-essential``

To install the necessary packages, try::

   master/bin/kx_pkgs4configure

If this does not work, run ``master/bin/kx_configure <configuration_file_name> menuconfig``
and look at the output to determine which packages to install.

Run the configuration program
#############################

Now you should be able to run the configuration program::

   master/bin/kx_configure <configuration_file_name> menuconfig

See also :ref:`kx_configure`.

Configuration menu entries
##########################

1. The first menu entry is :guilabel:`Build type`.
   Here you can select if **KaarPux** should be build

   - in your own KVM (:guilabel:`KVM`)
   - on Amazon EC2 (:guilabel:`EC2`)
   - in your own machine (:guilabel:`LOCAL`)

2. The next couple of menu entries depend on the
   selected :guilabel:`Build type`.
   The contents of those menu entries are described in

   - :ref:`build_in_own_kvm`
   - :ref:`build_on_amazon_ec2`
   - :ref:`build_in_own_machine`

   You **must** go through those menus,
   and make sure everything is defined according to your needs.

   When building in a virtual machine, you will have the
   :guilabel:`VM_TAG` under :guilabel:`VM_TAG`Virtual host definitions`.
   This tag can be set to any two-digit value from 10 to 99.
   Other tags include the %-character, which will be replaced
   with the choosen :guilabel:`VM_TAG`.
   This can be used to configure several virtual machine configurations,
   with different disk names, DHCP addresses etc.
   It is suggested, that you include the value of
   :guilabel:`VM_TAG` in the ``<configuration_file_name>``

3. The :guilabel:`Target definitions` and :guilabel:`Build settings`
   are described below.

   In general, the settings in those menus can be left
   at their default values, but see the sections below
   for more information.


Target definitions
##################

The :guilabel:`Target definitions` menus are used to configure the
final **KaarPux** system (i.e. not how and where **KaarPux** is build).

You can probably leave the :guilabel:`Target definitions - KERNEL` and
:guilabel:`Target definitions - KAARPUX USER` settings at their defaults.

Depending on your hardware, you may need to change the settings in
:guilabel:`Target definitions - DISKS`,
:guilabel:`Target definitions - NETWORK`, and
:guilabel:`Target definitions - HARDWARE`.
However, for build types :guilabel:`KVM` and :guilabel:`EC2`,
the defaults are probably sufficient.

Unless you live in Denmark, you may want to change the settings in
:guilabel:`Target definitions - LOCALIZATION`.


Build settings
##############

The :guilabel:`Build settings` menu can be used to tweak how **KaarPux** is build.
In general, the defaults should be sufficient, but advanced users may
want to play with tracing, testing, parallelism, etc.
