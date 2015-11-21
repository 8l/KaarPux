.. 
   KaarPux: http://kaarpux.kaarposoft.dk
   Copyright (C) 2015: Henrik Kaare Poulsen
   License: http://kaarpux.kaarposoft.dk/license.html

.. _changes_3_3_0:


================================
Changes in KaarPux version 3.3.0
================================


:program:`KaarPux` version ``3.3.0`` released on ``2012-dec-13``

:program:`KaarPux` updated to support ``x86_64`` (64-bit) AMD/Intel platforms.

Note that :program:`KaarPux` is not (yet) a multilib system, so
:program:`xen` and :program:`skype`
will not build on a ``x86_64`` platform.


Bugs fixed
##########

- FIX: unzip: correct build script
  (Commit `a2631ba3 <http://sourceforge.net/p/kaarpux/code/ci/a2631ba33a6c22fc72c536866a9cfa76b3fde8d4/>`_)

- FIX: cdparanoia: make: -j 1
  (Commit `4a707af5 <http://sourceforge.net/p/kaarpux/code/ci/4a707af599478df5e8482d70fa71360357a49626/>`_)

- FIX: binutils: install libiberty+bfd+opcodes with -fPIC
  (Commit `d08b2647 <http://sourceforge.net/p/kaarpux/code/ci/d08b2647ea61eeb8f5b46a9751f272da85cb0e7f/>`_)

- FIX: gdm: gdm.service to conflict/after on tty2
  (Commit `06d81975 <http://sourceforge.net/p/kaarpux/code/ci/06d81975656ae3928053523497f06d658238dddb/>`_)


Packages added
##############

- ADD: gptfdisk: GUID partition table tools
  (Commit `715e7e53 <http://sourceforge.net/p/kaarpux/code/ci/715e7e532c1116849fbff458b6a0708b831c6f1a/>`_)

- ADD: linux-firmware: Firmware for linux kernel; in particular for radeon
  (Commit `38f5ac4c <http://sourceforge.net/p/kaarpux/code/ci/38f5ac4c33fe08166758c48c8d0baa46eaa89f75/>`_)

- ADD: efibootmgr: Extensible Firmware Interface (EFI) Boot Manager
  (Commit `30528d7f <http://sourceforge.net/p/kaarpux/code/ci/30528d7fd76cd7db1ca8da2f4712c9e412e16f92/>`_)


Packages updated
################

- UPD: linux: v 3.6.9
  (Commit `ebda63de <http://sourceforge.net/p/kaarpux/code/ci/ebda63de3d6134a04e00261a4e8e0550475b4ab0/>`_)

- UPD: cairo: v 1.12.8
  (Commit `5aae6126 <http://sourceforge.net/p/kaarpux/code/ci/5aae6126292cc9edf97c90745156732c15d0083f/>`_)


Minor Changes
#############

- IMPROVE: icu popt: move to bootstrap (prereq for gptfdisk)
  (Commit `070cd823 <http://sourceforge.net/p/kaarpux/code/ci/070cd823e9dfb8b2d0cf61753d7b59fdd84adf08/>`_)

- IMPROVE: bootstrap: correct check scripts to work on x86_64
  (Commit `98e36caf <http://sourceforge.net/p/kaarpux/code/ci/98e36caf29c850db96842e997bd6b9fe27af1570/>`_)

- IMPROVE: gcc: several minor improvements
  (Commit `72ca19cd <http://sourceforge.net/p/kaarpux/code/ci/72ca19cdc44f6f19b344dae03c45e0c14e6e2598/>`_)

- IMPROVE: glibc: use KX_MAKE_J
  (Commit `75034e54 <http://sourceforge.net/p/kaarpux/code/ci/75034e548eea4b01abfc335895818970550174b3/>`_)

- IMPROVE: bootstrap: use KX_MAKE_J during the whole bootstrap process
  (Commit `8649e7ce <http://sourceforge.net/p/kaarpux/code/ci/8649e7ce7241d014056dfc5d5aa4b654fb9ef614/>`_)

- IMPROVE: linux: support both i686 and x86_64; include firmware and drivers in initramfs
  (Commit `b38e381e <http://sourceforge.net/p/kaarpux/code/ci/b38e381e7125e54479d89e2cefe94152aa028404/>`_)

- IMPROVE: boost: use KX_MAKE_J
  (Commit `514e9419 <http://sourceforge.net/p/kaarpux/code/ci/514e94198ab7253a6a84845dd8ea4e41208543b3/>`_)

- IMPROVE: busybox: enable GPT_LABEL; keep full config file in git, not just a diff
  (Commit `636444b4 <http://sourceforge.net/p/kaarpux/code/ci/636444b416918f8ca8d9b69a3cd272c5e8905459/>`_)

- IMPROVE: gdb: only install the binarie: do not overwrite existing libs
  (Commit `eb02eefd <http://sourceforge.net/p/kaarpux/code/ci/eb02eefd3e44d318a0e19cc4a704c559733fdd3c/>`_)

- IMPROVE: mesa-demos: install in subdir to bin; compile with -j
  (Commit `f77b0a62 <http://sourceforge.net/p/kaarpux/code/ci/f77b0a62b807e701ab1d23eb5374d92357714c6e/>`_)

- IMPROVE: KaarPux: KX_DISABLE_TEST to disable testing
  (Commit `88fc32e2 <http://sourceforge.net/p/kaarpux/code/ci/88fc32e2a8f5e589973e9579836731390798bd18/>`_)

- IMPROVE: gst-plugins-bad: make_repeat
  (Commit `244de404 <http://sourceforge.net/p/kaarpux/code/ci/244de4046dce86141c80c4fd91417f7a8f751053/>`_)

- IMPROVE: jasper: fPIC
  (Commit `57a21edc <http://sourceforge.net/p/kaarpux/code/ci/57a21edc5d2fa131fea040dc51089867f022e3c1/>`_)

- IMPROVE: liba52: -fPIC
  (Commit `d3adc16a <http://sourceforge.net/p/kaarpux/code/ci/d3adc16af1345dd7bd47ee84294f4f4b1b59f160/>`_)

- IMPROVE: KxBuild: allow separate download for 32 and 64 bit
  (Commit `4bc4b420 <http://sourceforge.net/p/kaarpux/code/ci/4bc4b420b87d76befb2a8f039712cd287f07d3b5/>`_)

- IMPROVE: icedtea6: support for x86_64
  (Commit `4c192c90 <http://sourceforge.net/p/kaarpux/code/ci/4c192c90fffb036554c5ab795a99e5f90b721c07/>`_)

- IMPROVE: icedtea: --with-parallel-jobs
  (Commit `9659cd7d <http://sourceforge.net/p/kaarpux/code/ci/9659cd7dc68cf04c4fc9146b032ea952d705a596/>`_)

- IMPROVE: xulrunner firefox thunderbird: mk_add_options MOZ_MAKE_FLAGS=${KX_MAKE_J}
  (Commit `71a1380c <http://sourceforge.net/p/kaarpux/code/ci/71a1380c8b30b5346b3b7ab66e3b0be387d8784b/>`_)

- IMPROVE: ghc-binary: support for x86_64
  (Commit `b1ef17c5 <http://sourceforge.net/p/kaarpux/code/ci/b1ef17c5c36f5b095cd4f0b8ed99f04acbb48d7f/>`_)

- IMPROVE: flash_player_11: support for x86_64
  (Commit `30a32e01 <http://sourceforge.net/p/kaarpux/code/ci/30a32e019996541add1f58e45317201b5d1f46cb/>`_)

- IMPROVE: grub: support for x86_64
  (Commit `b88ea344 <http://sourceforge.net/p/kaarpux/code/ci/b88ea3445546595448db87092544c1eb9ed3d23e/>`_)


Documentation Changes
#####################

- DOC: skype: note that there is no x86_64 pacakge
  (Commit `cf4560e7 <http://sourceforge.net/p/kaarpux/code/ci/cf4560e78a072b4b2b4c74aed9bb9af31837d196/>`_)

- DOC: www: Required packages for Fedora host
  (Commit `159df98c <http://sourceforge.net/p/kaarpux/code/ci/159df98ca3f64872d5cfe0ef4069086e4b1c7d43/>`_)

- DOC: www: Update x86_64 information
  (Commit `56e143d5 <http://sourceforge.net/p/kaarpux/code/ci/56e143d5881be7b03de20264849cd5b9725eec36/>`_)

- DOC: www: Add instructions for GPT and UEFI
  (Commit `243f74d7 <http://sourceforge.net/p/kaarpux/code/ci/243f74d7329866b5917e3a9d27292ab1a4a5220d/>`_)


