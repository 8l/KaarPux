.. 
   KaarPux: http://kaarpux.kaarposoft.dk
   Copyright (C) 2015: Henrik Kaare Poulsen
   License: http://kaarpux.kaarposoft.dk/license.html

.. _master_directory:


============================
The kaarpux/master directory
============================


The :file:`kaarpux/master` directory contains all the files
needed to build :program:`KaarPux` (except the source tar-balls for each package).

Files
=====

:file:`kaarpux/master/default_definitions.shinc`
    Shell include script containing definitions for building :program:`KaarPux`.
    Do *not* edit this file.
    Override the settings by editing
    :file:`kaarpux/custom_definitions.shinc` instead.

:file:`kaarpux/master/make_dist.sh`
    Archive the :file:`kaarpux/master` files
    into
    :file:`kaarpux/dist/kaarpux.tar.gz`.
    The archive file can be copied to (e.g. using :command:`ssh`) the target system and unpacked there.

:file:`kaarpux/master/make_doc.sh`
    Make documentation. Processes :file:`kaarpux/master/doc`
    and produces :file:`kaarpux/doc`

:file:`kaarpux/master/make_kxbuild_user.sh`
    Create a new unix user called kxbuild.
    The user is configured so it can correctly bootstrap :program:`KaarPux`.

:file:`kaarpux/master/make_scripts.sh`
    Create and populate
    :file:`kaarpux/bootstrap`
    and
    :file:`kaarpux/linux`.

:file:`kaarpux/master/master.yaml`
    Defines the whole build sequence.
    Processed by :file:`kaarpux/master/perl/make_build_scripts.pl`,
    which may be consulted to see what each `YAML <http://yaml.org/>`_
    node does.

Directories
===========

:file:`kaarpux/master/chroot_scripts`
    Scripts which are used in the :program:`chroot` during bootstrap.
    Copied to :file:`kaarpux/bootstrap/chroot_scripts`
    by :file:`kaarpux/master/make_scripts.sh`.

:file:`kaarpux/master/doc`
    Source files for :program:`KaarPux` :program:`DocBook` documentation.

:file:`kaarpux/master/files`
    Files which are copied to the target system by
    :file:`kaarpux/bootstrap/chroot_scripts/install_files.sh`.
    Some of the files will be preprocessed by :program:`sed`
    to replace occurances of the form ``@KX_*@`` with
    the definitions from :file:`kaarpux/master/default_definitions.shinc`
    and :file:`kaarpux/custom_definitions.shinc`.

:file:`kaarpux/master/host_files`
    Files which are useful when referenced from the host system.

:file:`kaarpux/master/host_scripts`
    Scripts which are used on the host system during bootstrap.
    Copied to :file:`kaarpux/bootstrap/host_scripts`
    by :file:`kaarpux/master/make_scripts.sh`.

:file:`kaarpux/master/linux_scripts`
    Scripts which are used when building on the :program:`KaarPux` target system.
    Copied to :file:`kaarpux/linux/linux_scripts`
    by :file:`kaarpux/master/make_scripts.sh`.

:file:`kaarpux/master/packages`
    Has one subdirectory per letter in the alphabet.
    Each subdirectory contains the packages starting with that letter.
    :file:`kaarpux/master/packages/[a-z]/*.yaml`
    contains the definitions needed to build the package;
    :file:`kaarpux/master/packages/[a-z]/*.files`
    contains any needed auxilliary files, such as patches or init scripts.

:file:`kaarpux/master/perl`
    `perl <http://www.perl.org/>`_ scripts used by
    :file:`kaarpux/master/make_scripts.sh`.

:file:`kaarpux/master/shinc`
    Files included by shell scripts.

:file:`kaarpux/master/tools`
    Stand-alone tools.


