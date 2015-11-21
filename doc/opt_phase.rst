.. 
   KaarPux: http://kaarpux.kaarposoft.dk
   Copyright (C) 2015: Henrik Kaare Poulsen
   License: http://kaarpux.kaarposoft.dk/license.html

.. _opt_phase:


=============
The OPT phase
=============

During the Linux phase, packages are build by ``kaarpux``,
but installed by ``root`` into the :file:`/`
and :file:`/usr`
file systems

During the opt phase, packages are build and installed by ``kaarpux``, as the :file:`/opt`
filesystem is owned by ``kaarpux``.
In this way, you can "play" with the opt packages, without touching the basic system.

Each opt package is installed in a subdirectory under :file:`/opt/kaarpux`.
At the end of each opt package installation, the files under :file:`/opt/kaarpux`
are soft-linked into :file:`/opt/bin`, :file:`/opt/include`, :file:`/opt/lib`,
etc.
