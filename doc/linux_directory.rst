.. 
   KaarPux: http://kaarpux.kaarposoft.dk
   Copyright (C) 2015: Henrik Kaare Poulsen
   License: http://kaarpux.kaarposoft.dk/license.html

.. _linux_directory:


===========================
The kaarpux/linux directory
===========================

The :file:`kaarpux/linux` directory
is created by :file:`kaarpux/master/make_scripts.sh`
and will contain the files needed to build :program:`KaarPux` on the target system.

:file:`kaarpux/linux/build/linux`
    Each package gets unpacked and build in a subdirectory.

:file:`kaarpux/linux/linux_scripts`
    Scripts which are used when building :program:`KaarPux` on the target system.
    Populated by :file:`kaarpux/master/make_scripts.sh`.

:file:`kaarpux/linux/log/linux`
    During building, each step is logged in a file in this directory.

:file:`kaarpux/linux/perl`
    `perl <http://www.perl.org/>`_ scripts
    which are used when building :program:`KaarPux` on the target system.
    Populated by :file:`kaarpux/master/make_scripts.sh`.

:file:`kaarpux/linux/plinc`
    Include files for `perl <http://www.perl.org/>`_ scripts.

:file:`kaarpux/linux/scripts`
    Scripts which are used when building :program:`KaarPux` on the target system.
    Generated by :file:`kaarpux/master/make_scripts.sh`.
    The subdirectory :file:`kaarpux/linux/scripts/linux`
    contains the scripts for each package.


