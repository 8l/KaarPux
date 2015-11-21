.. 
   KaarPux: http://kaarpux.kaarposoft.dk
   Copyright (C) 2015: Henrik Kaare Poulsen
   License: http://kaarpux.kaarposoft.dk/license.html

.. _changes_4_2_4:


================================
Changes in KaarPux version 4.2.4
================================


:program:`KaarPux` version ``4.2.4`` released on ``2014-apr-17``

- linux version 3.13.10

- WebKit version 2.4.1

- icedtea7 (Java) version 2.4.7

- Improved Linux kernel configuration

- Bugs fixed, packages and documentation updated


Packages updated
################

- UPD: acpica: v 20140325
  (Commit `a51cd163 <http://sourceforge.net/p/kaarpux/code/ci/a51cd1637dbab81834a0ec291bcd4f9002dff06c/>`_)

- UPD: linux: v 3.13.10
  (Commit `988caba7 <http://sourceforge.net/p/kaarpux/code/ci/988caba79e0584ccda0ab93960e0ddab61070eb1/>`_)

- UPD: WebKit: v 2.4.1
  (Commit `8c8fd369 <http://sourceforge.net/p/kaarpux/code/ci/8c8fd36975b1a792e6599a2065f8d742d38e3a16/>`_)

- UPD: icedtea7: v 2.4.7
  (Commit `01fed0ec <http://sourceforge.net/p/kaarpux/code/ci/01fed0ec6709a824f8fc82139ee25f89ba6215cd/>`_)

- UPD: ghostery: v 5.2.0
  (Commit `a416e48d <http://sourceforge.net/p/kaarpux/code/ci/a416e48d0fd4dc527eb01b5fb4d0e81ab7f5ec7f/>`_)


Packages added
##############

- ADD: smartmontools
  (Commit `8a21374a <http://sourceforge.net/p/kaarpux/code/ci/8a21374a76eb9c96a90a4d6b9921b96dbc206a06/>`_)

- ADD: dmidecode (for sensors)
  (Commit `e123937f <http://sourceforge.net/p/kaarpux/code/ci/e123937f3892b30b89d4af3db59d8d583b93e465/>`_)

- ADD: pwsafe: add to master.yaml
  (Commit `db7faf5e <http://sourceforge.net/p/kaarpux/code/ci/db7faf5e6f9948acd90c17d043c1d681d1d9dc64/>`_)


Bugs fixed
##########

- FIX: openhosting: do not check_no_ping
  (Commit `0f5a8999 <http://sourceforge.net/p/kaarpux/code/ci/0f5a8999478e41fe49cc85270bbfbe6c248edd17/>`_)

- FIX: dmidecode: correct signature verification
  (Commit `7fc0fa3d <http://sourceforge.net/p/kaarpux/code/ci/7fc0fa3d540e657e57b5557ed314a819f72f24a7/>`_)

- FIX: KaarPux: re-introduce lshw
  (Commit `a65ff32c <http://sourceforge.net/p/kaarpux/code/ci/a65ff32cb1a9e4ad87e60efda0d0482b114db8ed/>`_)

- FIX: pwsafe: move wxWidgets and pwsafe to opt_desktop
  (Commit `4b38d79c <http://sourceforge.net/p/kaarpux/code/ci/4b38d79c74152f7aab49c865cd6a4339acb4c358/>`_)

- FIX: empathy: make_repeat
  (Commit `172df90e <http://sourceforge.net/p/kaarpux/code/ci/172df90e468958c647e45b19e18f6e6a27cd67d5/>`_)


Improved Linux kernel configuration
###################################

- MINOR: linux: configure for W83627EHF
  (Commit `3e4164b5 <http://sourceforge.net/p/kaarpux/code/ci/3e4164b59211ac965b71a192e72857387a3394ee/>`_)

- MINOR: linux: configure for ATK0110
  (Commit `bd1be51b <http://sourceforge.net/p/kaarpux/code/ci/bd1be51b988e0eb3922d4d66a453d5a0c14a83d0/>`_)

- IMPROVE: linux: remove debug configurations
  (Commit `708ab3d0 <http://sourceforge.net/p/kaarpux/code/ci/708ab3d077847e50de575ab697cd6dd3ff9b9cb4/>`_)

- IMPROVE: linux: remove SELinux configuration
  (Commit `a14b6696 <http://sourceforge.net/p/kaarpux/code/ci/a14b66964dd3b77b68df8f101416537fe3248315/>`_)

- IMPROVE: linux: better config for RCU, JUMP_LABEL and SPINLOCKS
  (Commit `4cb4793d <http://sourceforge.net/p/kaarpux/code/ci/4cb4793dbcbdf3af0c811bee4942b8118ec96548/>`_)

- IMPROVE: linux: better config for NR_CPUS and CPU frequency governor
  (Commit `a48b2d59 <http://sourceforge.net/p/kaarpux/code/ci/a48b2d592b732cad70a7291512ab74bf23b2de2c/>`_)

- IMPROVE: linux: remove unused config settings
  (Commit `be16e13f <http://sourceforge.net/p/kaarpux/code/ci/be16e13f1c934dc7bcafe9d4550945cfd1daef94/>`_)

- IMPROVE: linux: configure timer at 300Hz; no crash kernel; acpi not as modules
  (Commit `bf3109f2 <http://sourceforge.net/p/kaarpux/code/ci/bf3109f260f390fc9029b65d4bcb18ab6e435fcc/>`_)

- IMPROVE: linux: install tools: cpupower, turbostat, perf, acpi
  (Commit `184afa03 <http://sourceforge.net/p/kaarpux/code/ci/184afa0320471df12c1f55d003e5b7eb884a79af/>`_)

- IMPROVE: linux: build and install tools separatly
  (Commit `9779add2 <http://sourceforge.net/p/kaarpux/code/ci/9779add23caa7c92d3443dc40e51c3f46c4fba20/>`_)

- IMPROVE: linux: re-introduce DEBUG_KERNEL for systemtap
  (Commit `e07acb65 <http://sourceforge.net/p/kaarpux/code/ci/e07acb6588bbae3c8c97f544e34a685807db62fd/>`_)

- IMPROVE: linux: add GPIO to config
  (Commit `84b621f5 <http://sourceforge.net/p/kaarpux/code/ci/84b621f5ca7366c225ab7d61298cb1fa31c0beda/>`_)


Minor Changes
#############

- IMPROVE: openhosting: use ubuntu 12.04
  (Commit `a932ca14 <http://sourceforge.net/p/kaarpux/code/ci/a932ca14d72ca0c2a423833ccbe09ff644748faa/>`_)

- IMPROVE: asciidoc: move to bootstrap_8
  (Commit `73bd99ab <http://sourceforge.net/p/kaarpux/code/ci/73bd99ab7bb66d82258249e974e1a3319e374d6a/>`_)

- IMPROVE: create_bridge: better file name in /etc/systemd/network/
  (Commit `9b824890 <http://sourceforge.net/p/kaarpux/code/ci/9b824890f981994bc11a3fd1b511678063765eea/>`_)

- IMPROVE: KxTools: flist to disregard /share/gtk-doc
  (Commit `04fdf75a <http://sourceforge.net/p/kaarpux/code/ci/04fdf75aca6428c75dc6d0ad26c6e278d157cbbb/>`_)

- IMPROVE: vinagre: move spice-gtk before vinagre to get spice in remote desktop viever
  (Commit `4e0952e1 <http://sourceforge.net/p/kaarpux/code/ci/4e0952e1c4195bd8e04d8066de00868c1a799965/>`_)

- IMPROVE: KxBuild: run kvm with -cpu host
  (Commit `52400b37 <http://sourceforge.net/p/kaarpux/code/ci/52400b37f7a4f07b6ca0ea05a0f26536791d3fda/>`_)

- UPD: KxBuild: use deadline io scheduler
  (Commit `0ea86ad4 <http://sourceforge.net/p/kaarpux/code/ci/0ea86ad4f44ca629a4316f1272863ed9fd26881e/>`_)


Documentation Changes
#####################

- DOC: KaarPux: updated CVE info
  (Commit `02925319 <http://sourceforge.net/p/kaarpux/code/ci/02925319b60aa4360e6e9524581b928fd97e1063/>`_)


