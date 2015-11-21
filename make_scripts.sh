#!/bin/sh
#
# KaarPux: http://kaarpux.kaarposoft.dk
#
# Copyright (C) 2012-2013: Henrik Kaare Poulsen
#
# License: http://kaarpux.kaarposoft.dk/license.html
#

# ============================================================
# Make all the scripts necessary to build KaarPux
# ============================================================


set -o nounset
set -o errexit

KX_BASE="$(cd "$(dirname "$0")"; pwd -P)"
. "${KX_BASE}/shinc/bootstrap.shinc"
kx_ensure_runas_nonroot

KX_TOP="$(cd "${KX_BASE}"/..; pwd -P)"
KX_BS="${KX_TOP}/bootstrap/"
KX_LINUX="${KX_TOP}/linux/"

DEBUG=""
#DEBUG=1

# ============================================================
# GIT
# ============================================================

kx_echo "Describing git version"
kx_git_describe || echo "We do not seem to be in a git repo"


# ============================================================
# FLIST
# ============================================================

kx_echo "Create file list directory"
mkdir -p "${KX_TOP}/flist"


# ============================================================
# BOOTSTRAP
# ============================================================

remove_and_remake_bootstrap_dir () {
	local DIR="$1"
	local PTH="${KX_BS}/${DIR}"
	test -z "${DEBUG}" || kx_echo "remove_and_remake [${PTH}]"
	rm -rf "${PTH}"
	mkdir "${PTH}"
}


# ============================================================

kx_echo "Remove and remake bootstrap directories"

mkdir -p "${KX_BS}"
remove_and_remake_bootstrap_dir "tmp"
remove_and_remake_bootstrap_dir "scripts"
remove_and_remake_bootstrap_dir "host_scripts"
remove_and_remake_bootstrap_dir "host_files"
remove_and_remake_bootstrap_dir "shinc"
remove_and_remake_bootstrap_dir "perl"
remove_and_remake_bootstrap_dir "chroot_scripts"
#remove_and_remake_bootstrap_dir "linux_scripts"
#remove_and_remake_bootstrap_dir "opt_scripts"

mkdir -p "${KX_BS}/host_scripts/bootstrap_1"
mkdir -p "${KX_BS}/host_scripts/bootstrap_2"
mkdir -p "${KX_BS}/host_scripts/bootstrap_3"
mkdir -p "${KX_BS}/chroot_scripts/bootstrap_4"
mkdir -p "${KX_BS}/chroot_scripts/bootstrap_5"
mkdir -p "${KX_BS}/chroot_scripts/bootstrap_6"
mkdir -p "${KX_BS}/chroot_scripts/bootstrap_7"
mkdir -p "${KX_BS}/chroot_scripts/bootstrap_8"

mkdir -p "${KX_BS}/log"
mkdir -p "${KX_BS}/log/bootstrap_1"
mkdir -p "${KX_BS}/log/bootstrap_2"
mkdir -p "${KX_BS}/log/bootstrap_3"
mkdir -p "${KX_BS}/log/bootstrap_4"
mkdir -p "${KX_BS}/log/bootstrap_5"
mkdir -p "${KX_BS}/log/bootstrap_6"
mkdir -p "${KX_BS}/log/bootstrap_7"
mkdir -p "${KX_BS}/log/bootstrap_8"

mkdir -p "${KX_BS}/build"
mkdir -p "${KX_BS}/build/bootstrap_1"
mkdir -p "${KX_BS}/build/bootstrap_2"
mkdir -p "${KX_BS}/build/bootstrap_3"
mkdir -p "${KX_BS}/build/bootstrap_4"
mkdir -p "${KX_BS}/build/bootstrap_5"
mkdir -p "${KX_BS}/build/bootstrap_6"
mkdir -p "${KX_BS}/build/bootstrap_7"
mkdir -p "${KX_BS}/build/bootstrap_8"


# ============================================================
# ============================================================

copy_bootstrap_file () {
	local FILE="${1}"
	local FROM="${KX_TOP}/master/${FILE}"
	local TO="${KX_TOP}/bootstrap/${FILE}"
	test -z "${DEBUG}" || kx_echo "Copying to [${TO}]"
	cp "${FROM}" "${TO}"
	}


# ============================================================

kx_echo "Copying files"

copy_bootstrap_file "shinc/definitions.shinc"
copy_bootstrap_file "shinc/common_functions.shinc"
copy_bootstrap_file "shinc/bootstrap_functions.shinc"
copy_bootstrap_file "shinc/bootstrap.shinc"
copy_bootstrap_file "shinc/uid_gid.shinc"

copy_bootstrap_file "host_scripts/verify_host.sh"
copy_bootstrap_file "host_scripts/prepare_bootstrap.sh"
copy_bootstrap_file "host_scripts/check_bootstrap_1.sh"
copy_bootstrap_file "host_scripts/check_bootstrap_2.sh"
copy_bootstrap_file "host_scripts/prepare_chroot.sh"
copy_bootstrap_file "host_scripts/mount_virtual_kernel_fs.sh"
copy_bootstrap_file "host_scripts/umount_virtual_kernel_fs.sh"
copy_bootstrap_file "host_scripts/enter_tools_chroot.sh"
copy_bootstrap_file "host_scripts/enter_chroot.sh"

copy_bootstrap_file "chroot_scripts/create_dirs.sh"
copy_bootstrap_file "chroot_scripts/postconfigure_bootstrap_4.sh"
copy_bootstrap_file "chroot_scripts/adjust_bootstrap_4.sh"
copy_bootstrap_file "chroot_scripts/check_bootstrap_4.sh"
copy_bootstrap_file "chroot_scripts/check_bootstrap_5.sh"
copy_bootstrap_file "chroot_scripts/install_files.sh"
copy_bootstrap_file "chroot_scripts/install_kaarpux.sh"
copy_bootstrap_file "chroot_scripts/kx_open.stp"
copy_bootstrap_file "chroot_scripts/install_kx_open_stp.sh"
copy_bootstrap_file "chroot_scripts/install_pam_files.sh"
copy_bootstrap_file "chroot_scripts/update_mandb.sh"


# ============================================================
# LINUX
# ============================================================

remove_and_remake_linux_dir () {
	local DIR="$1"
	local PTH="${KX_LINUX}/${DIR}"
	test -z "${DEBUG}" || kx_echo "remove_and_remake [${PTH}]"
	rm -rf "${PTH}"
	mkdir "${PTH}"
}


# ============================================================

kx_echo "Remove and remake Linux directories"

mkdir -p "${KX_LINUX}"
remove_and_remake_linux_dir "tmp"
remove_and_remake_linux_dir "scripts"
remove_and_remake_linux_dir "scripts/linux"
remove_and_remake_linux_dir "scripts/opt"
remove_and_remake_linux_dir "linux_scripts"
remove_and_remake_linux_dir "shinc"
remove_and_remake_linux_dir "perl"
remove_and_remake_linux_dir "plinc"

mkdir -p "${KX_LINUX}/log"
mkdir -p "${KX_LINUX}/log/linux"
mkdir -p "${KX_LINUX}/log/opt"

mkdir -p "${KX_LINUX}/build"
mkdir -p "${KX_LINUX}/build/linux"
mkdir -p "${KX_LINUX}/build/opt"


# ============================================================
# ============================================================

copy_linux_file () {
	local FILE="${1}"
	local FROM="${KX_TOP}/master/${FILE}"
	local TO="${KX_TOP}/linux/${FILE}"
	test -z "${DEBUG}" || kx_echo "Copying to [${TO}]"
	cp "${FROM}" "${TO}"
	}


# ============================================================

kx_echo "Copying files"

copy_linux_file "shinc/definitions.shinc"
copy_linux_file "shinc/common_functions.shinc"
copy_linux_file "shinc/linux_functions.shinc"
copy_linux_file "shinc/linux.shinc"
copy_linux_file "shinc/uid_gid.shinc"

copy_linux_file "linux_scripts/linux_boot.sh"
copy_linux_file "linux_scripts/update-desktop-database.sh"
copy_linux_file "linux_scripts/update-desktop-database_opt.sh"
copy_linux_file "linux_scripts/update_mandb.sh"
copy_linux_file "linux_scripts/update_mandb_opt.sh"

cp -p "${KX_TOP}/master/linux_scripts/download_packages_2.sh" "${KX_TOP}/linux"

# ============================================================
# VERIFICATION
# ============================================================

kx_echo "Verification directories"

rm -rf "${KX_TOP}/verify/"
mkdir -p "${KX_TOP}/verify/"
cp -rp "${KX_TOP}/master/verify/"* "${KX_TOP}/verify"

# ============================================================
# PACKAGES
# ============================================================

kx_echo "Preparing bootstrap scripts"
/usr/bin/perl "${KX_BASE}/perl/make_build_scripts.pl" "${KX_TOP}" "bootstrap"

kx_echo "Preparing linux scripts"
/usr/bin/perl "${KX_BASE}/perl/make_build_scripts.pl" "${KX_TOP}" "linux"

kx_echo "Preparing package definitions"
/usr/bin/perl "${KX_BASE}/perl/make_package_scripts.pl" "${KX_TOP}"


# ============================================================
# DONE
# ============================================================

kx_echo "Scripts created"

