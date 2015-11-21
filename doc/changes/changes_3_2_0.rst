.. 
   KaarPux: http://kaarpux.kaarposoft.dk
   Copyright (C) 2015: Henrik Kaare Poulsen
   License: http://kaarpux.kaarposoft.dk/license.html

.. _changes_3_2_0:


================================
Changes in KaarPux version 3.2.0
================================

:program:`KaarPux` version ``3.2.0`` released on ``2012-oct-17``

Security updates, printing, updates, and additions.


Security Updates
################

- UPD: nspr: v 4.9.2
  (Commit `0b14f297 <http://sourceforge.net/p/kaarpux/code/ci/0b14f297947bad1d367bfe5ac695a222eb160211/>`_)

- UPD: xulrunner firefox thunderbird: v 16.0.1
  (Commit `bfd7cd81 <http://sourceforge.net/p/kaarpux/code/ci/bfd7cd818ca72e6252cbf0a02fc975b7e2d76ba2/>`_)

- UPD: noscript: v 2.5.7
  (Commit `22d54015 <http://sourceforge.net/p/kaarpux/code/ci/22d54015357c34583009364532f6405cd09200eb/>`_)

- UPD: flash_player_11: v 11.2.202.243
  (Commit `d88572ca <http://sourceforge.net/p/kaarpux/code/ci/d88572ca95bda34583b1cd8496da965972492433/>`_)


Improved Printing
#################

- UPD: cups: v 1.6.1
  (Commit `12b9fbc1 <http://sourceforge.net/p/kaarpux/code/ci/12b9fbc1e42c18b44dec323005924b75d03f2281/>`_)

- MINOR: cups: remove 'hold' and related documentation
  (Commit `3bfbb9dd <http://sourceforge.net/p/kaarpux/code/ci/3bfbb9dd8c797c13b85f8b95f9e9cec1d137f506/>`_)

- FIX: cups: add systemd patch, and improved configure options
  (Commit `6665c36c <http://sourceforge.net/p/kaarpux/code/ci/6665c36c96399d14836ac9453dadeaa830376ace/>`_)

- IMPROVE: cups: do not delete files in /usr/share
  (Commit `7cc758fa <http://sourceforge.net/p/kaarpux/code/ci/7cc758fa8653f46019e825cae5558dec5d6c1944/>`_)

- IMPROVE: cups: ArchLinux patches
  (Commit `a9568161 <http://sourceforge.net/p/kaarpux/code/ci/a95681610d61aec3766cf540807467cb03b5a5e5/>`_)

- IMPROVE: cups: move cups before gtk+ so gtk+ builds cups printing backend
  (Commit `fd3db155 <http://sourceforge.net/p/kaarpux/code/ci/fd3db1558d0607ef4a117e6ce8ec0fd3b66ae887/>`_)

- ADD: ijs qpdf cups-filters cups-filters hplip
  (Commit `751dd906 <http://sourceforge.net/p/kaarpux/code/ci/751dd90677fc24b0de80c53dc39bdfa5e6427d36/>`_)

- FIX: hplip: do not barf if /etc/xdg/autostart/hplip-systray.desktop is not found on install
  (Commit `51c718e3 <http://sourceforge.net/p/kaarpux/code/ci/51c718e3b541165fab9978909a38706ee7bbbb26/>`_)

- IMPROVE: hplip: do not start hplip-systray; we did not install the GUI
  (Commit `7214caee <http://sourceforge.net/p/kaarpux/code/ci/7214caee436699a8ca94a187f636ad5a0280c8b5/>`_)

- ADD: net-snmp
  (Commit `9ce39d5a <http://sourceforge.net/p/kaarpux/code/ci/9ce39d5a8e03455e33a3ef4b341bd2b55ec74bb5/>`_)

- ADD: nss-mdns: avahi plugin for GNU Name Service Switch
  (Commit `c8c75c3d <http://sourceforge.net/p/kaarpux/code/ci/c8c75c3d30af0dbd175d7352bcc5025fcb80f3be/>`_)

- MINOR: nss-mdns: remove defunct installed version check
  (Commit `8df64e2b <http://sourceforge.net/p/kaarpux/code/ci/8df64e2b3aa890e0ce4fc81866a7338caf98ef64/>`_)

- IMPROVE: iptables: track snmp connections
  (Commit `02152c43 <http://sourceforge.net/p/kaarpux/code/ci/02152c431af974e0fcfad72a53467e1bae512ba1/>`_)

- IMPROVE: iptables: allow mDNS multicast and conntrack --ctstate RELATED
  (Commit `df915bfc <http://sourceforge.net/p/kaarpux/code/ci/df915bfc93935ad761e11e2fb5468564e4308a14/>`_)


Haskell
#######

- IMPROVE: KxBuild: ability to handle haskell_modules
  (Commit `65777707 <http://sourceforge.net/p/kaarpux/code/ci/65777707eb9c7d3e51dbddcd4c067366d6ac0351/>`_)

- ADD: ghc-binary ghc haskell-platform: Haskell
  (Commit `3e204842 <http://sourceforge.net/p/kaarpux/code/ci/3e2048427142e07fe68b122ad02e27002de4d694/>`_)

- ADD: haskell_modules
  (Commit `e74380c7 <http://sourceforge.net/p/kaarpux/code/ci/e74380c7ef6fd99a77dd660e1ec8bc5d601ecadb/>`_)

- ADD: bustle: Bustle is a better dbus-monitor (written in Haskell)
  (Commit `a27fcbc8 <http://sourceforge.net/p/kaarpux/code/ci/a27fcbc850e1022cb5f8788a7af8be717c9b9956/>`_)

- IMPROVE: bustle: install bustle-pcap
  (Commit `2e20ef55 <http://sourceforge.net/p/kaarpux/code/ci/2e20ef5580e5586769c5ed89e8d823c0c6592818/>`_)


Bugs Fixed
##########

- FIX: bash: install /etc/skel/.bash_profile
  (Commit `a2f2a68c <http://sourceforge.net/p/kaarpux/code/ci/a2f2a68c674c23e61169942ae823eef50c9a9cb9/>`_)

- FIX: shared-mime-info: make -j1
  (Commit `7f2cff4f <http://sourceforge.net/p/kaarpux/code/ci/7f2cff4f21faf71ae5e9020dba4282316a2eaecd/>`_)


Packages Added
##############

- ADD: graphviz: graph visualization software
  (Commit `de09aaad <http://sourceforge.net/p/kaarpux/code/ci/de09aaadf14208d5a783ec63618f505a00b1c2ac/>`_,
  `4b14d64c <http://sourceforge.net/p/kaarpux/code/ci/4b14d64cb45c3cb7425d5a4a37ead80d855fa81c/>`_)

- ADD: d-feet
  (Commit `14e0130b <http://sourceforge.net/p/kaarpux/code/ci/14e0130b93b1a8ad198c6e87d9159d322bc610ef/>`_)

- ADD: help2man
  (Commit `bfb7781f <http://sourceforge.net/p/kaarpux/code/ci/bfb7781f7e41aefd9c084859e133384c283fed2a/>`_)

- ADD: yajl: Yet Another JSON Library (prereq for xen)
  (Commit `1eddc4df <http://sourceforge.net/p/kaarpux/code/ci/1eddc4df46306969a0b65dad6652ce456b365507/>`_)


Packages Updated
################

- UPD: systemd: v 192
  (Commit `fa0adef1 <http://sourceforge.net/p/kaarpux/code/ci/fa0adef1cb9870016c1142506dab5b9c2ab13ace/>`_)

- UPD: certdata: v 1.85 - no real certificate changes, just version # and license
  (Commit `299f5ae8 <http://sourceforge.net/p/kaarpux/code/ci/299f5ae82c57d1c3b9a388694917c62322da0ca5/>`_)

- UPD: xen: v 4.2.0
  (Commit `16ee5da7 <http://sourceforge.net/p/kaarpux/code/ci/16ee5da7cfc1628cc2da54c6af6dbcb4b8fb9d35/>`_)

- UPD: network-manager-applet: v 0.9.6.2
  (Commit `104af47e <http://sourceforge.net/p/kaarpux/code/ci/104af47e16ae19f05723abd4af08adfa7e56b485/>`_)

- UPD: ghostscript: v 9.06
  (Commit `63c73905 <http://sourceforge.net/p/kaarpux/code/ci/63c73905c9acfd190c1a07d55917df8e6588ed99/>`_)

- UPD: linux: v 3.6.2
  (Commit `ed194e13 <http://sourceforge.net/p/kaarpux/code/ci/ed194e13d8a10ec0a4a6b2747036184ed76d9fb3/>`_)

- UPD: systemtap: v 2.0
  (Commit `fe54376a <http://sourceforge.net/p/kaarpux/code/ci/fe54376aab80e43096dc57ce284dffb841622168/>`_)


Minor Changes
#############

- IMPROVE: systemd: Do not start getty on VT1 (where we get log messages), but on VT2
  (Commit `bbfda9ae <http://sourceforge.net/p/kaarpux/code/ci/bbfda9aef621bcf01c0501a897f0a3b21aaf33dd/>`_)

- MINOR: yajl: remove defunct version check
  (Commit `cb4e932b <http://sourceforge.net/p/kaarpux/code/ci/cb4e932be834960072cdad56b648b7f6b4fed0c3/>`_)

- IMPROVE: fontforge: explicitly specify --with-freetype-src
  (Commit `1113a040 <http://sourceforge.net/p/kaarpux/code/ci/1113a040694fd49b39b675f80d33cd5660e2cac9/>`_)

- IMPROVE: kx_changelog: better grouping of entries
  (Commit `886859ab <http://sourceforge.net/p/kaarpux/code/ci/886859ab4f8d0f39d22ad8f556c7f59c7aa41665/>`_)

- IMPROVE: iptables: /etc/iptables_disable.sh script to disable firewall
  (Commit `398ed798 <http://sourceforge.net/p/kaarpux/code/ci/398ed798110ce53033c5e3e123de2a710a77a0bc/>`_)

- IMPROVE: iptables: /etc/iptables_show.sh script to show firewall status
  (Commit `a7975d7e <http://sourceforge.net/p/kaarpux/code/ci/a7975d7ebe6c69b73f15346baf3621b7be7b8cbe/>`_)

- Many documentation improvements.
