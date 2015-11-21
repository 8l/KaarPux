.. 
   KaarPux: http://kaarpux.kaarposoft.dk
   Copyright (C) 2015: Henrik Kaare Poulsen
   License: http://kaarpux.kaarposoft.dk/license.html

.. _system_time:


======================
System Time Adjustment
======================

The computers hardware clock stores the date and time in either UTC
or the local timezone. Unfortunately, there is no way for the software
to tell which!

When the :program:`Linux kernel` boots,
it assumes that the hardware clock is set in UTC.
However, :program:`systemd` later updates the
system (software) time according to the contents of the file :file:`/etc/adjtime`.

If your system (software) time is off by a number of hours
corresponding to your local timezone, try replacing *UTC* with *LOCAL* or vice versa.
This change should take effect after the next reboot.

When building :program:`KaarPux`, the third line in :file:`/etc/adjtime`
is filled with the value of ``KX_UTC_OR_LOCAL`` from :file:`kaarpux/master/default_definitions.shinc`
or :file:`kaarpux/custom_definitions.shinc`.

