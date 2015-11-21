.. 
   KaarPux: http://kaarpux.kaarposoft.dk
   Copyright (C) 2015: Henrik Kaare Poulsen
   License: http://kaarpux.kaarposoft.dk/license.html

.. _changes_2_1_1:


================================
Changes in KaarPux version 2.1.1
================================


:program:`KaarPux` version ``2.1.1`` released on ``2012-08-31``

Upstream security-updates for ``icedtea`` / ``Java``.


SECURITY: icedtea: v 2.3.1 to fix CVE-2012-4681
###############################################

(Commit `92c1d61a <http://sourceforge.net/p/kaarpux/code/ci/92c1d61a82f65fd41ecba7cc13a27b79016a8741/>`_)

Oracle Java 7 Update 6, and possibly other versions,
allows remote attackers to execute arbitrary code via a crafted applet,
as exploited in the wild in August 2012 using Gondzz.class and Gondvv.class.

See

- `[SECURITY] IcedTea 2.3.1 Released! <http://blog.fuseyism.com/index.php/2012/08/30/security-icedtea-2-3-1-released/>`_

- `CVE-2012-4681 from CVE database <http://cve.mitre.org/cgi-bin/cvename.cgi?name=2012-4681>`_

- `Oracle Security Alert for CVE-2012-4681 <http://www.oracle.com/technetwork/topics/security/alert-cve-2012-4681-1835715.html>`_


Upgrade instructions
####################

The security fix can be applied to a:program:`KaarPux` version ``2.1.0`` system::

	rm -rf /opt/kaarpux/icedtea*
	linux/scripts/opt/icedtea_BUILD.sh
	linux/scripts/opt/icedtea_INSTALL.sh
	linux/scripts/opt/icedtea-web_BUILD.sh
	linux/scripts/opt/icedtea-web_INSTALL.sh
	master/tools/kx_opt.pl
