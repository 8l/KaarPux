.. 
   KaarPux: http://kaarpux.kaarposoft.dk
   Copyright (C) 2015: Henrik Kaare Poulsen
   License: http://kaarpux.kaarposoft.dk/license.html

.. _devel_bootstrapping:


====================================
Developing / Debugging the Bootstrap
====================================


If you want to develop the bootstrap process, or need to debug it,
you will need to enter the correct chroot:

bootstrap 1-3
    executed directly on the host system

bootstrap 4-7
    :command:`bootstrap/enter_tools_chroot.sh`

bootstrap 8
    :command:`bootstrap/enter_chroot.sh`


