.. 
   KaarPux: http://kaarpux.kaarposoft.dk
   Copyright (C) 2015: Henrik Kaare Poulsen
   License: http://kaarpux.kaarposoft.dk/license.html

.. _changes_3_0_0:


================================
Changes in KaarPux version 3.0.0
================================

:program:`KaarPux` version ``3.0.0`` released on ``2012-09-05``

Merge :file:`/` and :file:`/usr` filesystems.


MAJOR: KaarPux: Merge / and /usr
################################

(Commit `8d16d8d3 <http://sourceforge.net/p/kaarpux/code/ci/8d16d8d359ee6f59f4cd19bf157db040d3d11aac/>`_,
Commit `abf9064f <http://sourceforge.net/p/kaarpux/code/ci/abf9064f9cd0605136fc26bcd1b02f91784c4b0f/>`_)

The main changes are:

- Install everything in the :file:`/` (root) file system

- Make :file:`/usr` a link to :file:`/` (to satisfy historical dependencies)

This means:

- Put :file:`/` and :file:`/usr` on the same partition

- If you want split partions, mount :file:`/` read-only, and :file:`/etc`,  :file:`/tmp`, :file:`/var`
  read-write

Why? because:

Linux has traditionally split files needed to boot a basic system
into :file:`/` and files needed to boot the complete system into :file:`/usr`.

However, the reasons for this split dates back to 1970 disks: see `Understanding the bin, sbin, usr/bin , usr/sbin split <http://lists.busybox.net/pipermail/busybox/2010-December/074114.html>`_

With todays disks - and initramfs - the distinction does not make much sense.

In fact, trying to stay compliant with the `Filesystem Hierarchy Standard <http://www.pathname.com/fhs/>`_
is a real pain when installing a Linux distro.

Also:

The reasons for the :file:`/bin` vs :file:`/sbin` split are similar,
so we install all binaries into :file:`/bin`
and just symlink :file:`/sbin` to :file:`/bin` (to satisfy historical dependencies).

Background:

- `Free Desktop: The Case for the /usr Merge <http://www.freedesktop.org/wiki/Software/systemd/TheCaseForTheUsrMerge>`_

- `Fedora: Features/UsrMove <https://fedoraproject.org/wiki/Features/UsrMove>`_

- `Lennart Poettering: The Case for the /usr Merge <http://0pointer.de/blog/projects/the-usr-merge.html>`_


Other changes
#############

- UPD: provider_for_google_calendar: v 0.16
  (Commit `f056464a <http://sourceforge.net/p/kaarpux/code/ci/f056464a4ae3800a521fb95c61c281107475b635/>`_)

- Many updates to version checks.

- Many documentation updates.

- Other minor changes.
