.. 
   KaarPux: http://kaarpux.kaarposoft.dk
   Copyright (C) 2015: Henrik Kaare Poulsen
   License: http://kaarpux.kaarposoft.dk/license.html

.. _changes_1_0_1:


================================
Changes in KaarPux version 1.0.1
================================

:program:`KaarPux` version ``1.0.1`` released on ``2012-08-19``

Includes upstream security-updates!


Security updates
################

UPD: skype: v. 4.0.0.8 - SECURITY UPDATE
========================================

See `Hotfix for multiple Skype clients <http://blogs.skype.com/garage/2012/07/hotfix_for_multiple_skype_clie.html/>`_

Skype client crashes during a Skype IM session, which may in some cases
result in the last IM entered or sent prior to the crash being delivered
to a different IM contact after the Skype client is rebooted or logged
in as a new user.

UPD: icedtea-web: v. 1.2.1 - SECURITY UPDATE
============================================

See `IcedTea-Web 1.1.6 and 1.2.1 \[security releases] released <http://dbhole.wordpress.com/2012/07/31/icedtea-web-1-1-6-and-1-2-1-security-releases-released/>`_

The security issues fixed are:

- RH840592, CVE-2012-3422: Use of uninitialized instance pointers

- RH841345, CVE-2012-3423: Incorrect handling of non 0-terminated strings

UPD: flash_player_11: v. 11.2.202.238 - SECURITY UPDATE
=======================================================

See `Security update available for Adobe Flash Player <http://www.adobe.com/support/security/bulletins/apsb12-18.html>`_

These updates address a vulnerability (CVE-2012-1535)
that could cause the application to crash
and potentially allow an attacker to take control of the affected system.


Other package updates
#####################

- UPD: pinentry: v. 0.8.2

- UPD: noscript: v. 2.5.1


Minor changes
#############

- IMPROVE: linux: add init= target to boot commandline in initramfs

- FIX: kmod: install pkgconfig file in /usr/lib/pkgconfig

- ADD: os-release: /etc/os-release

- MINOR: lsb-release: correct version number

- MINOR: common_functions: better kx_git_describe

- DOC: www: complete.xml: qt is build in opt_desktop

- DOC: www: correct git clone command

- DOC: www: improved download instructions

- Many minor improvements to documentation, in particular for installed packages.


Upgrade instructions
####################

The security fixes and package updates can be applied to a:program:`KaarPux` version ``1.0.0`` system
simply by removing the old packages and installing the new ones::

	rm -rf /opt/kaarpux/flash_player_11*
	rm -rf /opt/kaarpux/icedtea-web*
	rm -rf /opt/kaarpux/noscript*
	rm -rf /opt/kaarpux/pinentry*
	rm -rf /opt/kaarpux/skype*
	linux/scripts/opt/flash_player_11_BUILD.sh
	linux/scripts/opt/flash_player_11_INSTALL.sh
	linux/scripts/opt/icedtea-web_BUILD.sh
	linux/scripts/opt/icedtea-web_INSTALL.sh
	linux/scripts/opt/noscript_BUILD.sh
	linux/scripts/opt/noscript_INSTALL.sh
	linux/scripts/opt/pinentry_BUILD.sh
	linux/scripts/opt/pinentry_INSTALL.sh
	linux/scripts/opt/skype_BUILD.sh
	linux/scripts/opt/skype_INSTALL.sh
	master/tools/kx_opt.pl
