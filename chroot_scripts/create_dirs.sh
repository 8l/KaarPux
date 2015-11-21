#!/bin/sh
#
# KaarPux: http://kaarpux.kaarposoft.dk
#
# Copyright (C) 2012: Henrik Kaare Poulsen
#
# License: http://kaarpux.kaarposoft.dk/license.html
#

set -o nounset
set -o errexit

KX_BASE="$(cd $(dirname "$0")/..; pwd -P)"
. "${KX_BASE}/shinc/bootstrap.shinc"
kx_ensure_chroot

kx_step_echo "Creating Directories"

install -dv -m 0755 /boot
install -dv -m 0755 /etc
install -dv -m 0755 /etc/profile.d
install -dv -m 0755 /home
install -dv -m 0755 /local
install -dv -m 0755 /mnt
install -dv -m 0755 /opt
install -dv -m 0755 /media/floppy
install -dv -m 0755 /media/cdrom

install -dv -m 0750 /root
install -dv -m 1777 /tmp /var/tmp

install -dv -m 0755 /var/cache
install -dv -m 0755 /var/lib/man
install -dv -m 0755 /var/lib/misc
install -dv -m 0755 /var/lib/locate
install -dv -m 0755 /var/local
install -dv -m 0755 /var/log
install -dv -m 0755 /var/mail
install -dv -m 0755 /var/spool

install -dv -m 0755 /run
ln -svnf /run /var/run
ln -svnf /run/lock /var/lock

ln -svnf .. /usr

mk_subdirs () {
	local F=$1
	install -dv -m 0755 $F/bin
	install -dv -m 0755 $F/etc
	install -dv -m 0755 $F/include
	install -dv -m 0755 $F/lib
	install -dv -m 0755 $F/libexec
	install -dv -m 0755 $F/share/doc
	install -dv -m 0755 $F/share/docs
	install -dv -m 0755 $F/share/info
	install -dv -m 0755 $F/share/locale
	install -dv -m 0755 $F/share/man
	install -dv -m 0755 $F/share/man/man1
	install -dv -m 0755 $F/share/man/man2
	install -dv -m 0755 $F/share/man/man3
	install -dv -m 0755 $F/share/man/man4
	install -dv -m 0755 $F/share/man/man5
	install -dv -m 0755 $F/share/man/man6
	install -dv -m 0755 $F/share/man/man7
	install -dv -m 0755 $F/share/man/man8
	install -dv -m 0755 $F/share/misc
	install -dv -m 0755 $F/share/terminfo
	install -dv -m 0755 $F/share/zoneinfo
	chown -R man:man $F/share/man
	ln -svnf $F/bin $F/sbin
	ln -svnf $F/share/man $F/man
	ln -svnf $F/share/doc $F/doc
	ln -svnf $F/share/docs $F/docs
	ln -svnf $F/share/info $F/info
	install -dv -m 0755 $F/var
	}

mk_subdirs ""
mk_subdirs /local
mk_subdirs /opt

chown -R ${KX_KX_UID}:${KX_KX_GID} /opt

case $(uname -m) in
 x86_64) ln -sv /lib /lib64 && ln -sv /usr/local/lib /usr/local/lib64 ;;
esac


# Some programs use hard-wired paths to programs which do not exist yet.
# In order to satisfy these programs, create a number of symbolic links
#  which will be replaced by real files throughout the course of this chapter after the software has been installed:

ln -svf /tools/bin/dash /bin/sh
ln -svf /tools/bin/cat  /bin
ln -svf /tools/bin/echo /bin
ln -svf /tools/bin/pwd  /bin
ln -svf /tools/bin/stty /bin
ln -svf /tools/bin/perl /usr/bin
ln -svf /tools/lib/libgcc_s.so    /usr/lib
ln -svf /tools/lib/libgcc_s.so.1  /usr/lib
ln -svf /tools/lib/libstdc++.so   /usr/lib
ln -svf /tools/lib/libstdc++.so.6 /usr/lib
ln -svf /tools/lib/libstdc++.a    /usr/lib
sed 's/tools/usr/' /tools/lib/libstdc++.la > /usr/lib/libstdc++.la

# A proper Linux system maintains a list of the mounted file systems in the file /etc/mtab.
# Normally, this file would be created when we mount a new file system.
# Since we will not be mounting any file systems inside our chroot environment, create an empty file for utilities that expect the presence of /etc/mtab:

touch /etc/mtab

# The login, agetty, and init programs (and others) use a number of log files to record information such as who was logged into the system and when.
# However, these programs will not write to the log files if they do not already exist. Initialize the log files and give them proper permissions:

touch /var/run/utmp
touch /var/log/btmp
touch /var/log/lastlog
touch /var/log/wtmp
chgrp -v utmp /var/run/utmp /var/log/lastlog
chmod -v 664 /var/run/utmp /var/log/lastlog

# Dummy hosts file
echo "127.0.0.1 localhost" > /etc/hosts

