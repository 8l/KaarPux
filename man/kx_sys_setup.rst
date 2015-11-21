.. _kx_sys_setup:

kx_sys_setup - Set Up build target for building KaarPux
=======================================================

SYNOPSIS
--------
**kx_sys_setup** <*configuration_file_name*> <*command*>


DESCRIPTION
-----------
**kx_sys_setup** is used to set up the build target,
in preparation for a building **KaarPux**.


COMMANDS
--------

**format_downloads_disk**
  Format the disk used to hold upstream downloads.

**mount_downloads_bootstrap**
  Mount the downloads disk in a bootstrap environment.

**mount_downloads_final**
  Mount the downloads disk.

**format_target_disk**
  Format the build target disk (in a bootstrap environment).

**mount_target_disk**
  Mount the build target disk (in a bootstrap environment).

**grub_setup**
  Install and set up grub


FILES
-----

The <*configuration_file_name*> file
file can be created with the
:doc:`kx_configure <kx_configure>` command,
and must already exist in the top **kaarpux** directory.

