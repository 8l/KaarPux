.. 
   KaarPux: http://kaarpux.kaarposoft.dk
   Copyright (C) 2015: Henrik Kaare Poulsen
   License: http://kaarpux.kaarposoft.dk/license.html

.. _build_on_amazon_ec2:

===========================
Build KaarPux on Amazon EC2
===========================

You can build KaarPux on Amazon EC2 by following the steps below.

.. warning::
   Using Amazon EC2 will incur costs.
   Please note that the instructions here are given
   without *any* guarantees.
   See :ref:`license`.


Create an account on Amazon
###########################

If you do not already have an AWS account, you should start by
creating one as described in:
`Setting Up with Amazon EC2 <http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/get-set-up-for-amazon-ec2.html>`_

You do **not** need to *Create Key Pair*.


Configure your Amazon AWS account
#################################

Security Group
--------------

Create a *Custom Security Group*
(see `Amazon EC2 Security Groups for Linux Instances <http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/using-network-security.html>`_)
which allows incoming SSH.

Virtual Private Cloud (VPC)
---------------------------

Create a *Virtual Private Cloud (VPC)*
(see `Create a Virtual Private Cloud (VPC) <http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/get-set-up-for-amazon-ec2.html#create-a-vpc>`_)

Network Interface
-----------------

Create an *Elastic Network Interface*
(see `Creating an Elastic Network Interface <http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/using-eni.html#create_eni>`_).

Either name the *Elastic Network Interface* **KaarPux1**,
or put the name you choose in the ``EC2_NETWORK_INTERFACE_NAME`` 
configuration setting (see below).


Create boto3 configuration files
################################

The **KaarPux** build system uses `boto3 <https://github.com/boto/boto3>`_
to access Amazon EC2 services.

You must create two files in your local home file system:

:file:`~/.aws/credentials`::

   [default]
   # The access key for your AWS account
   aws_access_key_id=<YOUR ACCESS KEY ID>

   # The secret key for your AWS account
   aws_secret_access_key=<YOUR SECRET KEY>

:file:`~/.aws/config`::

   [default]
   # The default region when making requests
   region=<REGION NAME>

.. warning::
   Make sure you protect unwanted access to those files.
   They will allow unlimited access to your AWS account


Configure KaarPux for EC2
#########################

Generic information about configuration
can be found in :ref:`configure_kaarpux`.

Run the configuration program::

   configuration_file_name=<configuration_file_name>
   master/bin/kx_configure ${configuration_file_name} menuconfig

Under :guilabel:`Build type` select :guilabel:`EC2`.

In general, the defaults can be used,
except as mentioned in :ref:`configure_kaarpux`.

..
	The sections below are similar to those in build_in_own_kvm
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

By default, this will use a Fedora cloud image
to create an AMI (Amazon Machine Image)
called :file:`host_<nn>`

The defaults can be changed in the configuration under
:guilabel:`Virtual host definitions`.

If, for some reason, you want to launch this *host*
disk image in EC2, you can::

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

The AMI (Amazon Machine Image) created will by default
have the name :file:`kx_<nn>`, although this default can be changed
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

   ssh <ip>
