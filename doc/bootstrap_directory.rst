.. 
   KaarPux: http://kaarpux.kaarposoft.dk
   Copyright (C) 2015: Henrik Kaare Poulsen
   License: http://kaarpux.kaarposoft.dk/license.html

.. _bootstrap_directory:

===============================
The kaarpux/bootstrap directory
===============================


The :file:`kaarpux/bootstrap` directory
is created by :file:`kaarpux/master/make_scripts.sh`
and will contain the files needed to bootstrap :program:`KaarPux` on the host system.

:file:`kaarpux/bootstrap/build`
    Contains a subdirectory for each bootstrap step:
    :file:`kaarpux/master/build/bootstrap_[1-8]`.
    Each package gets unpacked and build in a sub-sub-directory.

:file:`kaarpux/bootstrap/chroot_scripts`
    Scripts which are used in the :program:`chroot` during bootstrap.
    Copied from :file:`kaarpux/master/chroot_scripts`
    by :file:`kaarpux/master/make_scripts.sh`.

:file:`kaarpux/bootstrap/host_scripts`
    Scripts which are used on the host system during bootstrap.
    Copied from :file:`kaarpux/master/host_scripts`
    by :file:`kaarpux/master/make_scripts.sh`.

:file:`kaarpux/bootstrap/log`
    Contains a subdirectory for each bootstrap step:
    :file:`kaarpux/master/log/bootstrap_[1-8]`.
    During bootstrap, each step is logged in a file in this subdirectory.
    During bootstrap, the special subdirectory :file:`kaarpux/master/log/files`
    will be populated with a list of files for each step.

:file:`kaarpux/bootstrap/shinc`
    Files included by shell scripts.


