.. _kx_virtual:

kx_virtual - Build KaarPux in a virtual machine
===============================================

SYNOPSIS
--------
**kx_virtual** <*configuration_file_name*> <*command*>


DESCRIPTION
-----------
**kx_virtual** is used to prepare for and build **KaarPux**
in a virtual machine,
based on the settings in <*configuration_file_name*>.


COMMANDS
--------

**create_swap_img**
  Create a vm host image to hold swap space.

**create_downloads_img**
  Create a vm host image to hold downloaded files.

**create_target_img**
  Create a vm host image to hold the KaarPux target.

**generate_ssh_key**
  Create ssh key used to log into the virtual machines.

**create_host_img**
  Create a build host image.

**launch_host_ssh**
  Launch the virtual build host machine.

**launch_download**
  Launch the virtual build host machine and download upstream packages.
  This includes formatting the downloads disk.

**launch_download_again**
  Launch the virtual build host machine and download missing upstream packages.
  This does *not* include formatting the downloads disk.

**launch_downloads_ssh**
  Launch the virtual build host machine,
  with downloads images attached.

**launch_build_bootstrap**
  Launch the virtual build host machine and bootstrap the target.

**launch_bootstrap_ssh**
  Launch the bootstrap version of KaarPux.

**launch_build_final**
  Launch the target created above and build the rest of **KaarPux**

**launch_kaarpux_ssh**
  Launch the KaarPux virtual machine (build with e.g. **launch_build_final**)

**ec2_info**
  Show information about Amazon EC2 for this user


FILES
-----

The <*configuration_file_name*> file
file can be created with the
:doc:`kx_configure <kx_configure>` command,
and must already exist in the top **kaarpux** directory.


NOTES
-----

When running **launch_XXX_ssh** in your own KVM,
the image launched will be the latest image used by the KVM.
This image will be useful for debugging the previous build step.

However, if running **launch_XXX_ssh** on EC2, 
the image will be the the basic image,
as EC2 machines are booted off a snapshot.

