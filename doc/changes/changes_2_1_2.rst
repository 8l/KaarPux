.. 
   KaarPux: http://kaarpux.kaarposoft.dk
   Copyright (C) 2015: Henrik Kaare Poulsen
   License: http://kaarpux.kaarposoft.dk/license.html

.. _changes_2_1_2:


================================
Changes in KaarPux version 2.1.2
================================


:program:`KaarPux` version ``2.1.2`` released on ``2012-09-04``

Upstream security-updates for ``icedtea`` / ``Java``.


SECURITY: icedtea: v 2.3.2
##########################

(Commit `024b1122 <http://sourceforge.net/p/kaarpux/code/ci/024b112225fafbd9a65300c8d945fd0256bd0a43/>`_)

Java security releases:
`[SECURITY] IcedTea 2.3.2 Released! <http://blog.fuseyism.com/index.php/2012/08/31/security-icedtea6-1-10-9-1-11-4-icedtea-2-3-2-released/>`_

Fixes:

- `CVE-2012-1682: XMLDecoder security issue via ClassFinder <http://www.cve.mitre.org/cgi-bin/cvename.cgi?name=2012-1682>`_

- `CVE-2012-0547: Simplify toolkit internals references <http://www.cve.mitre.org/cgi-bin/cvename.cgi?name=2012-0547>`_

- `CVE-2012-3136: Improve long term persistence of java.beans objects <http://www.cve.mitre.org/cgi-bin/cvename.cgi?name=2012-3136>`_


Minor Changes
#############

- UPD: noscript: v 2.5.3: bug fixes and improvements
  (Commit `3394522f <http://sourceforge.net/p/kaarpux/code/ci/3394522fb0afd1edbd736c1bdbf6b2939b3fd658/>`_)

- UPD: dhcpcd: v 5.6.2: minor improvements
  (Commit `ca8723d8 <http://sourceforge.net/p/kaarpux/code/ci/ca8723d89a567d9faf3f53e4b796443e16e09316/>`_)

- FIX: bluez: create /etc/systemd/system/bluetooth.target.wants dir
  (Commit `80956b68 <http://sourceforge.net/p/kaarpux/code/ci/80956b6811a9e6f402e931201ba784b83535b96e/>`_)


Upgrade instructions
####################

The security fixes can be applied to :program:`KaarPux` version ``2.1.0`` or ``2.1.1`` system::

	rm -rf /opt/kaarpux/icedtea*
	linux/scripts/opt/icedtea_BUILD.sh
	linux/scripts/opt/icedtea_INSTALL.sh
	linux/scripts/opt/icedtea-web_BUILD.sh
	linux/scripts/opt/icedtea-web_INSTALL.sh
	master/tools/kx_opt.pl
