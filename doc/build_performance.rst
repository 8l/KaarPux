.. 
   KaarPux: http://kaarpux.kaarposoft.dk
   Copyright (C) 2015: Henrik Kaare Poulsen
   License: http://kaarpux.kaarposoft.dk/license.html

.. _build_performance:

===========================
Analyzing Build Performance
===========================


Collecting System Statistics
############################

During build, :program:`KaarPux` is running :program:`sysstat`
(see `SYSSTAT <http://sebastien.godard.pagesperso-orange.fr/>`_
and :ref:`pkg_sysstat`) in the background.
This creates the files

- :file:`boostrap/log/bootstrap.sar`

- :file:`linux/log/*.sar`


Analyzing System Statistics
###########################

The files created by :program:`sysstat`
can be analyzed with:command:`kaarpux/tools/kx_sar.pl`.

:command:`kaarpux/tools/kx_sar.pl` can be called with the following parameters:

*-s*
    Show summary information.

*-p*
    Show percentiles for important figures.

*-d*
    Show information on disk usage.

*-g*
    Create graphs with system statistics.

The statistics summary for all phases can be combined::

	T=$(mktemp -d)
	(cd bootstrap/log; ../../master/tools/kx_sar.sh -s bootstrap.sar > $T/bootstrap)
	SLIST="linux_base linux_xorg linux_gnome_pre linux_gnome linux_gnome_post \\
	opt_desktop opt_libreoffice opt_programming opt_coins opt_closed_source"
	(cd linux/log; for S in $SLIST; do ../../master/tools/kx_sar.sh -s $S.sar | cut -f3 > $T/$S; done)
	(cd $T; paste bootstrap $SLIST)
