.. _kx_build:

kx_build - Build KaarPux
========================

SYNOPSIS
--------
**kx_build** <*configuration_file_name*> <*command*>


DESCRIPTION
-----------
**kx_build** is used to build **KaarPux**,
and should be executed on the build host.


COMMANDS
--------

**downloads**
  Download upsteam packages.

**bootstrap**
  Build the KaarPux bootstrap phase.

**final**
  Build the final (non-bootstrap) part of KaarPux.


FILES
-----

The <*configuration_file_name*> file
can be created with the
:doc:`kx_configure <kx_configure>` command,
and must already exist in the top **kaarpux** directory.

