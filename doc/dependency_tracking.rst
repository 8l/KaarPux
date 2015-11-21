.. 
   KaarPux: http://kaarpux.kaarposoft.dk
   Copyright (C) 2015: Henrik Kaare Poulsen
   License: http://kaarpux.kaarposoft.dk/license.html

.. _dependency_tracking:


===========================
Package Dependency Tracking
===========================


Enabling Package Dependency Tracking
####################################

Package Dependency Tracking during build is optional, and can be enabled by setting :command:`KX_SYSTEMTAP="yes"` in :file:`custom_definitions.shinc`.


How Dependency Tracking Works
#############################

In order to track package dependencies during build, the :program:`systemtap` script :file:`master/chroot_scripts/kx_open.stp` is used.

The :program:`KaarPux` build scripts will run each step under :program:`systemtap`
with :file:`kx_open.stp` enabled.: file:`kx_open.stp` will output the path of every file used by the build script.
The output is piped through through :program:`grep` and :program:`awk`,
in order to list the relevant files into :file:`kaarpux/flist/*.rw`.


Using Package Dependency Tracking
#################################

It might be possible to use Package Dependency Tracking on hosts
other than :program:`KaarPux` (e.g. :program:`Ubuntu`).
However, it is recommended to use Package Dependency Tracking using
a :program:`KaarPux` host (i.e. building a new :program:`KaarPux` target system on an existing:program:`KaarPux` host system), because the Package Dependency Tracking setup
is readily available on :program:`KaarPux`.

On :program:`KaarPux`, ``bootstrap_8`` installs :program:`systemtap`,
and runs the script :file:`master/chroot_scripts/install_kx_open_stp.sh`
to install :file:`kx_open.stp`.
Hence, on a :program:`KaarPux` host, using :command:`KX_SYSTEMTAP="yes"`
should work like a charm.


/lib/modules
############

When installing a linux kernel, the kernel modules are installed into :file:`/lib/modules/KERNELVERSION`.
The files needed for normal operation are copied into this directory.
However, to compile new kernel modules
(such as :file:`master/chroot_scripts/kx_open.stp`),
the kernel build tree needs to be left in place (under :file:`kaarpux/bootstrap/build/bootstrap_8/linux-RELEASE` or:file:`kaarpux/linux/build/linux/linux-RELEASE`),
as :file:`/lib/modules/KERNELVERSION/build`
and :file:`/lib/modules/KERNELVERSION/source`
are symbolic links to the buld tree. :file:`master/chroot_scripts/kx_open.stp` is compiled into :file:`/lib/modules/KERNELVERSION/systemtap/kx_open.ko`.


Bootstrap vs. Linux modules
###########################

When building :program:`KaarPux` with :command:`KX_SYSTEMTAP="yes"`,
the running Linux kernel version and release must match
the Linux kernel version and release used to build the modules in :file:`/lib/modules/KERNELVERSION`.
This is ensured "automagically" when using a :program:`KaarPux` system as host.

You can get the linux release with :command:`uname -r`,
returning something like ``3.2.9-kx-4eefd8aa``,
which also designates the subdirectory of :file:`/lib/modules/`
used for kernel mdules.

You can get the linux version with :command:`uname -v`,
returning something like ``#3 SMP Wed Jun 20 22:00:00 CEST 2012``,

During bootstrap, we use the :file:`/lib/modules/KERNELVERSION`
on the host system (which should be consistent on a :program:`KaarPux` host).
During linux/opt, whe use the :file:`/lib/modules/KERNELVERSION`
build during bootstrap (hence also consistent).


Pre-processing the Package Dependency Tracking Information
##########################################################

Run the command :command:`kaarpux/tools/kx_flist.pl`.
This command will:

#. Process all the
   :file:`kaarpux/flist/*.rw` files
   to create maps in the
   :file:`kaarpux/dependencies` directory.

#. Process libraries and executables with
   :command:`ldd`
   to create maps in the
   :file:`kaarpux/dependencies` directory.

:command:`kaarpux/tools/kx_flist.pl`
includes some woodoo to handle files which are written by many packages,
such as logfiles and databases.


Using the Package Dependency Tracking Information
#################################################

Now dependencies can be viewed with :command:`kaarpux/tools/kx_dependencies.pl`.
For options see:
kaarpux/tools/kx_dependencies.pl --man

Since there are more than 600 packages with more than 25.000 dependencies,
the output of :command:`kaarpux/tools/kx_dependencies.pl`
may be incomprehensible.

However, :command:`kaarpux/tools/kx_dependencies.pl`
includes the option ``--merge-file``.
Using this option, you can specify file(s) with merge information.
See:
kaarpux/tools/kx_dependencies.pl --man
For example, to show all packages under ``xorg-apps``
as just one item called ``xorg-apps``,
you may specify:

- xorg-apps
- xclock
- xwud
- xfd
- xfontsel
- xeyes
- twm

To create a customized ``--merge-file`` file you may start out with::

   {
   sed -n -e'/- bootstrap_4:/,$p' master/master.yaml |
   sed
   -e's/#.*//'
   -e's/  - //'
   -e's/pkg: //'
   -e's/sudo: //'
   -e's/parallel://'
   -e's/://'
   -e's/- .*//'
   -e'/^ \\+sh /d'
   -e's/script \\+//'
   -e's/perl_module \\+/PERLMODULE_/'
   -e'/^\\s*$/d'
   ;
   for f in $(grep -l 'xorg:' master/packages/x/\*.yaml); do
   basename -s.yaml "$f"
   grep -E '^\\s*[\\.P1]\\s*[0-9a-z]{32,64} +' $f |
   sed -e 's/^\\s*[.P1]\\s*[0-9a-z]\\+ \\+\\(\[-a-zA-Z0-9.]\\+\\)-\[0-9.]*\\.tar.*$/  \\1/' ;
   done
   }

and edit the output as required.
