#!/bin/bash

# must have bash shebang (not dash), otherwise "export -f" will not work

# ============================================================
#
# KaarPux: http://kaarpux.kaarposoft.dk
#
# Copyright (C) 2014: Henrik Kaare Poulsen
#
# License: http://kaarpux.kaarposoft.dk/license.html
#
# ============================================================
# Download all files necessary to build KaarPux
# ============================================================

set -o nounset
set -o errexit

KX_BASE="$(cd $(dirname "$0"); pwd -P)"
export KX_BASE

. "${KX_BASE}/shinc/common_functions.shinc"

# set -a makes sure all variables are exported
set -a
. "${KX_BASE}/shinc/packages.shinc"
set +a


# ============================================================
# settings

# tarballs will have their checksums verified in parallel
# each batch will verify the checksum of N_CHECKSUM_SERIAL tarballs
N_CHECKSUM_SERIAL=20

# N_DOWNLOAD_PARALLEL tarballs will be downloaded in parallel
N_DOWNLOAD_PARALLEL=10

# GnuPG operations will be run in parallel
# we will spawn no more than this number of processes:
# TODO: GnuPG seems to break if the number is too high
N_GNUPG_PARALLEL=5

# key files will be processed  in parallel
# each batch will process N_KEYS_SERIAL keys
N_KEYS_SERIAL=20

# tarballs will have their signatures verified in parallel
# each batch will process N_SIGNATURES_SERIAL signatures
N_SIGNATURES_SERIAL=20


# ============================================================
# export functions needed by gnu parallel

for f in \
	kx_echo kx_error_echo kx_error_exit \
	kx_checksum kx_checksum_only kx_checksum_only_batch \
	kx_download_only kx_download_batch kx_download_only_batch \
	kx_verify kx_verify_batch \
	kx_get_fingerprint kx_findkey kx_findkeys_batch
do
	export -f $f
done


# ============================================================
# temporary directory

T=$(mktemp -d -t dl2.XXXXXX)
kx_echo "temporary directory [$T]"


# ============================================================
# Verify checksums

kx_step_echo "Checking downloaded packages"

touch "$T/download1.txt"
grep ^kx_download "${KX_BASE}/download_all_packages.sh" | sed -e 's/^kx_download //' | envsubst | \
	parallel --gnu --no-notice --max-args ${N_CHECKSUM_SERIAL}  --line-buffer --tagstring "{#}" kx_checksum_only_batch "$T/download1.txt" "{}"


# ============================================================
# Download missing packages

touch "$T/download2.txt"
DL1=$(cat "$T/download1.txt" | wc -l)
if test ${DL1} -eq 0; then
	kx_echo "all packages downloaded"
else
	kx_step_echo "Trying to download ${DL1} files"
	cat "$T/download1.txt"
	echo
        echo "KAARPUX:  ------------------------------------------------------------"
	echo
	touch "$T/download2.txt"
	parallel --gnu --no-notice --jobs ${N_DOWNLOAD_PARALLEL} --max-args 1 --arg-file "$T/download1.txt" --line-buffer --tagstring "{#}" kx_download_batch "$T/download2.txt" "{}" || true
fi


# ============================================================
# Exit if we could not download all packages

DL2=$(cat "$T/download2.txt" | wc -l)
if test ${DL2} -eq 0; then
	kx_echo "all packages downloaded"
else
	kx_error_echo "${DL2} files could not be downloaded or had wrong checksum"
	for f in $(cut -f1 -d' ' "$T/download2.txt"); do
		eval echo $f
	done
	exit 1
fi


# ============================================================
# If we do not have gpg we are done

if ! command -V gpg 2>/dev/null; then
	kx_echo 'gpg not found; not verifying signatures'
	exit 0
fi


# ============================================================
# Create GPG download directory

if ! test -d "${KX_BASE}/../downloads/gpg_keys"; then
	kx_echo Creating GPG download directory
	mkdir -pv "${KX_BASE}/../downloads/gpg_keys"
fi


# ============================================================
# Create GPG keyring directory

if ! test -d "${KX_BASE}/gpg"; then
	kx_echo Creating GPG keyring directory
	mkdir -p "${KX_BASE}/gpg"
	chmod go-rwx "${KX_BASE}/gpg"
fi


# ============================================================
kx_step_echo "Checking for keys in keyring"


touch "$T/xkeys.txt"
grep -v "^#" "${KX_BASE}/../master/gpg_keys.txt" | sed '/^$/d' |  cut -f1 -d:  | sort > "$T/mkeys.txt" 
AWDA="--allow-weak-digest-algos"
gpg ${AWDA} --version >/dev/null 2>&1 || AWDA=""
gpg ${AWDA} --homedir="${KX_BASE}/gpg" --list-keys --with-colon | grep -E 'pub|sub' | cut -f5 -d: | sort > "$T/gkeys.txt"
diff "$T/mkeys.txt" "$T/gkeys.txt" | grep "^<"  | cut -c3- > "$T/xkeys.txt" || true

XK=$(cat "$T/xkeys.txt" | wc -l)

if test ${XK} -eq 0; then
	kx_echo "all keys found in keyring"
else

	# ============================================================
	kx_step_echo "Looking for ${XK} missing keys"
	
	grep -F -f "$T/xkeys.txt" "${KX_BASE}/../master/gpg_keys.txt" | sed -e 's/:/ /' > "$T/lkeys.txt"

	touch "$T/fkeys.txt"
	parallel --gnu --no-notice --jobs ${N_GNUPG_PARALLEL} --max-args ${N_KEYS_SERIAL} --arg-file "$T/lkeys.txt" --line-buffer --tagstring "{#}" kx_findkeys_batch "$T/fkeys.txt" "{}"

	FK=$(cat "$T/fkeys.txt" | wc -l)
	if test ${FK} -eq 0; then
		kx_echo "all gpg keys installed"
	else
		kx_error_echo "${FK} gpg keys could not be installed"
		cat "$T/fkeys.txt"
		exit 1
	fi

	# ============================================================
	kx_step_echo "Installing ${XK} missing keys"

	sed -e "s|^\(.*\)$|${KX_BASE}/../downloads/gpg_keys/\1.txt|" "$T/xkeys.txt" | \
		xargs gpg ${AWDA} --homedir="${KX_BASE}/gpg" --fast-import

	# ============================================================
	kx_step_echo "Updating ownertrust"
	
	grep -F -f "$T/xkeys.txt" "${KX_BASE}/../master/gpg_keys.txt" | sed -e 's|^[0-9A-Fa-f]\+:\([0-9A-Fa-f]\+\)|\1:6|' |
		gpg ${AWDA} --homedir="${KX_BASE}/gpg" --import-ownertrust || \
		kx_error_exit "Could not import ownertrust"

fi


# ============================================================
# Verify signatures

kx_step_echo "Verifying signatures"

touch "$T/verify.txt"

grep ^kx_verify "${KX_BASE}/download_all_packages.sh" | sed -e 's/^kx_verify //' | envsubst | \
	parallel --gnu --no-notice --jobs ${N_GNUPG_PARALLEL} --max-args ${N_SIGNATURES_SERIAL}  --line-buffer --tagstring "{#}" kx_verify_batch "$T/verify.txt" "{}"


# ============================================================
# Exit if we could not verify signatures

V=$(cat "$T/verify.txt" | wc -l)

if test ${V} -eq 0; then
	echo ""
	kx_echo "all packages downloaded and verified"
else
	kx_error_echo "${V} files could not be verified with gpg"
	for f in $(cut -f2 -d' ' "$T/verify.txt"); do
		eval echo $f
	done
	exit 1
fi


# ============================================================
# That's all; remove temp dir

rm -rf "$T"
# If we error out above, the temp dir is not deleted
# Thus you can look at the files in there to figure out what went wrong
