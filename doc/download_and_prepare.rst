.. 
   KaarPux: http://kaarpux.kaarposoft.dk
   Copyright (C) 2015: Henrik Kaare Poulsen
   License: http://kaarpux.kaarposoft.dk/license.html

.. _download_and_prepare:


============================
Download and Prepare KaarPux
============================


Bleeding edge
#############

The source code for **KaarPux** may be browsed at `sourceforge.net/p/kaarpux/code/ref/master~/ <http://sourceforge.net/p/kaarpux/code/ref/master~/>`_.

This :program:`git` repository represents the *bleeding edge* of the :program:`KaarPux` development.

The :program:`git` repository may be cloned with::

   git clone git://git.code.sf.net/p/kaarpux/code kaarpux

.. note::
   When changes are made to :program:`KaarPux`
   they are usually first tested on top of an already installed :program:`KaarPux` system,
   and then commited to the :program:`git` repository.
   Such changes may break a complete build from scratch.
   However, it will help the :program:`KaarPux` development if you try out the *bleeding edge*
   and report any problems.


Stable version
##############

The latest stable version of :program:`KaarPux` may be downloaded as a `tarball <http://sourceforge.net/projects/kaarpux/files/latest/download?source=files>`_.

Earlier versions of :program:`KaarPux` may be found at `sourceforge.net/projects/kaarpux/files/ <http://sourceforge.net/projects/kaarpux/files/>`_.

Unpack the `tarball <http://sourceforge.net/projects/kaarpux/files/latest/download?source=files>`_
with::

   tar xzf kaarpux*.tar.gz


Change directory
################

Most examples in the following chapters assume that your
current working directory is :file:`kaarpux`, so::

   cd kaarpux


Build manual pages
##################

Manual pages can be build (if you have the required packages installed) with::

   master/bin/kx_make_man

The manual pages are also available online: :ref:`kaarpux_manual_pages`
