.. 
   KaarPux: http://kaarpux.kaarposoft.dk
   Copyright (C) 2015: Henrik Kaare Poulsen
   License: http://kaarpux.kaarposoft.dk/license.html

.. _changes_4_2_0:


================================
Changes in KaarPux version 4.2.0
================================


:program:`KaarPux` version ``4.2.0`` released on ``2014-mar-17``

- Flash Player version 11.2.202.346

- Linux Kernel version 3.13.6

- systemd version 211

- MesaLib version 10.1.0

- readline version 6.3

- Scripts and Documentation for Virtual Machines

- bugs fixed, minor improvements


Flash Player version 11.2.202.346
#################################

- UPD: flash_player_11: v 11.2.202.346
  (Commit `9fade580 <http://sourceforge.net/p/kaarpux/code/ci/9fade580ccb89566d9e64b82efe4ad0881ca1fe6/>`_)


Linux Kernel version 3.13.6
###########################

- UPD: linux: v 3.13.6
  (Commit `84b137bd <http://sourceforge.net/p/kaarpux/code/ci/84b137bd32bfed0ae7ef4d771dd026ff8ffb7475/>`_)


systemd version 211
###################

:program:`systemd` updated to version 211.

This change includes replacing :program:`dhcpcd`
with :program:`systemd-networkd`

- UPD: systemd: v 211
  (Commit `ffa76c2c <http://sourceforge.net/p/kaarpux/code/ci/ffa76c2c7ac20435813403d5553676d9c0863c86/>`_)

- FIX: systemd: --enable-compat-libs to keep dbus happy
  (Commit `93bf2461 <http://sourceforge.net/p/kaarpux/code/ci/93bf2461a133499bb3b67404ae575b05fd8ffd0d/>`_)

- IMPROVE: dbus: systemd no longer depends on dbus, so we do not have to build it in bootstrap_7
  (Commit `84ed62dc <http://sourceforge.net/p/kaarpux/code/ci/84ed62dc49ca869431dfbb01940777240c6476b0/>`_)

- FIX: dbus: --enable-systemd to make sure we get systemd
  (Commit `864ac541 <http://sourceforge.net/p/kaarpux/code/ci/864ac541e8773ef1f35096b61db0b2ab9f2584c9/>`_)

- FIX: systemd: correct paths to dbus files
  (Commit `8b689ed0 <http://sourceforge.net/p/kaarpux/code/ci/8b689ed05feffbab520b700913e55a302600648a/>`_)

- FIX: dbus: do not forget to add messagebus user
  (Commit `11923a25 <http://sourceforge.net/p/kaarpux/code/ci/11923a25a25c876818a2d2ce312a22a796155403/>`_)

- DOC: dbus: now we are only building twice
  (Commit `08fe1af6 <http://sourceforge.net/p/kaarpux/code/ci/08fe1af6dad0d11814f61cc1bb4dba14b6ffeb66/>`_)

- DOC: NetworkManager: KaarPux is now using systemd-networkd
  (Commit `0f94f133 <http://sourceforge.net/p/kaarpux/code/ci/0f94f133fcc7c3abfa91ee61487aa173579feaf9/>`_)

- IMPROVE: KaarPux: use systemd-networkd dhcp
  (Commit `a97682fb <http://sourceforge.net/p/kaarpux/code/ci/a97682fb052e97027082fd281515fcc4efbe2a5b/>`_)

- IMPROVE: KxBuild: create_bridge.sh use systemd-networkd
  (Commit `d812cf96 <http://sourceforge.net/p/kaarpux/code/ci/d812cf968fc40c628df7501e0a6854566169ae0b/>`_)

- REMOVE: dhcpd; use systemd instead
  (Commit `a3117862 <http://sourceforge.net/p/kaarpux/code/ci/a31178625e609efdf3191dbbbf28d3a892f1ae8a/>`_)


MesaLib version 10.1.0
######################

- UPD: MesaLib: v 10.1.0
  (Commit `e6d4bb2c <http://sourceforge.net/p/kaarpux/code/ci/e6d4bb2c885c195310570aa9712f8f795c72e76d/>`_)

- UPD: libclc: v f5dec6f8
  (Commit `46ef80b3 <http://sourceforge.net/p/kaarpux/code/ci/46ef80b35aee974f9ff9f8fc44abd58831e7168d/>`_)

- ADD: dri3proto: v 1.0 (prereq for MesaLib 10.1)
  (Commit `7fa36538 <http://sourceforge.net/p/kaarpux/code/ci/7fa36538f12cb71d17b954cb4428131daf8cf3d7/>`_)

- ADD: libxshmfence: v 1.1 (prereq for MesaLib 10.1)
  (Commit `ffd88b80 <http://sourceforge.net/p/kaarpux/code/ci/ffd88b80f5bd42eacfc62c3a3f281480c8799413/>`_)


readline version 6.3
####################

:program:`readline` updated to version 6.3.

In principle a bug fix release,
but deprecated API's removed as well.

- UPD: readline: v 6.3
  (Commit `6e7032bb <http://sourceforge.net/p/kaarpux/code/ci/6e7032bb30e5c4b9f55e4d6719d3582069512015/>`_)

- FIX: readline: remove defunct patch
  (Commit `992e4124 <http://sourceforge.net/p/kaarpux/code/ci/992e4124c1afa9d7baf09bb27cfc1e815c998c36/>`_)

- FIX: lua: add -lncurses for readline 6.3
  (Commit `f39f13f3 <http://sourceforge.net/p/kaarpux/code/ci/f39f13f34e699b7eb5a3e71e7af9dcce6e457896/>`_)

- FIX: ruby: patch for readline 6.3
  (Commit `48a58e38 <http://sourceforge.net/p/kaarpux/code/ci/48a58e385b64e13585f9acbc2713d4c93661a00b/>`_)

- FIX: parted: patch for readline 6.3
  (Commit `d86ff580 <http://sourceforge.net/p/kaarpux/code/ci/d86ff580678bd7b30986d5282a14a032be518201/>`_)

- FIX: samba: patch for readline 6.3
  (Commit `d05e20c0 <http://sourceforge.net/p/kaarpux/code/ci/d05e20c0b587dcd0be5194eea0dfe088781307eb/>`_)

- FIX: seed: patch for readline 6.3
  (Commit `eaff998a <http://sourceforge.net/p/kaarpux/code/ci/eaff998ae2d2cf2cb027573903513f892cb6ccb9/>`_)

- MINOR: readline: add -fPIC
  (Commit `3819eda6 <http://sourceforge.net/p/kaarpux/code/ci/3819eda6961b66a289af5901901236882a1fe20d/>`_)

- IMPROVE: mozjs: --disable-readline
  (Commit `58dde133 <http://sourceforge.net/p/kaarpux/code/ci/58dde1334c1409600ae12eb80736219f925adea6/>`_)


Scripts and Documentation for Virtual Machines
##############################################

Improved packages, scripts, and documentation for
building :program:`KaarPux` in virtual machines.

- ADD: KxBuild: scripts for building in virtual machines
  (Commit `abb339d1 <http://sourceforge.net/p/kaarpux/code/ci/abb339d1d581e5752050b59fe3866163c4af9246/>`_)

- FIX: KxBuild: OpenHosting launch with OHCPU and OHMEM
  (Commit `3c417f93 <http://sourceforge.net/p/kaarpux/code/ci/3c417f9351e783af0c372a216e5e01a9af38c9fb/>`_)

- FIX: KxBuild: wait 5 sec between ping and ssh in virtual scripts
  (Commit `713ab9b3 <http://sourceforge.net/p/kaarpux/code/ci/713ab9b3688158564a78a755421164de17e9f89d/>`_)

- IMPROVE: KaarPux: allow root to log in over ssh with keys
  (Commit `bbcd2844 <http://sourceforge.net/p/kaarpux/code/ci/bbcd2844dbc7d49585baf3cfbca1b858f9b03712/>`_)

- IMPROVE: KaarPux: add toor user
  (Commit `96f99b18 <http://sourceforge.net/p/kaarpux/code/ci/96f99b187ce6682de243878ac1844d317ba33936/>`_)

- DOC: KxBuild: document scripts for building in virtual machines
  (Commit `5d51fd55 <http://sourceforge.net/p/kaarpux/code/ci/5d51fd5507c536ece4879c8468cbd5e59c84dc40/>`_)


Bugs fixed
##########

- FIX: KxBuild: more specific input to fdisk in dangerous_build_bootstrap.sh
  (Commit `2198e8df <http://sourceforge.net/p/kaarpux/code/ci/2198e8df6b8a55734c4f7692a6003ea6cf996c4b/>`_)

- FIX: KxBuild: dangerous_build_bootstrap.sh to use better location for kaarpux.tar.gz
  (Commit `8c784612 <http://sourceforge.net/p/kaarpux/code/ci/8c78461246186b54dddc7078bcca2e4829d5ec09/>`_)

- FIX: KxBuild: do not die if TERM has not been set
  (Commit `b2a42269 <http://sourceforge.net/p/kaarpux/code/ci/b2a42269ff8c41a5d7ac88e8092e854d567f6fc2/>`_)

- FIX: \*: install files with correct mode
  (Commit `0965e033 <http://sourceforge.net/p/kaarpux/code/ci/0965e0338b43a5158056095a146141651e54d749/>`_)


Packages updated
################

- UPD: wireshark: v 1.10.6
  (Commit `11349fd6 <http://sourceforge.net/p/kaarpux/code/ci/11349fd64b3e7fc25192a447defe59cd21b2ce71/>`_)

- UPD: noscript: v 2.6.8.17
  (Commit `50b6b6e9 <http://sourceforge.net/p/kaarpux/code/ci/50b6b6e930f37e44a3578388174cf360f1525ca5/>`_)

- UPD: glibc: v 2.19
  (Commit `5f8e6e16 <http://sourceforge.net/p/kaarpux/code/ci/5f8e6e16824adc1609e172ea51cdbd2407bc00c7/>`_,
  Commit `258b9db3 <http://sourceforge.net/p/kaarpux/code/ci/258b9db385093abcdce9416bf0840efac9c53ab8/>`_)

- UPD: bash: v 4.3
  (Commit `5cb8f27d <http://sourceforge.net/p/kaarpux/code/ci/5cb8f27d42513cfc7faab333ee86e9010f366be5/>`_,
  `71c111cc <http://sourceforge.net/p/kaarpux/code/ci/71c111cc86ad457434627da10cb6996d3098eceb/>`_)

- UPD: mutter: v 3.10.4
  (Commit `3a4e42db <http://sourceforge.net/p/kaarpux/code/ci/3a4e42dbc582a938858d3ff2a63436fc042dcef5/>`_)

- UPD: gnome-shell: v 3.10.4
  (Commit `9b14684f <http://sourceforge.net/p/kaarpux/code/ci/9b14684fa26051d9d8a8d3053368591fa73f58f3/>`_)

- UPD: gnome-control-center: v 3.10.3
  (Commit `4cf9fa7a <http://sourceforge.net/p/kaarpux/code/ci/4cf9fa7ac9fe4a7dc934dad036799688778a7d20/>`_)

- UPD: lxc: v 1.0.1
  (Commit `06bc7807 <http://sourceforge.net/p/kaarpux/code/ci/06bc78075d3a5004be08bd41009df64c7f0486c7/>`_)

- UPD: spice-gtk: v 0.23
  (Commit `5c5fc68b <http://sourceforge.net/p/kaarpux/code/ci/5c5fc68b20d2b5c849b3e58d22cd174b8f3c4e1a/>`_)

- UPD: udisks: v 2.1.3
  (Commit `436a582e <http://sourceforge.net/p/kaarpux/code/ci/436a582e9c62844c78db3ffa3b03add9df464e84/>`_)

- UPD: pulseaudio: v 5.0
  (Commit `029e2801 <http://sourceforge.net/p/kaarpux/code/ci/029e280140fe3f4ed751855b5d12d047aafb5da0/>`_)

- UPD: bluez: v 5.16
  (Commit `a26a4c28 <http://sourceforge.net/p/kaarpux/code/ci/a26a4c2825a2d3166dd8cdbe8c24e01be9fd0d3c/>`_)


Minor Changes
#############

- IMPROVE: gst-plugins-base: make_repeat
  (Commit `40f4ce73 <http://sourceforge.net/p/kaarpux/code/ci/40f4ce73ef891ce8f288d462820b2d06f8566cb1/>`_)

- IMPROVE: KxBuild: if dangerous_build_* called with --yes or with stdin not a terminal, do not ask for confirmation
  (Commit `298f10c4 <http://sourceforge.net/p/kaarpux/code/ci/298f10c40e3acfa7ff1cff4f82bdc7f34e627eac/>`_)

- MINOR: KxBuild: dangerous_build_rest to use full path to download_all_packages.sh
  (Commit `43f8413f <http://sourceforge.net/p/kaarpux/code/ci/43f8413f13708223488a8044a38c695756be104f/>`_)

- IMPROVE: KxBuild: dangerous_build_bootstrap.sh can take *FDEV* and *DDEV* as argument
  (Commit `eff4de8e <http://sourceforge.net/p/kaarpux/code/ci/eff4de8e6851daa9a921abd8552c3d550d8a45fb/>`_)

- IMPROVE: lxc: better upstream version
  (Commit `c22640ad <http://sourceforge.net/p/kaarpux/code/ci/c22640ad7bbd5d177b87a20e78185b65001ed02a/>`_)

- IMPROVE: KaarPux: kx_cve.pl to ignore 'etc' and 'py'
  (Commit `049a3da9 <http://sourceforge.net/p/kaarpux/code/ci/049a3da9a8c8c64fbfde2b8097da49774a24243d/>`_)

- MINOR: default network device ens3 for kvm
  (Commit `fa2c689e <http://sourceforge.net/p/kaarpux/code/ci/fa2c689e415b3c08a87d4686745475b036f41b93/>`_)

- MINOR: KxBuild: remove unused function
  (Commit `1d1e1d23 <http://sourceforge.net/p/kaarpux/code/ci/1d1e1d23377c4246dd1191e49134990c018484e4/>`_)

- IMPROVE: KxBuild: include sysstat in host packages
  (Commit `10bc62ae <http://sourceforge.net/p/kaarpux/code/ci/10bc62ae0b5e676a33a9e848e8ab0ba39930c94a/>`_)

- IMPROVE: KxBuild: move sysstat to bootstrap_8 so it is available on first boot
  (Commit `380bf972 <http://sourceforge.net/p/kaarpux/code/ci/380bf972e967c547fdee0e861434992bee1b873d/>`_)

- IMPROVE: KxBuild: monitor build performance with sysstat
  (Commit `20359fab <http://sourceforge.net/p/kaarpux/code/ci/20359fab377b31cf133885e3ee3ed49298b14393/>`_)

- IMPROVE: systemd: chown and chmod for journal directory
  (Commit `fe92122f <http://sourceforge.net/p/kaarpux/code/ci/fe92122f0a3d7e209f69bb569e217789ff4b4fea/>`_)


