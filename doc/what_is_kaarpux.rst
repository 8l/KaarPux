.. 
   KaarPux: http://kaarpux.kaarposoft.dk
   Copyright (C) 2015: Henrik Kaare Poulsen
   License: http://kaarpux.kaarposoft.dk/license.html

.. _what_is_kaarpux:

================
What is KaarPux?
================

:program:`KaarPux` is a Linux distribution, where everything is build (automatically) from source.
See e.g. :ref:`building_overview`

:program:`KaarPux` is aimed at developers who want to build and explore a Linux distribution,
where they have complete control over the build process.

:program:`KaarPux` features:

- `Linux 3 kernel <http://kernel.org/>`_

- `GNU build system and tools; gcc compiler <http://www.gnu.org/>`_

- `X.Org X11 server <http://x.org/>`_

- `GNOME 3 desktop environment <http://www.gnome.org/gnome-3/>`_

- Mozilla
  `Firefox Web Browser <https://www.mozilla.org/firefox>`_
  and
  `Thunderbird Mail <https://www.mozilla.org/thunderbird/>`_

- Java
  `OpenJDK <http://openjdk.java.net/>`_

- `Libre Office personal productivity suite <http://www.libreoffice.org/>`_

- And `600 other software packages <packages/index.html>`_

The bootstrap part of :program:`KaarPux` is based on `Linux From Scratch <http://www.linuxfromscratch.org/>`_,
but fully automated.

Known limitations:

- :program:`KaarPux` is not (yet) a multilib system, so
  :program:`xen` and :program:`skype`
  will not build on a ``x86_64`` (64-bit) platform.
