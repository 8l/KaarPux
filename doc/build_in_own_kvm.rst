.. 
   KaarPux: http://kaarpux.kaarposoft.dk
   Copyright (C) 2015: Henrik Kaare Poulsen
   License: http://kaarpux.kaarposoft.dk/license.html

.. _build_in_own_kvm:

=============================
Build KaarPux in your own KVM
=============================

You can build :program:`KaarPux` in your own KVM by following the steps below.

The first few steps may seem a bit complicated.
And they are, because every system is different.
But do not panic!
You can always reach out for help on our
`forum <http://sourceforge.net/p/kaarpux/discussion/general/>`_.



Set up a network bridge
#######################

In order to enable the KVM instance to have network connectivity,
a network bridge must be created.

Find the network interface (*if*) of your host::

	ip addr

Then run::

	master/bin/kx_create_bridge <if>

If this does not work for you,
some generic information can be obtained from
`linux-kvm <http://www.linux-kvm.org/page/Networking#public_bridge>`_
and
`libvirt.org <http://wiki.libvirt.org/page/Networking#Bridged_networking_.28aka_.22shared_physical_device.22.29>`_, 
and some distribution specific instructions can be obtained from

- `Fedora System_Administrators_Guide <http://docs.fedoraproject.org/en-US/Fedora/18/html/System_Administrators_Guide/s2-networkscripts-interfaces_network-bridge.html>`_
  (`Fedora_RHEL_Bridging <http://wiki.libvirt.org/page/Networking#Fedora.2FRHEL_Bridging>`_)

- `Ubuntu network-configuration <https://help.ubuntu.com/10.04/serverguide/network-configuration.html#bridging>`_
  (`Debian_Ubuntu_Bridging <http://wiki.libvirt.org/page/Networking#Debian.2FUbuntu_Bridging>`_)


Configure DHCP
##############

When kvm is started by the scripts explained below,
it will be assigned a MAC address of the form
``52:54:00:99:00:<nn>``,
where ``<nn>`` is a two-digit value between 10 and 99
you can choose freely.
When configuring **KaarPux** (see below), you should specify ``<nn>``
as the value of :guilabel:`Tag for this VM`.


Your DHCP server should be configured to give this MAC an IP address of
``x.y.z.<nn>``.

As an example: if you are using the ``192.168.0/24``
IP network, and want to run with ``<nn>``
set to ``17``, make sure that your DHCP server
returns IP ``192.168.0.17``
for MAC ``52:54:00:99:00:17``.


Select a location for disk images
#################################

The disk images used when building **KaarPux**
are by default located under
:file:`/kvm`, which can be a symbolic link
to another location.

If you choose another location, you can also set the
configuration option :guilabel:`Path for image files`.

You will need 50-100GB for the build.


Configure KaarPux for KVM
#########################

Generic information about configuration
can be found in :ref:`configure_kaarpux`.

Run the configuration program::

   configuration_file_name=<configuration_file_name>
   master/bin/kx_configure ${configuration_file_name} menuconfig

Under :guilabel:`Build type` select :guilabel:`KVM`.

Then select :guilabel:`Virtual host definitions`.

Under :guilabel:`Tag for this VM` select the ``<nn>`` 
used above for DHCP.
In other configuration entries, this number may be
referenced by ``%``.

If you did not create a symbolic link for :file:`/kvm`,
specify the intended location for disk images under
:guilabel:`Path for image files`.

Look through the setings under :guilabel:`Virtual host definitions`;
more information about those settings are given in the sections below.

Then select :guilabel:`Host definitions`
and look through the settings;
in general the defaults should be sufficient.

For further information see :ref:`configure_kaarpux`.

..
	The sections below are similar to those in build_on_amazon_ec2
	Make sure to reproduce any corrections there...

Create file system images
#########################

Create file ssystem images for swap and downloads, as well as for the
final **KaarPux** image::

   configuration_file_name=<configuration_file_name>
   master/bin/kx_virtual ${configuration_file_name} create_swap_img
   master/bin/kx_virtual ${configuration_file_name} create_downloads_img
   master/bin/kx_virtual ${configuration_file_name} create_target_img

The names and sizes of the images are defined in the configuration
settings under :guilabel:`Virtual host definitions`.


SSH keys
########

To avoid using passwords, we connect with SSH using keys.

So, generate a SSH keypair::

   configuration_file_name=<configuration_file_name>
   master/bin/kx_virtual ${configuration_file_name} generate_ssh_key

The filenames used to store the SSH keypair are defined in configuration
settings under :guilabel:`Virtual host definitions`.
The default is :file:`~/.ssh/id_kaarpux`

You may also re-use an existing key or generate a new key with::

   ssh-keygen <options>

Just make sure to specify the filename for the public key in
:guilabel:`Virtual host definitions`.


Create a host disk image
########################

The first (bootstrap) part of **KaarPux** is build
using an existing GNU/Linux distribution as *host*.

To create a suitable *host* disk image::

   configuration_file_name=<configuration_file_name>
   master/bin/kx_virtual ${configuration_file_name} create_host_img

By default, this will download a Fedora cloud image,
create an iso-file called :file:`host_<nn>.iso`
containing meta-data, and from this generate a 
host disk image called :file:`host_<nn>.qcow2`

The defaults can be changed in the configuration under
:guilabel:`Virtual host definitions`.

If, for some reason, you want to launch this *host*
disk image under KVM, you can::

   configuration_file_name=<configuration_file_name>
   master/bin/kx_virtual ${configuration_file_name} launch_host


Download tarballs
#################

Start the *host* created above and let it download
all the source tarballs needed for building **KaarPux**::

   configuration_file_name=<configuration_file_name>
   master/bin/kx_virtual ${configuration_file_name} launch_download

This will start a download of source tarballs
using the *host* created above.


Bootstrap KaarPux
#################

Now you are ready bootstrap **KaarPux**::

   configuration_file_name=<configuration_file_name>
   master/bin/kx_virtual ${configuration_file_name} launch_build_bootstrap

This will use the *host* created above to create a minimal
bootable version of **KaarPux**.

By default the bootable disk image will be called
:file:`kx_<nn>.img`, although this default can be changed
in the configuration under :guilabel:`Virtual host definitions`.

If, for some reason, you want to launch this minimal
version of **KaarPux** under KVM, you can::

   configuration_file_name=<configuration_file_name>
   master/bin/kx_virtual ${configuration_file_name} launch_kaarpux


Build the rest of KaarPux
#########################

The rest of **KaarPux** can now be build inside the
bootstrapped **KaarPux** created above::

   configuration_file_name=<configuration_file_name>
   master/bin/kx_virtual ${configuration_file_name} launch_build_final

That's it - you have now build **KaarPux**!!!


Next steps
##########

Your can now launch the **KaarPux** disk image::

   configuration_file_name=<configuration_file_name>
   master/bin/kx_virtual ${configuration_file_name} launch_kaarpux

And connect to it using e.g.::

   nn=<nn>
   p=$(( 5900 + ${nn} ))
   spicec --host=localhost --port=$p

See also :ref:`copying_kaarpux`
and :ref:`post_install`.
