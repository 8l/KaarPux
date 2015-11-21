.. 
   KaarPux: http://kaarpux.kaarposoft.dk
   Copyright (C) 2015: Henrik Kaare Poulsen
   License: http://kaarpux.kaarposoft.dk/license.html

.. _changes_3_4_4:


================================
Changes in KaarPux version 3.4.4
================================


:program:`KaarPux` version ``3.4.4`` released on ``2013-feb-13``

- Java security update

- Flashplayer security update

- Mozilla updates

- Bugs fixed, packages updated, and other minor changes


Java security update
####################

- UPD: icedtea: v 2.3.6
  (Commit `55294ce9 <http://sourceforge.net/p/kaarpux/code/ci/55294ce9de47bb254376481e6dd521be0481b945/>`_)
  See `GNU/Andrew’s Blog: IcedTea 2.3.6 Released! <http://blog.fuseyism.com/index.php/2013/02/13/security-icedtea-2-3-6-released/>`_


Flashplayer security update
###########################

- UPD: flash_player_11: v 11.2.202.270
  (Commit `0e7320ef <http://sourceforge.net/p/kaarpux/code/ci/0e7320efe2643b0bfcebab9ff3c7b6ed8f646f57/>`_;` c77141d1 <http://sourceforge.net/p/kaarpux/code/ci/c77141d1f82e197dc01ec3995f8b64cb30a74cb7/>`_)


Mozilla updates
###############

- UPD: firefox xulrunner: v 18.0.2
  (Commit  `4151bfd3 <http://sourceforge.net/p/kaarpux/code/ci/4151bfd39e7d3eb91446e4958fca4286625f6651/>`_;  `b14d3054 <http://sourceforge.net/p/kaarpux/code/ci/b14d3054fb66724e7584bed9b9a5c7af75018040/>`_)

- UPD: nss: v 3.14.2
  (Commit `46aa236a <http://sourceforge.net/p/kaarpux/code/ci/46aa236abf76db7c2a11056a763ce5089360cfbc/>`_)

- UPD: adblockplus: v 2.2.2
  (Commit `a05002f9 <http://sourceforge.net/p/kaarpux/code/ci/a05002f98fde154babb91236a2ad8695369010f8/>`_)

- UPD: noscript: v 2.6.4.4
  (Commit `f92d5f8d <http://sourceforge.net/p/kaarpux/code/ci/f92d5f8d597be6ed9a1f50e2561f816b7188aaa6/>`_)


Bugs fixed
##########

- FIX: cups-filters: patch to work with poppler 0.22.0
  (Commit `262c5c2a <http://sourceforge.net/p/kaarpux/code/ci/262c5c2ae4411300bb94ef196cc141875e2448b3/>`_)


Packages updated
################

- UPD: samba: v 4.0.2
  (Commit `bd40e9f7 <http://sourceforge.net/p/kaarpux/code/ci/bd40e9f7d4076394a8f995be2bec96052b0313c9/>`_;  `759f1e0a <http://sourceforge.net/p/kaarpux/code/ci/759f1e0a070ff3e4ea951b8ebb073c596949bcc6/>`_)

- UPD: poppler: v 0.22.0
  (Commit `74adfcd5 <http://sourceforge.net/p/kaarpux/code/ci/74adfcd5d78fc14163ee1dc4df07e1c59c232085/>`_)

- UPD: lcms2: v 2.4
  (Commit `9d32d22a <http://sourceforge.net/p/kaarpux/code/ci/9d32d22a1e380f24eb688a3c8d7a091f146f116b/>`_)

- UPD: openssl: v 1.0.1d
  (Commit `1fecbc19 <http://sourceforge.net/p/kaarpux/code/ci/1fecbc194d35460deed859a08525efeb47b0ba9d/>`_)

- UPD: openssh: v 6.1p1; and improved configure options
  (Commit `a53e8e62 <http://sourceforge.net/p/kaarpux/code/ci/a53e8e62204d7916a4be278a98abdc74e1554d9b/>`_)

- UPD: gvfs: v 1.14.2
  (Commit `f7235913 <http://sourceforge.net/p/kaarpux/code/ci/f7235913aa726808d74f9a38148c8678626bfa86/>`_)


Packages added
##############

- ADD: dosfstools: utilities for making and checking MS-DOS FAT filesystems
  (Commit `da169e13 <http://sourceforge.net/p/kaarpux/code/ci/da169e130930afc04d2604b5588ba8c792f218f7/>`_)

- ADD: poppler-data: encoding files for use with poppler
  (Commit `f6dcd252 <http://sourceforge.net/p/kaarpux/code/ci/f6dcd2525ed35618425b0df399d7a0221d8f3982/>`_)


Minor Changes
#############

- FIX: KxTools: kx_ver_wiz: add --force option
  (Commit `06694dd2 <http://sourceforge.net/p/kaarpux/code/ci/06694dd249f78f0dd0e39815fa92cb472f91bc7e/>`_)

- IMPROVE: bison binutils: move bison before binutils
  (Commit `b4f07572 <http://sourceforge.net/p/kaarpux/code/ci/b4f075721bc309cd769f6280b9de5c727cc08521/>`_)

- IMPROVE: binutils gcc: Enable Link-Time-Optimization and ld.gold linker
  (Commit `b34bdcc8 <http://sourceforge.net/p/kaarpux/code/ci/b34bdcc82d41e3a2d4dfb95f4e127e395c16faef/>`_)

- REMOVE: tcp_wrappers: not needed anymore
  (Commit `f715acff <http://sourceforge.net/p/kaarpux/code/ci/f715acff85c5d6b5ced755409f5ad41ad5135c01/>`_)

- IMPROVE: linux: CONFIG_SENSORS_CORETEMP=m
  (Commit `4b88e35c <http://sourceforge.net/p/kaarpux/code/ci/4b88e35c8da49c9b4c8342181aca393490afcad2/>`_)

- IMPROVE: pam: only use systemd session on real logins
  (Commit `6f6e9d00 <http://sourceforge.net/p/kaarpux/code/ci/6f6e9d007a9ee7c3ffcebe19a004a3df19a88556/>`_)

- IMPROVE: ntpd: Do not start ntpd under virtualization
  (Commit `e0cb3f35 <http://sourceforge.net/p/kaarpux/code/ci/e0cb3f359310296849a9fbe8226ca36018333cb1/>`_)

- IMPROVE: KxBuild: Do not set password for kxbuild user
  (Commit `57527041 <http://sourceforge.net/p/kaarpux/code/ci/575270416c9f0b47aa6570fbf3b13a4d99dec745/>`_)

- IMPROVE: KxBuild: dangerous_build_bootstrap: better password setting instructions
  (Commit `c70e5721 <http://sourceforge.net/p/kaarpux/code/ci/c70e57215392fba13d0df2c0b40c0f3690bb3142/>`_)

- DOC: www: setting hostname after copying KaarPux
  (Commit `e6b8c8a9 <http://sourceforge.net/p/kaarpux/code/ci/e6b8c8a93cdc9ebcfde0d07dcc8869d2c87d8793/>`_)


