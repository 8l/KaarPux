.. _kx_configure:

kx_configure - Create or Update KaarPux Configuration file
==========================================================


SYNOPSIS
--------
**kx_configure** <*configuration_file_name*> <*command*>


DESCRIPTION
-----------
**KaarPux** is configured in a way which is similar to the way
the Linux Kernel is configured.

**kx_configure** will create <*configuration_file_name*>
if it does not exist.
Then <*configuration_file_name*> will be updated using
<*command*>.


COMMANDS
--------

**config**
  Update current or create new config utilising a line-oriented program

**nconfig**
  Update current or create new config utilising a ncurses menu based program

**menuconfig**
  Update current or create new config utilising a menu based program

**xconfig**
  Update current or create new config utilising a QT based front-end

**gconfig**
  Update current or create new config utilising a GTK based front-end

**oldconfig**
  Update current or create new config utilising a provided config as base

**silentoldconfig**
  Same as oldconfig, but quietly


ENVIRONMENT
-----------

**kx_configure** may fail if suitable packages are not installed.


FILES
-----

The <*configuration_file_name*> file
will be placed in the top **kaarpux** directory.

