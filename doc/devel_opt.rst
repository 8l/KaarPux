.. 
   KaarPux: http://kaarpux.kaarposoft.dk
   Copyright (C) 2015: Henrik Kaare Poulsen
   License: http://kaarpux.kaarposoft.dk/license.html

.. _devel_opt:


====================================
Developing / Debugging the OPT phase
====================================

In order to install a new package in :file:`/opt`:

#. Build the new package with :command:`linux/srcipts/opt/xxx_BUILD.sh`

#. Move the old package away from :file:`/opt/kaarpux/xxx`,
   e.g. into :file:`/opt/XXX`,
   or delete :file:`/opt/kaarpux/xxx` altogether.

#. Install the new package with :command:`linux/srcipts/opt/xxx_INSTALL.sh`

#. Run :command:`master/tools/kx_opt.sh`
   This will make ``soft-links``
   into
   :file:`/opt/bin`,
   :file:`/opt/include`,
   :file:`/opt/lib`,
   etc.

