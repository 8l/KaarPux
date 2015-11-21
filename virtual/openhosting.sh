#!/bin/sh
#
# KaarPux: http://kaarpux.kaarposoft.dk
#
# Copyright (C) 2014: Henrik Kaare Poulsen
#
# License: http://kaarpux.kaarposoft.dk/license.html
#

# ============================================================

set -o nounset
set -o errexit

. "$(cd "$(dirname "$0")"; pwd -P)/virtual.shinc"

VERBOSE=false
if $VERBOSE; then
	VVERBOSE="--verbose"
else
	VVERBOSE=""
fi

# ============================================================
# 	BUILD KAARPUX ON OPENHOSTING
# ============================================================

usage () {
	local S
	S=$(basename $0)
	cat << EOF >> /dev/stderr
usage:
	export OHAUTH=<user uuid>:<secret API key>
	export PRIVKEY=<path_to_ssh_private_key>
	$S config|downloads|bootstrap|rest|launch <name>
EOF
}


# ============================================================
# 	DEFAULTS
# ============================================================

set_defaults () {
	test -n "${OHURI:-}" || OHURI=https://api-east1.openhosting.com/
	test -n "${OHAUTH:-}" || read -p "Please enter <user uuid>:<secret API key> " OHAUTH
	test -n "${PRIVKEY:-}" || read -p "Please enter <path_to_ssh_private_key> " PRIVKEY
	test -n "${PUBKEY:-}" || PUBKEY="${PRIVKEY}.pub"
				# Ubuntu Linux 12.04 Server
	test -n "${OHIMG:-}" || OHIMG=c7b64dec-9154-4a99-b19a-1a1f96b7ea20
	test -n "${OHCPU:-}" || OHCPU=20000
	test -n "${OHMEM:-}" || OHMEM=24576
	HEADER_FILE=$(mktemp)
}


# ============================================================

show_config () {
cat >> /dev/stderr << EOF 
Configuration:
	OHURI	${OHURI}
	OHAUTH	${OHAUTH}
	PRIVKEY	${PRIVKEY}
	PUBKEY	${PUBKEY}
	OHIMG	${OHIMG}
	OHCPU	${OHCPU}
	OHMEM	${OHMEM}
	TARBALL	${TARBALL:-none; use sourceforge}
EOF
}

# ============================================================
# 	PASSWORD
# ============================================================

generate_password () {
	dbg "generating password"
	# 6 binary bytes -> 8 ascii bytes (8 is max on openhosting)
	dd if=/dev/random bs=6 count=1 2>/dev/null | base64 | tr "+/" "__"
	dbg "password generated"
}

# ============================================================

ssh_with_password () {
expect << EOF || err ssh_with_password failed
	set timeout 60
	spawn ssh "-o" "StrictHostKeyChecking=no" "$1" "$2"
	expect "*?assword:*"
	send "$PASSWORD\r"
	expect eof
EOF
}

# ============================================================

scp_with_password () {
expect << EOF || err scp_with_password failed
	set timeout 60
	spawn scp "-q" "-p" "$1" "$2"
	expect "*?assword:*"
	send "$PASSWORD\r"
	expect eof
EOF
}
	
# ============================================================
# 	OPENHOSTING
# ============================================================

oh_200 () {
	H=$(head -1 "$HEADER_FILE")
	X=$(sed -rn 's!^HTTP/.* ([[:digit:]]+).*!\1!p' "$HEADER_FILE")
	$VERBOSE && dbg "response code [$X]"
	case "$X" in
		2*)
			return
			;;
		*)
			echo "$2" >> /dev/stderr
			err "response code $X for $1"
		;;
	esac
}

# ============================================================

oh_get () {
	local URI AUTH
	URI="${OHURI%/}/"$1
	RES=$(curl --user "$OHAUTH" --dump-header "$HEADER_FILE" --silent $VVERBOSE "$URI") || err curl "$URI" failed
	$VERBOSE && cat "$HEADER_FILE" | dbg_file 
	oh_200 "$URI" "$RES"
	echo "$RES"
}

# ============================================================

oh_put () {
#	cat
#	return
	local URI AUTH
	URI="${OHURI%/}/"$1
	RES=$(curl --data-binary @- --user "$OHAUTH" --dump-header "$HEADER_FILE" --silent $VVERBOSE "$URI" \
		-H "Content-Type: ${TYPE:-application/octet-stream}" \
		-H "Expect: $OHURI") \
		 || err curl "$URI" failed
	$VERBOSE && cat "$HEADER_FILE" | dbg_file 
	oh_200 "$URI" "$RES"
	echo "$RES"
}

# ============================================================

oh_find_drive () {
	local NAME DL D D1 DD
	NAME="$1"
	dbg "listing drives"
	DL="$(oh_get drives/list)"
	dbg found $(echo "$DL" | wc -l) drives
	dbg "looking for drive [${NAME}]"
	for D in $DL; do
		D1=$(oh_get drives/$D/info)
		if echo "$D1" | grep -E "^name ${NAME}$" > /dev/null; then
			$VERBOSE && echo "$D1" | dbg_file 
			DD=$(echo "$D1" | grep -E '^drive ' | cut -d' ' -f2)
			dbg "found drive [${NAME}]: $DD"
			$VERBOSE && echo "$D1" | dbg_file 
			echo "$DD"
			return
		fi
	done
	err "drive [${NAME}] not found"
}

# ============================================================

oh_create_drive () {
	DNAME=$1
	DSIZE=$2
	dbg "creating drive $DNAME"
	D1=$(oh_put drives/create) <<-EOF
		name $1
		size $2
		encryption:cipher none
		EOF
	$VERBOSE && echo "$D1" | dbg_file 
	D=$(echo "$D1" | grep -E '^drive ' | cut -d' ' -f2)
	dbg "drive $D created"

	echo $D
}

# ============================================================

oh_clone_drive () {
	DNAME=$1
	DSIZE=$2
	DIMG=$3
	DRIVE=$(oh_create_drive $DNAME $DSIZE)
	dbg "cloning drive $DIMG to $DRIVE"
	D1=$(oh_put drives/$DRIVE/image/$DIMG/gunzip) < /dev/null
	$VERBOSE && echo "$D1" | dbg_file 
	dbg "drive $DIMG to $DRIVE cloning started"

	while true; do
		dbg "waiting for drive to be ready"
		sleep 5
		D1=$(oh_get drives/$DRIVE/info)
		S=$(echo "$D1" | grep -E '^status ' | cut -d' ' -f2)
		I=$(echo "$D1" | grep -E '^imaging ' | cut -d' ' -f2)
		dbg "status [$S] imaging [$I]"
		test -z "$I" && break
	done
	dbg "drive $DIMG to $DRIVE cloned and ready"

	echo $DRIVE
}

# ============================================================

oh_create_server () {
	dbg "creating server"
	R=$(oh_put servers/create)
	$VERBOSE && echo "$R" | dbg_file 
	S=$(echo "$R" | grep -E '^server ' | cut -d' ' -f2)

	SIP=$(echo "$R" | grep -E '^nic:0:dhcp:ip ' | cut -d' ' -f2)

	dbg "server $S created with IP $SIP"

#	dbg setting server password
#	oh_put servers/$S/set << EOF
#vnc:password x1234567
#EOF
	echo "$S:$SIP"
}

# ============================================================
# 	DOWNLOADS
# ============================================================

do_downloads () {
	set_defaults
	show_config

	DL_DRIVE=$(oh_create_drive downloads 8G)
	#echo DL_DRIVE $DL_DRIVE

	OU_DRIVE=$(oh_clone_drive oh_$NAME 2G $OHIMG)
	#echo OU_DRIVE $OU_DRIVE

	PASSWORD=$(generate_password)
	#echo PASSWORD $PASSWORD

	S_AND_IP=$(oh_create_server) <<-EOF
		name oh_$NAME
		cpu $OHCPU
		smp auto
		mem $OHMEM
		persistent true
		ide:0:0 $OU_DRIVE
		block:0 $DL_DRIVE
		boot ide:0:0
		nic:0:model e1000
		nic:0:dhcp auto
		vnc auto
		password $PASSWORD
	EOF

	SERVER=$(echo ${S_AND_IP} | cut -d: -f1)
	SERVER_IP=$(echo ${S_AND_IP} | cut -d: -f2)

	wait_for_ping ${SERVER_IP}

	dbg "wait 5 seconds for ssh"
	sleep 5

	dbg "remove ${SERVER_IP} from known hosts"
	ssh-keygen -R ${SERVER_IP} || true

	dbg "sending public key $PUBKEY to toor"
	ssh_with_password "toor@${SERVER_IP}" "mkdir -p -m700 .ssh"
	scp_with_password "$PUBKEY" "toor@$SERVER_IP:.ssh/authorized_keys"
	#ssh_with_password "toor@$SERVER_IP" "chmod 600 .ssh/authorized_keys"
	dbg "public key $PUBKEY send to toor"

	dbg "remove motd"
	ssh -T -i $PRIVKEY "toor@$SERVER_IP" "rm /etc/motd"
	dbg "motd removed"

	dbg "creating kaarpux user"
	ssh -T -i $PRIVKEY "toor@$SERVER_IP" <<-EOF
		groupadd -g 1000 kaarpux
		useradd -u 1000 -g 1000 -G sudo -s /bin/bash -m kaarpux
		mkdir -p -m700 /home/kaarpux/.ssh
		cp .ssh/authorized_keys /home/kaarpux/.ssh
		chown -R kaarpux:kaarpux /home/kaarpux/.ssh
		chmod 600 /home/kaarpux/.ssh/authorized_keys
	EOF
	dbg "kaarpux user created"

	dbg "formatting downloads drive"
	ssh -T -i $PRIVKEY "toor@$SERVER_IP" <<-EOF
		mke2fs -t ext4 -jv /dev/vda
		fsck /dev/vda
		mount /dev/vda /mnt
		chown 1000:1000 /mnt
		chmod ugo+rwx /mnt
		umount /mnt
	EOF

	download_downloads "${K_IP}" "${K_PRIVKEY}" "${K_TARBALL:-}" "/dev/vda"

	kvm_poweroff
}

# ============================================================
# 	BOOTSTRAP
# ============================================================

do_bootstrap () {
	set_defaults
	show_config

	DL_DRIVE=$(oh_find_drive downloads)
	#echo DL_DRIVE $DL_DRIVE

	OU_DRIVE=$(oh_clone_drive oh_$NAME 2G $OHIMG)
	#echo OU_DRIVE $OU_DRIVE

	SW_DRIVE=$(oh_create_drive "sw_$NAME" 32G)
	#echo SW_DRIVE $SW_DRIVE

	KX_DRIVE=$(oh_create_drive "kx_$NAME" 32G)
	#echo KX_DRIVE $KX_DRIVE

	PASSWORD=$(generate_password)
	#echo PASSWORD $PASSWORD

	S_AND_IP=$(oh_create_server) <<-EOF
		name oh_$NAME
		cpu $OHCPU
		smp auto
		mem $OHMEM
		persistent true
		ide:0:0 $OU_DRIVE
		block:0 $SW_DRIVE
		block:1 $KX_DRIVE
		block:2 $DL_DRIVE
		boot ide:0:0
		nic:0:model e1000
		nic:0:dhcp auto
		vnc auto
		password $PASSWORD
	EOF

	SERVER=$(echo ${S_AND_IP} | cut -d: -f1)
	SERVER_IP=$(echo ${S_AND_IP} | cut -d: -f2)

	wait_for_ping ${SERVER_IP}

	dbg "wait 5 seconds for ssh"
	sleep 5

	dbg "remove ${SERVER_IP} from known hosts"
	ssh-keygen -R ${SERVER_IP} || true

	dbg "sending public key $PUBKEY to toor"
	ssh_with_password "toor@${SERVER_IP}" "mkdir -p -m700 .ssh"
	scp_with_password "$PUBKEY" "toor@$SERVER_IP:.ssh/authorized_keys"
	#ssh_with_password "toor@$SERVER_IP" "chmod 600 .ssh/authorized_keys"
	dbg "public key $PUBKEY send to toor"

	dbg "remove motd"
	ssh -T -i $PRIVKEY "toor@$SERVER_IP" "rm /etc/motd"
	dbg "motd removed"

	dbg "installing required packages"
	ssh -T -i $PRIVKEY "toor@$SERVER_IP" <<-EOF
		wget -O host_ubuntu.sh http://sourceforge.net/p/kaarpux/code/ci/master/tree/master/host_ubuntu.sh?format=raw
		sh host_ubuntu.sh
	EOF
	dbg "required packages installed"

	dbg "creating kaarpux user"
	ssh -T -i $PRIVKEY "toor@$SERVER_IP" <<-EOF
		groupadd -g 1000 kaarpux
		useradd -u 1000 -g 1000 -G sudo -s /bin/bash -m kaarpux
		mkdir -p -m700 /home/kaarpux/.ssh
		cp .ssh/authorized_keys /home/kaarpux/.ssh
		chown -R kaarpux:kaarpux /home/kaarpux/.ssh
		chmod 600 /home/kaarpux/.ssh/authorized_keys
	EOF
	dbg "kaarpux user created"

	dbg "create swap"
	ssh -T -i $PRIVKEY "toor@$SERVER_IP" <<-EOF
		mkswap -f /dev/vda
		swapon /dev/vda
	EOF
	dbg "swap created"

	bootstrap_phase "${SERVER_IP}" "${PRIVKEY}" "${TARBALL:-}"

	dbg "poweroff"
	ssh -T -i $PRIVKEY "toor@$SERVER_IP" "poweroff"

	dbg "remove ${SERVER_IP} from known hosts"
	ssh-keygen -R ${SERVER_IP} || true

	#echo SERVER_PW $SERVER_PASSWORD
	#oh_get servers/list
	#oh_get servers/bd44f444-8cfb-4f5a-abea-ec5919656ec6/info
}

# ============================================================
# 	REST
# ============================================================

do_rest () {
	set_defaults
	show_config

	DL_DRIVE=$(oh_find_drive downloads)
	#echo DL_DRIVE $DL_DRIVE

	SW_DRIVE=$(oh_find_drive "sw_$NAME")
	#echo SW_DRIVE $SW_DRIVE

	KX_DRIVE=$(oh_find_drive "kx_$NAME")
	#echo KX_DRIVE $KX_DRIVE

	PASSWORD=$(generate_password)
	#echo PASSWORD $PASSWORD

	S_AND_IP=$(oh_create_server) <<-EOF
		name kx_$NAME
		cpu $OHCPU
		smp auto
		mem $OHMEM
		persistent true
		ide:0:0 $KX_DRIVE
		block:0 $SW_DRIVE
		block:1 $DL_DRIVE
		boot ide:0:0
		nic:0:model virtio
		nic:0:dhcp auto
		vnc auto
		password $PASSWORD
	EOF

	#echo S_AND_IP ${S_AND_IP}
	SERVER=$(echo ${S_AND_IP} | cut -d: -f1)
	SERVER_IP=$(echo ${S_AND_IP} | cut -d: -f2)
	#echo SERVER $SERVER
	#echo SERVER_IP ${SERVER_IP}

	wait_for_ping ${SERVER_IP}

	dbg "wait 5 seconds for ssh"
	sleep 5

	dbg "check connectivity to ${SERVER_IP}"
	ssh -T -o "StrictHostKeyChecking=no" -i $PRIVKEY "kaarpux@$SERVER_IP" id
	dbg "OK"

	dbg "enable swap"
	ssh -T -i $PRIVKEY "toor@$SERVER_IP" <<-EOF
		swapon /dev/vda
	EOF
	dbg "swap enabled"

	linux_phase "${SERVER_IP}" "${PRIVKEY}"

	dbg "poweroff"
	ssh -T -i $PRIVKEY "toor@$SERVER_IP" "poweroff"
}

# ============================================================
# 	LAUNCH
# ============================================================

do_launch () {
	set_defaults
	show_config

	SW_DRIVE=$(oh_find_drive "sw_$NAME")
	#echo SW_DRIVE $SW_DRIVE

	KX_DRIVE=$(oh_find_drive "kx_$NAME")
	#echo KX_DRIVE $KX_DRIVE

	PASSWORD=$(generate_password)
	#echo PASSWORD $PASSWORD

	S_AND_IP=$(oh_create_server) <<-EOF
		name kx_$NAME
		cpu $OHCPU
		smp auto
		mem $OHMEM
		persistent true
		ide:0:0 $KX_DRIVE
		block:0 $SW_DRIVE
		boot ide:0:0
		nic:0:model virtio
		nic:0:dhcp auto
		vnc auto
		password $PASSWORD
	EOF

	#echo S_AND_IP ${S_AND_IP}
	SERVER=$(echo ${S_AND_IP} | cut -d: -f1)
	SERVER_IP=$(echo ${S_AND_IP} | cut -d: -f2)
	#echo SERVER $SERVER
	#echo SERVER_IP ${SERVER_IP}

	wait_for_ping ${SERVER_IP}

	dbg "check connectivity to ${SERVER_IP}"
	ssh -T -o "StrictHostKeyChecking=no" -i $PRIVKEY "kaarpux@$SERVER_IP" id
	dbg "OK"

	dbg "enable swap"
	ssh -T -i $PRIVKEY "toor@$SERVER_IP" <<-EOF
		set -x
		swapon /dev/vda
	EOF
	dbg "swap enabled"

	dbg "vm launched.  IP address is ${SERVER_IP}"
}

# ============================================================
# 	MAIN
# ============================================================


test $# -eq 2 || err_usage $(basename $0) must be called with exactly two arguments
	
NAME=$2

case "$1" in
	config)
		test -n "${OHAUTH:-}" || OHAUTH="???"
		test -n "${PRIVKEY:-}" || PRIVKEY="???"
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
		err_usage invalid second argument to $0
		;;
esac
