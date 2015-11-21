#!/bin/sh
#
# KaarPux: http://kaarpux.kaarposoft.dk
#
# Copyright (C) 2012-2014: Henrik Kaare Poulsen
#
# License: http://kaarpux.kaarposoft.dk/license.html
#

set -o nounset
set -o errexit

KX_BASE="$(cd $(dirname "$0")/..; pwd -P)"
. "${KX_BASE}/shinc/bootstrap.shinc"
kx_ensure_chroot

FROMDIR="${KX_BASE}/../master/files"
TODIR=""
SYSCONFIG=/etc/sysconfig
SYSTEMD=/etc/systemd

install_file () {
	local F=$1
	echo "Installing ${TODIR}${F}"
	install -m 644 ${FROMDIR}${F} ${TODIR}${F}
	}

install_file_x () {
	local F=$1
	echo "Installing ${TODIR}${F}"
	install -m 755 ${FROMDIR}${F} ${TODIR}${F}
	}

sed_file () {
	local F=$1
	local CMD="sed -i "
	shift
	for VAR in $@; do
		eval "VAL=\${${VAR}}"
		CMD="${CMD} -e \"s:@${VAR}@:${VAL}:\""
	done
	CMD="${CMD} ${TODIR}${F}"
	eval "${CMD}"
	}

install_and_sed_file () {
	install_file $1
	sed_file $@
	}

make_dirs () {
	for D in $@; do
		echo "Making directory ${TODIR}${D}"
		install -d -m 755 ${TODIR}${D}
	done
	}

make_symlink () {
	local RC=$1
	local SK=$2
	local F=$3
	ln -svf ${TODIR}${INIT_D}/${F} ${TODIR}${RC_D}/${RC}.d/${SK}${F}
	}


kx_step_echo "Installing etc files"

make_dirs "/etc/modprobe.d"
install_file "/etc/modprobe.d/blacklist.conf"
install_file "/etc/modprobe.d/usb.conf"
install_file "/etc/issue"
install_file_x /etc/bashrc
install_file_x /etc/profile
install_file_x /etc/profile.d/lang.sh
install_file_x /etc/profile.d/opt.sh
install_file_x /etc/profile.d/history.sh
make_dirs "/etc/bash_completion.d"

make_dirs "/etc/skel"
install_file "/etc/skel/.bashrc"
install_file "/etc/skel/.bash_profile"

install_file /etc/securetty
install_file /etc/crypttab
install_and_sed_file /etc/fstab KX_FSTAB_DEV_ROOT KX_FSTAB_FSTYPE_ROOT KX_FSTAB_DEV_SWAP

make_dirs "/etc/X11" "/etc/X11/xorg.conf.d"
install_and_sed_file "/etc/X11/xorg.conf.d/keyboard.conf" KX_XKB_LAYOUT

rm -r /etc/mtab
ln -svf /proc/mounts /etc/mtab

kx_step_echo "Installing systemd files"

make_dirs "${SYSTEMD}/system"

install_and_sed_file /etc/hostname KX_HOSTNAME
install_and_sed_file /etc/hosts KX_HOSTNAME
install_and_sed_file /etc/vconsole.conf KX_CONSOLE_KEYMAP
install_and_sed_file /etc/locale.conf KX_LANG
install_and_sed_file /etc/timezone KX_LOCALE
install_and_sed_file /etc/adjtime KX_UTC_OR_LOCAL

kx_step_echo "Installing system config files"
make_dirs "${SYSCONFIG}"
install_and_sed_file ${SYSCONFIG}/i18n KX_LANG

kx_step_echo "Installing empty init.d directory"

make_dirs /etc/rc.d/init.d
ln -svf rc.d/init.d /etc/init.d

kx_step_echo "Installing release files"
install_file "/etc/os-release"
install_file "/etc/lsb-release"

kx_step_echo "Installing home directory files"
make_dirs /root /home/kaarpux
cp -v /etc/skel/.bashrc /etc/skel/.bash_profile /root


