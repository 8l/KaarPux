.. 
   KaarPux: http://kaarpux.kaarposoft.dk
   Copyright (C) 2015: Henrik Kaare Poulsen
   License: http://kaarpux.kaarposoft.dk/license.html

.. _bootstrapping_phase:

=========================
The Bootstrapping Process
=========================


The purpose of the bootstrapping process is to use the host system
to build a Linux/GNU system we can boot into.

The bootstrapping process for :program:`KaarPux` is based on `Linux From Scratch <http://www.linuxfromscratch.org/>`_.
See in particular `LFS: Toolchain Technical Notes <http://www.linuxfromscratch.org/lfs/view/development/chapter05/toolchaintechnotes.html>`_.


Toolchain
#########

A toolchain is the set of tools needed to build an executable program from C source file(s).

The :program:`KaarPux` toolchain consists of

- gcc C compiler

- linker from binutils

- glibc (including linux headers)


chroot
######

A ``chroot`` changes the apparent root directory,
so we are running inside a jail, where the root is
bounded by the directory specified when entering the
``chroot``.

This is used to build :program:`KaarPux` on the host system.


Bootstrap steps
###############

Bootstrap step 1 and 2 use the host system to create a new toolchain.
This toolchain is found in the :file:`tools` directory,
which is linked as :file:`/tools` in both the host
environment and the chroot environment. Bootstrap step 3 to 7 use the :file:`/tools` toolchain.

Bootstrap step 3 uses the new toolchain to compile a number of utilities needed in the chroot.

Bootstrap step 4 compiles a new glibc (including linux headers) in a chroot,
using :file:`/tools`.

Bootstrap step 5 now compiles a new gcc after building a handfull of dependencies.

Bootstrap step 6 builds bash after building a handfull of dependencies.

With the new toolchain under dash, bootstrap step 7 now builds
a lot of useful GNU/Linux packages into the chroot.
After bootstrap step 7 we do not need the :file:`/tools`
anymore, as everything needed is now installed in the main chroot.

In the main chroot, bootstrap step 8 now builds the rest of the packages needed
to build the bootable GNU/Linux system, in particular the Linux kernel and grub.
