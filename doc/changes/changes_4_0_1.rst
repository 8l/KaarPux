.. 
   KaarPux: http://kaarpux.kaarposoft.dk
   Copyright (C) 2015: Henrik Kaare Poulsen
   License: http://kaarpux.kaarposoft.dk/license.html

.. _changes_4_0_1:


================================
Changes in KaarPux version 4.0.1
================================


:program:`KaarPux` version ``4.0.1`` released on ``2014-jan-17``

- Java updated to version 7 u 51 / IcedTea 2.4.4

- Flash Player updated to version 11.2.202.335

- Mozilla Firefox plugin updates

- Linux Kernel updated to version 3.12.8

- Minor improvements

.. COMMENT: 0 major changes
            3 bug fixes
            0 packages added
            7 packages updated
            25 minor changes
            2 documentation changes


Packages updated
################

- UPD: icedtea7: v 2.4.4
  (Commit `e596a868 <http://sourceforge.net/p/kaarpux/code/ci/e596a868466d95d1a6b3a89361d2929cd92e38af/>`_)

- FIX: icedtea7: add gpg key for Omair Majid (signed by Andrew John Hughes)
  (Commit `255a0e80 <http://sourceforge.net/p/kaarpux/code/ci/255a0e809d47054709993cbbe23061cb02feea28/>`_)

- UPD: flash_player_11: v 11.2.202.335
  (Commit `333c6b86 <http://sourceforge.net/p/kaarpux/code/ci/333c6b86eba67ca7e710302fd79afbfb4135c719/>`_)

- UPD: adblockplus: v 2.4.1
  (Commit `ab99bcbf <http://sourceforge.net/p/kaarpux/code/ci/ab99bcbf8a665364dafea45c37469bef5af79ecf/>`_)

- UPD: ghostery: v 5.1.0
  (Commit `300daf5d <http://sourceforge.net/p/kaarpux/code/ci/300daf5d548b71681b1eb19fc680e6ffc4c8d909/>`_)

- UPD: noscript: v 2.6.8.12
  (Commit `5e1732a3 <http://sourceforge.net/p/kaarpux/code/ci/5e1732a345cb964d132030a48b7a3beb3e80a0f5/>`_)

- UPD: linux: v 3.12.8
  (Commit `253e5b7d <http://sourceforge.net/p/kaarpux/code/ci/253e5b7da533adbec0d3f0c1e8e6b0b3c5dfa400/>`_)

- UPD: pylint: v 1.0.0
  (Commit `090dd85e <http://sourceforge.net/p/kaarpux/code/ci/090dd85eacb2e525210b47252e8454586cbb3f85/>`_)


Minor Changes
#############

- FIX: nss-mdns: move to packages/n
  (Commit `b600de67 <http://sourceforge.net/p/kaarpux/code/ci/b600de67db832efb0ffb37d329372258e51af492/>`_)

- FIX: KxTools: kx_ver_wiz to handle ftp:// correctly
  (Commit `383bac47 <http://sourceforge.net/p/kaarpux/code/ci/383bac4734936a79982bf14fbc69b321cf8c66e7/>`_)

- IMPROVE: KaarPux: Better sourceforge upstream version checking
  (Commit `65590e6e <http://sourceforge.net/p/kaarpux/code/ci/65590e6e979b9ef90303f9ef56755b8778a6cdde/>`_)

- IMPROVE: \*: better upstream version scripts
  (Commit `82ae3288 <http://sourceforge.net/p/kaarpux/code/ci/82ae3288cdff46482bddaf96d7b9088f46066955/>`_)

- Merge branch 'upd'
  (Commit `4b9d79d8 <http://sourceforge.net/p/kaarpux/code/ci/4b9d79d89a6d2dbc9a0f91e565bf5d7e50710409/>`_)

- MINOR: gtk-engines gnome-themes: remove unused packages
  (Commit `d6d792af <http://sourceforge.net/p/kaarpux/code/ci/d6d792af30a2f4fbf84a0afb07e30d5594b12cf3/>`_)

- MINOR: skype: do not mark as sensitive (as we do not have it in current 64 bit)
  (Commit `f1c8090d <http://sourceforge.net/p/kaarpux/code/ci/f1c8090de1232a281bb6a06764fee1ac2a660f65/>`_)

- MINOR: freeglut glibc WebKit: remove unused files
  (Commit `2a0b84fe <http://sourceforge.net/p/kaarpux/code/ci/2a0b84feeb79770be61aeaf1e0ff31f8ccfbd3ac/>`_)

- MINOR: \*: upstream version scripts for pypi packages
  (Commit `2f880abe <http://sourceforge.net/p/kaarpux/code/ci/2f880abeb043f0fe73e75148d956df2859ec3cf7/>`_)

- MINOR: taglib: better upstream version script
  (Commit `128d581f <http://sourceforge.net/p/kaarpux/code/ci/128d581f3297e835d7d752b8a6566c8e815abd34/>`_)

- MINOR: vigra: better upstream version script
  (Commit `161d33a1 <http://sourceforge.net/p/kaarpux/code/ci/161d33a111a8829124449f9e717f3852abb5f672/>`_)

- MINOR: openssl: better upstream version script
  (Commit `e9d47a80 <http://sourceforge.net/p/kaarpux/code/ci/e9d47a80652f0c7165f4c8aac6accff4b6744ae1/>`_)

- IMPROVE: KaarPux: improved installed version handling in xorg_modules
  (Commit `bff51e2b <http://sourceforge.net/p/kaarpux/code/ci/bff51e2b18658ded2d7b7315b9a19eee91a78357/>`_)

- IMPROVE: KaarPux: add installed_config tag for checking installed version with xxx-config script
  (Commit `259f15d5 <http://sourceforge.net/p/kaarpux/code/ci/259f15d505e7fcdcd4419ec6d80cc773788a225c/>`_)

- IMPROVE: \*: better installed version scripts
  (Commit `5541ac46 <http://sourceforge.net/p/kaarpux/code/ci/5541ac46cbd032e877ab091a8f3097defb976ec6/>`_)

- IMPROVE: libvpx: better version scripts
  (Commit `4811a611 <http://sourceforge.net/p/kaarpux/code/ci/4811a61166553ae04859914ab113807c625d5a18/>`_)

- IMPROVE: libwebp: better version scripts
  (Commit `ca024a73 <http://sourceforge.net/p/kaarpux/code/ci/ca024a7377773d60f9fa904f80ee90bf06e3c6ee/>`_)

- IMPROVE: KaarPux: add kxver_scrape_xml to kx_version
  (Commit `0e992f84 <http://sourceforge.net/p/kaarpux/code/ci/0e992f843450c3eb56dd28b1c95e9292cbab64e3/>`_)

- IMPROVE: json-c: now hosted on github
  (Commit `2c84ceae <http://sourceforge.net/p/kaarpux/code/ci/2c84ceaec44129170265cd434c5588326ec2b526/>`_)

- IMPROVE: vala: upstream_gnome_uneven
  (Commit `f7679d03 <http://sourceforge.net/p/kaarpux/code/ci/f7679d037f027f9aca07e1c3d7ec9c1533212391/>`_)

- IMPROVE: libgee: new www location; better version scripts
  (Commit `777c8d97 <http://sourceforge.net/p/kaarpux/code/ci/777c8d9738837d96c3868ad3d2ff846eb5503e52/>`_)

- IMPROVE: KxTools: better version wizard tools
  (Commit `ed062e3d <http://sourceforge.net/p/kaarpux/code/ci/ed062e3da5619deeddabc8948fe02fe059a514bb/>`_)

- IMPROVE: \*: better version info for version wizard
  (Commit `91a8c79d <http://sourceforge.net/p/kaarpux/code/ci/91a8c79d443a56ddbfdb877a2cfd962f2f57d1c3/>`_)

- IMPROVE: KxTools: generic kx_ver_wiz settings for gnome packages
  (Commit `1ab24b8f <http://sourceforge.net/p/kaarpux/code/ci/1ab24b8fa83b9bc380c5e085d6cd418b670970b7/>`_)

- IMPROVE: KxTools: kx_ver_wiz settings for perl modules
  (Commit `6da51ba2 <http://sourceforge.net/p/kaarpux/code/ci/6da51ba2ab53fc23a724b19114618d4479f8b314/>`_)

- MINOR: KxTools: better handling of source and news for kx_ver_wiz
  (Commit `16933039 <http://sourceforge.net/p/kaarpux/code/ci/169330395e6394534ae371b32fce2183d62239c5/>`_)

- MINOR: KxTools: small improvements for kx_ver_wiz
  (Commit `ed09f308 <http://sourceforge.net/p/kaarpux/code/ci/ed09f308c6069617f3e71e81d53306abda2438a6/>`_)

- DOC: www: copyright 2014
  (Commit `6917fd92 <http://sourceforge.net/p/kaarpux/code/ci/6917fd92b8dda61516c99d878450439c0b962c61/>`_)

- DOC: www: add a few links for getting browser information
  (Commit `d35b96a8 <http://sourceforge.net/p/kaarpux/code/ci/d35b96a87982c5330dfc91e07382a929240b5ad2/>`_)


