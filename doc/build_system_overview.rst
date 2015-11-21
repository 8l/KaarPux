.. 
   KaarPux: http://kaarpux.kaarposoft.dk
   Copyright (C) 2015: Henrik Kaare Poulsen
   License: http://kaarpux.kaarposoft.dk/license.html

.. _build_system_overview:

====================================
Overview of the KaarPux Build System
====================================


The principle behind the :program:`KaarPux` build system is, that the build process itself,
as well as the build instructions for each package is defined using `YAML <http://yaml.org/>`_.

The complete build process is defined in :file:`kaarpux/master/master.yaml`.
The build instructions for each package are defined in :file:`kaarpux/master/packages/[a-z]/*.yaml`.

When you invoke :command:`kaarpux/master/make_scripts.sh`,
those `YAML <http://yaml.org/>`_ files are processed by `perl <http://www.perl.org/>`_ scripts in :file:`kaarpux/master/perl`
to create the directories :file:`kaarpux/bootstrap`
and :file:`kaarpux/linux`,
and populate those directories with files needed for the build -
in particular a lot of `shell scripts <http://www.gnu.org/software/bash/>`_.

