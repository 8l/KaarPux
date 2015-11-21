#!/bin/sh
#
# KaarPux: http://kaarpux.kaarposoft.dk
#
# Copyright (C) 2014-2015: Henrik Kaare Poulsen
#
# License: http://kaarpux.kaarposoft.dk/license.html
#

# ============================================================

set -o nounset
set -o errexit

KX_BASE="$(cd $(dirname "$0")/../..; pwd -P)"
. "$(cd "$(dirname "$0")"; pwd -P)/virtual.shinc"

VERBOSE=false

# ============================================================
# 	BUILD KAARPUX WITH QEMU KVM
# ============================================================

usage () {
	local S
	S=$(basename $0)
	cat << EOF >> /dev/stderr
usage:
	$S config|downloads|bootstrap|rest|launch <number>
EOF
}

# ============================================================
# 	DEFAULTS
# ============================================================

set_defaults () {
	test -n "${K_NUM:-}" || K_NUM=50
	test -n "${K_MAC:-}" || K_MAC=52:54:00:99:00:${K_NUM}
	test -n "${K_IP_BASE:-}" || K_IP_BASE=192.168.0
	test -n "${K_IP:-}" || K_IP=${K_IP_BASE}.${K_NUM}
	test -n "${K_KVM_CMD:-}" || K_KVM_CMD="qemu-system-x86_64"
	test -n "${K_KVM_OPT:-}" || K_KVM_OPT="-net bridge -smp 12 -m 48G -usb -device usb-audio -vga qxl -spice port=59${K_NUM},addr=127.0.0.1,disable-ticketing -cpu host -machine q35,accel=kvm"
	test -n "${K_HOST_IMG:-}" || K_HOST_IMG="/kvm/host_${K_NUM}.img"
	test -n "${K_DOWNLOADS_IMG:-}" || K_DOWNLOADS_IMG="/kvm/downloads_${K_NUM}.img"
	test -n "${K_KAARPUX_IMG:-}" || K_KAARPUX_IMG="/kvm/kx_${K_NUM}.img"
	test -n "${K_DRIVER:-}" || K_DRIVER=virtio
	test -n "${K_USER_ROOT:-}" || K_USER_ROOT=toor
	test -n "${K_USER_KX:-}" || K_USER_KX=kaarpux
	test -n "${K_PRIVKEY:-}" || K_PRIVKEY=~/.ssh/id_rsa
	test -n "${K_PUBKEY:-}" || K_PUBKEY="${K_PRIVKEY}.pub"
	test -n "${K_CONFIGURATION:-}" || K_CONFIGURATION="${KX_BASE}/kaarpux.conf"
}

# ============================================================

show_config () {
cat >> /dev/stderr << EOF 
Configuration:
	K_MAC		${K_MAC}
	K_IP_BASE	${K_IP_BASE}
	K_IP		${K_IP}
	K_KVM_CMD	${K_KVM_CMD}
	K_KVM_OPT	${K_KVM_OPT}
	K_HOST_IMG	${K_HOST_IMG}
	K_DOWNLOADS_IMG	${K_DOWNLOADS_IMG}
	K_KAARPUX_IMG	${K_KAARPUX_IMG}
	K_DRIVER	${K_DRIVER}
	K_USER_ROOT	${K_USER_ROOT}
	K_USER_KX	${K_USER_KX}
	K_PRIVKEY	${K_PRIVKEY}
	K_PUBKEY	${K_PUBKEY}
	K_TARBALL	${K_TARBALL:-none; use sourceforge}
	K_CONFIGURATION ${K_CONFIGURATION}
EOF
}

# ============================================================
# 	KVM
# ============================================================

wait_for_kvm_and_check () {
	dbg "wait for kvm"
	sleep 2

	I=0
	while true; do
		I=$((I + 1))
		ps -p $! || err "could not start kvm"
		ping -c1 -W$I ${K_IP} && break
		sleep 1
		dbg "still waiting for kvm [$I]"
	done
	dbg "kvm running, guest is pingable"

	dbg "remove ${K_IP} from known hosts"
	ssh-keygen -R ${K_IP} || true

	dbg "wait for ssh"
	sleep 2

	I=0
	while true; do
		I=$((I + 1))
		dbg "check ssh connectivity for ${K_USER_KX}"
		ssh -T -o "StrictHostKeyChecking=no" -i "${K_PRIVKEY}" ${K_USER_KX}@${K_IP} id && break
		sleep 1
		dbg "still waiting for ssh [$I]"
	done

	dbg "check ssh connectivity for ${K_USER_ROOT}"
	ssh -T -o "StrictHostKeyChecking=no" -i "${K_PRIVKEY}" ${K_USER_ROOT}@${K_IP} id
}

# ============================================================

check_no_ping () {
	dbg "check that ${K_IP} is not responding to ping"
	ping -c1 -W5 ${K_IP} && err "${K_IP} is responding to ping; another KVM running perhaps?"
	dbg OK
}

# ============================================================

kvm_poweroff () {
	dbg "poweroff"
	ssh -T -i "${K_PRIVKEY}" ${K_USER_ROOT}@${K_IP} <<-EOF || true
		set -x
		systemctl poweroff || poweroff
		EOF
}

# ============================================================
# 	DOWNLOADS
# ============================================================

do_downloads () {
	set_defaults
	show_config
	check_no_ping

	dbg "start kvm"
	${K_KVM_CMD} \
		-drive file=${K_HOST_IMG},if=${K_DRIVER} \
		-drive file=${K_DOWNLOADS_IMG},if=${K_DRIVER} \
		-net nic,macaddr=${K_MAC},model=virtio \
		${K_KVM_OPT} &
	wait_for_kvm_and_check

	download_downloads "${K_IP}" "${K_PRIVKEY}" "${K_TARBALL:-}" "/dev/vdb"

	kvm_poweroff
}

# ============================================================
# 	BOOTSTRAP
# ============================================================

do_bootstrap () {
	set_defaults
	show_config
	check_no_ping

	dbg "create KaarPux image"
	test -f ${K_KAARPUX_IMG} && err "${K_KAARPUX_IMG} exists; will not overwrite"
	qemu-img create -f raw ${K_KAARPUX_IMG} 32G

	dbg "start kvm"
	${K_KVM_CMD} \
		-drive file=${K_HOST_IMG},if=${K_DRIVER} \
		-drive file=${K_KAARPUX_IMG},if=${K_DRIVER},cache=unsafe \
		-drive file=${K_DOWNLOADS_IMG},if=${K_DRIVER} \
		-net nic,macaddr=${K_MAC},model=e1000 \
		${K_KVM_OPT} &
	wait_for_kvm_and_check

	bootstrap_phase "${K_IP}" "${K_PRIVKEY}" "${K_CONFIGURATION}" "${K_TARBALL:-}"

	kvm_poweroff
}

# ============================================================
# 	REST
# ============================================================

do_rest () {
	set_defaults
	show_config
	check_no_ping

	dbg "start kvm"
	${K_KVM_CMD} \
		-drive file=${K_KAARPUX_IMG},if=${K_DRIVER},cache=unsafe \
		-drive file=${K_DOWNLOADS_IMG},if=${K_DRIVER} \
		-net nic,macaddr=${K_MAC},model=virtio \
		${K_KVM_OPT} &
	wait_for_kvm_and_check

	linux_phase "${K_IP}" "${K_PRIVKEY}"

	kvm_poweroff
}

# ============================================================
# 	LAUNCH
# ============================================================

do_launch () {
	set_defaults
	show_config
	check_no_ping

	dbg "start kvm"
	${K_KVM_CMD} \
		-drive file=${K_KAARPUX_IMG},if=${K_DRIVER} \
		-drive file=${K_DOWNLOADS_IMG},if=${K_DRIVER} \
		-net nic,macaddr=${K_MAC},model=virtio \
		${K_KVM_OPT} &
	PID=$!
	wait_for_kvm_and_check
	dbg "kvm launched.  pid is ${PID}  guest IP address is ${K_IP}"
}

# ============================================================
# 	MAIN
# ============================================================

test $# -eq 2 || err_usage $(basename $0) must be called with exactly two arguments

# batch scheduling
chrt -a -b -p 0 $$

K_NUM=$2

case "$1" in
	config)
		set_defaults
		show_config
		;;
	downloads)
		do_downloads
		;;
	bootstrap)
		do_bootstrap
		;;
	rest)
		do_rest
		;;
	launch)
		do_launch
		;;
	*)
		err_usage invalid first argument to $0
		;;
esac
