.. 
   KaarPux: http://kaarpux.kaarposoft.dk
   Copyright (C) 2015: Henrik Kaare Poulsen
   License: http://kaarpux.kaarposoft.dk/license.html

.. _changes_3_2_1:


================================
Changes in KaarPux version 3.2.1
================================


:program:`KaarPux` version ``3.2.1`` released on ``2012-oct-21``

Security updates (Java), bug fixes, and package updates.


Security update - Java
######################

- SECURITY: icedtea: v 2.3.3
  (Commit `e77f77c3 <http://sourceforge.net/p/kaarpux/code/ci/e77f77c34585275ac2226c85794e58138830c842/>`_)


Bugs fixed
##########

- FIX: ntp: do not barf if /etc/systemd/ntp-units.d already exists
  (Commit `1fd10479 <http://sourceforge.net/p/kaarpux/code/ci/1fd104793283d3791e0ab38e51b6ae9a781bf3cb/>`_)

- FIX: gst-plugins-good fix build with recent kernels, the v4l2_buffer input field was removed
  (Commit `638aaa16 <http://sourceforge.net/p/kaarpux/code/ci/638aaa166ddb276c6f9e055a511b8b10cb1e5f8a/>`_)


Packages removed
################

- DEL: libelf: Not needed anymore (and we have elfutils)
  (Commit `10d09d4a <http://sourceforge.net/p/kaarpux/code/ci/10d09d4a8ae51234f50243f55588478d5068e2d8/>`_)


Packages updated
################

- UPD: net-tools: v 1.60.20120804git
  (Commit `cbc9651c <http://sourceforge.net/p/kaarpux/code/ci/cbc9651cac936115c2a09b4164ac2cd4a7a327cc/>`_)

- UPD: elfutils: v 0.155
  (Commit `fd128117 <http://sourceforge.net/p/kaarpux/code/ci/fd128117a632d670f063009a540b0c2bc4a4e382/>`_)

- UPD: samba: v 3.6.8
  (Commit `0cc05466 <http://sourceforge.net/p/kaarpux/code/ci/0cc054667b459dd7093fe589e9b7dcc2b57fde07/>`_)

- UPD: fuse: v 2.9.2
  (Commit `c3c5532f <http://sourceforge.net/p/kaarpux/code/ci/c3c5532f22a0ed91169269a39e4401bcc998429a/>`_)

- UPD: certdata: v 1.86
  (Commit `7d99d293 <http://sourceforge.net/p/kaarpux/code/ci/7d99d293838547c32feed9bd716383919a3f1845/>`_)


Documentation Changes
#####################

- DOC: cups_startup: put printer.target into multi-user.target.wants
  (Commit `8c601196 <http://sourceforge.net/p/kaarpux/code/ci/8c6011960f48d54019e4c68e9bec0d30efc64742/>`_)

- DOC: xen_virtualization: improved instructions for dhcpcd+bridge
  (Commit `ed34c067 <http://sourceforge.net/p/kaarpux/code/ci/ed34c06733e036457c48685dfaa9b210e846353d/>`_)

- DOC: xen_virtualization: better bridge.service file - start bridge before dhcpcd
  (Commit `753e4a88 <http://sourceforge.net/p/kaarpux/code/ci/753e4a88b93129d8acf68defbca31cf085a52c58/>`_)


