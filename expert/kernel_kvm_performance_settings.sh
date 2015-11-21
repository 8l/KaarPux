#!/bin/bash
#
# KaarPux: http://kaarpux.kaarposoft.dk
#
# Copyright (C) 2014-2015: Henrik Kaare Poulsen
#
# License: http://kaarpux.kaarposoft.dk/license.html
#

# ============================================================
# SETTINGS FOR HOST KERNEL TO SLIGHTLY IMPROVE KVM PERFORMANCE
# ============================================================

set -o nounset
set -o errexit

test $(id -u) -eq 0 || { echo "*** $0: must be run as root"; exit 1; }


# ============================================================

DEV=$(df /kvm --output=source|tail -1)
DEV=${DEV#/dev/}
DEV=${DEV%%[0-9]}
DEV=${DEV%%[0-9]}
DEV=${DEV%%[0-9]}
echo "==> Deadline scheduler on ${DEV}"
echo deadline > /sys/block/${DEV}/queue/scheduler
echo "/sys/block/${DEV}/queue/scheduler"
cat "/sys/block/${DEV}/queue/scheduler"

# ============================================================

echo "==> Performance setting for CPU frequency scaling govenor"
for n in $( grep processor /proc/cpuinfo | cut -f2 -d ':'); do
f=/sys/devices/system/cpu/cpu$n
echo $f
echo performance > $f/cpufreq/scaling_governor
done

# ============================================================

MULT=${1:-10}
echo "==> Kernel scheduling settings"
sysctl -w kernel.sched_min_granularity_ns=$(( MULT * 3000000)) || true
sysctl -w kernel.sched_latency_ns=$(( MULT * 24000000)) || true
sysctl -w kernel.sched_wakeup_granularity_ns=$(( MULT * 4000000)) || true
sysctl -w kernel.sched_migration_cost_ns=$(( MULT * 500000)) || true
sysctl -w kernel.sched_shares_window_ns=$(( MULT * 10000000)) || true
sysctl -w kernel.sched_child_runs_first=0 || true
sysctl -w kernel.sched_autogroup_enabled=0 || true

sysctl -w vm.dirty_background_ratio=50 || true
sysctl -w vm.dirty_expire_centisecs=12000 || true
sysctl -w vm.dirty_ratio=80 || true
sysctl -w vm.dirty_writeback_centisecs=4000 || true

echo "==> Done"

