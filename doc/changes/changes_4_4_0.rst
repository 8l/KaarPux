.. 
   KaarPux: http://kaarpux.kaarposoft.dk
   Copyright (C) 2015: Henrik Kaare Poulsen
   License: http://kaarpux.kaarposoft.dk/license.html

.. _changes_4_4_0:


================================
Changes in KaarPux version 4.4.0
================================


:program:`KaarPux` version ``4.4.0`` released on ``2014-jun-09``

- Security Updates

- GNOME 3.12

- Other Packages updated

- Bugs fixed; minor changes; documentation updates


Security Updates
################

- UPD: gnutls: v 3.2.15; fixes CVE-2014-3466
  (Commit `5c2e22a2 <http://sourceforge.net/p/kaarpux/code/ci/5c2e22a28ae7151510b2f26ffe03fa374a497ea0/>`_)

- UPD: openssl: v 1.0.1h
  (Commit `331b01f5 <http://sourceforge.net/p/kaarpux/code/ci/331b01f5af7affebda41b9c76424941b3dcc5cfd/>`_)

- UPD: linux: v 3.14.5
  (Commit `8d88070d <http://sourceforge.net/p/kaarpux/code/ci/8d88070d4831bf3614cbc93552dd3f4c7031f4f2/>`_)

- UPD: samba: v 4.1.8
  (Commit `26efe6a0 <http://sourceforge.net/p/kaarpux/code/ci/26efe6a03a4344af7e6f58dcbcae65340300257a/>`_)

- FIX: samba: remove old patch
  (Commit `339a07ce <http://sourceforge.net/p/kaarpux/code/ci/339a07ce24d84672fc45f4e51ad5dc081114692f/>`_)


GNOME 3.12
##########

- IMPROVE: KxTools: kx_gnome: more thorough processing of gnome packages
  (Commit `5fa3c3c3 <http://sourceforge.net/p/kaarpux/code/ci/5fa3c3c319f4e86dfc802bc96be257c3717c2fa6/>`_)

- UPD: \*: GNOME 3.12.2
  (Commit `80f62bcc <http://sourceforge.net/p/kaarpux/code/ci/80f62bcca1d00efc3a6e7af39b6c653133a37297/>`_)


Other Packages updated
######################

- UPD: systemd: v 213
  (Commit `7a1c6329 <http://sourceforge.net/p/kaarpux/code/ci/7a1c6329be47f48bbf15ef15dc193ee29e6ad384/>`_)

- UPD: perl: v 5.20.0
  (Commit `7970ddf2 <http://sourceforge.net/p/kaarpux/code/ci/7970ddf269e0d8651ddfd8401d50cd44b4df7a01/>`_)

- UPD: perlmodules: IO-Compress Net-SSLeay IO-Socket-SSL
  (Commit `0a9f731e <http://sourceforge.net/p/kaarpux/code/ci/0a9f731ea765a069655ee60b637d8bf0f7737010/>`_)

- UPD: Python2: v 2.7.7
  (Commit `b21d269d <http://sourceforge.net/p/kaarpux/code/ci/b21d269d9c93bb7082cb262b22e5d77a39dfed43/>`_)

- UPD: adblockplus: v 2.6.3
  (Commit `4c5a128a <http://sourceforge.net/p/kaarpux/code/ci/4c5a128a5128eb77c1b9783894fa2f08233b5855/>`_)

- UPD: noscript: v 2.6.8.28
  (Commit `419a7f56 <http://sourceforge.net/p/kaarpux/code/ci/419a7f56fff3cde85e56cba1c0b4a9121412b1a3/>`_)

- UPD: libtasn1: v 3.6
  (Commit `14ee4bbf <http://sourceforge.net/p/kaarpux/code/ci/14ee4bbf979f50e00d3731f677216e9e1ef8b83e/>`_)


Bugs fixed
##########

- FIX: systemd: start DHCP on et* as well as en*
  (Commit `43efa669 <http://sourceforge.net/p/kaarpux/code/ci/43efa669f3a856c03376b3c7c64412f9078d2d79/>`_)

- FIX: linux: copy build directory to /lib/modules before it is deleted
  (Commit `c74ca62b <http://sourceforge.net/p/kaarpux/code/ci/c74ca62b3b6dbc3354fcc4250e6602457fe2a7ff/>`_)

- FIX: pysqlite: remove documentation installed in root dir
  (Commit `0578be07 <http://sourceforge.net/p/kaarpux/code/ci/0578be07552503233274d1299e587fc6a67970d5/>`_)

- FIX: openssl: do not install manual pages in /etc
  (Commit `16389d29 <http://sourceforge.net/p/kaarpux/code/ci/16389d2906e67526a4b3c50517a50ea9062523a4/>`_)

- FIX: KxBuild: kx_ver_perlmodules: correct upstream scrape URL
  (Commit `da913279 <http://sourceforge.net/p/kaarpux/code/ci/da913279a19baeb45767d74fae62687764f24409/>`_)

- FIX: perl: add -Dlibs=-lm to avoid picking up host libraries
  (Commit `3fe4c85e <http://sourceforge.net/p/kaarpux/code/ci/3fe4c85efb282c5a4f5223a9286693db7f9b7fa1/>`_)

- FIX: telepathy-mission-control: --disable-upower
  (Commit `d551850f <http://sourceforge.net/p/kaarpux/code/ci/d551850f5fe8bf013b08f614b2f4f3f9226ae7b6/>`_)

- FIX: libical: make -j1
  (Commit `f135634e <http://sourceforge.net/p/kaarpux/code/ci/f135634e77ee5c2790814c08a3357ca2c9f44e0a/>`_)


Minor Changes and Documentation Changes
#######################################

- IMPROVE: systemtap: use upstream patch for infinite loop in task_dentry_path
  (Commit `6bcd6aec <http://sourceforge.net/p/kaarpux/code/ci/6bcd6aec6a23898c8b6f194cc3d80d3ee5cc9284/>`_)

- IMPROVE: KxBuild: delete build directories after each package has been installed
  (Commit `1f851135 <http://sourceforge.net/p/kaarpux/code/ci/1f851135f958410767aedbc84107a7f21c7cd287/>`_)

- MINOR: download_packages_2: show which packages will be downloaded
  (Commit `230e105d <http://sourceforge.net/p/kaarpux/code/ci/230e105d81a8b29f489bc03f4204cacdfbb3f9d8/>`_)

- IMPROVE: flex: better upstream check
  (Commit `1550b928 <http://sourceforge.net/p/kaarpux/code/ci/1550b92829ae99c3766278dec16df0a71e777a6d/>`_)

- IMPROVE: libquvi-scripts: verify signature after download
  (Commit `11b202d9 <http://sourceforge.net/p/kaarpux/code/ci/11b202d9681c692204484e778934ded248f8a17f/>`_)

- DOC: xmlbeans: put comment on www
  (Commit `d7f27e0a <http://sourceforge.net/p/kaarpux/code/ci/d7f27e0af02ac871a732113732ddda1b6e88271c/>`_)

- DOC: www: 303 redirects for old gnome packages
  (Commit `183de6ae <http://sourceforge.net/p/kaarpux/code/ci/183de6ae26b12db2e6b9ba39eac6503735047da1/>`_)

- DOC: KaarPux: updated CVE info
  (Commit `4cf9e500 <http://sourceforge.net/p/kaarpux/code/ci/4cf9e50075d0b30a9be5b9b0dadc2ac2baf5ea5a/>`_)


