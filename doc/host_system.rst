.. 
   KaarPux: http://kaarpux.kaarposoft.dk
   Copyright (C) 2015: Henrik Kaare Poulsen
   License: http://kaarpux.kaarposoft.dk/license.html

.. _host_system:


=====================================
Install required packages on the host
=====================================


The initial version of :program:`KaarPux` is build using a *host system*.
The *host system* is used to build a basic tool-chain used to bootstrap :program:`KaarPux`.

Building :program:`KaarPux` should work on ``x86_64`` (64-bit) AMD/Intel platforms.

Any recent mainstream Linux distribution should be usable on the *host system*.

Certain packages and package versions are needed on the *host system* to build :program:`KaarPux`:

- The packages listed in `Linux From Scratch: Host System Requirements <http://www.linuxfromscratch.org/lfs/view/development/prologue/hostreqs.html>`_

- The perl module :program:`YAML::Tiny`
  (`YAML::Tiny homepage <http://search.cpan.org/dist/YAML-Tiny/lib/YAML/Tiny.pm>`_)

- The :program:`GNU parallel` application
  (`GNU parallel homepage <http://www.gnu.org/software/parallel/>`_)
  at least version 20130822

To install the required packages on your *host system*, you can try to run::

    master/bin/kx_pkgs4bootstrap

If this does not work, please install the packages mentioned above manually.

.. important:: Some distributions ship with :program:`mawk`,
   which cannot be used to build :program:`KaarPux`.
   Make sure you have :program:`gawk` installed::

      awk -W version | head -1

