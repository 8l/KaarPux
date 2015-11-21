.. 
   KaarPux: http://kaarpux.kaarposoft.dk
   Copyright (C) 2015: Henrik Kaare Poulsen
   License: http://kaarpux.kaarposoft.dk/license.html

.. _changes_4_1_4:


================================
Changes in KaarPux version 4.1.4
================================


:program:`KaarPux` version ``4.1.4`` released on ``2014-mar-06``

- gnutls version 3.2.12.1 - security update

- packages added: xerces, pwsafe

- bugs fixed, packages and documentation updated


Major Changes
#############

UPD: gnutls: v 3.2.12.1 - security update
=========================================

(Commit `fa542481 <http://sourceforge.net/p/kaarpux/code/ci/fa5424812b57407167f042c41d0c810207e7f5a8/>`_,
`8197cfe8 <http://sourceforge.net/p/kaarpux/code/ci/8197cfe877eee50af9c75c749a948101af46ed03/>`_)

See `GNUTLS-SA-2014-2 <http://www.gnutls.org/security.html#GNUTLS-SA-2014-2>`_


Bugs fixed
##########

- FIX: pwsafe: add GPG key used for signing
  (Commit `261f13d2 <http://sourceforge.net/p/kaarpux/code/ci/261f13d246ed07d9a828e5f1d4e122d3a23b842d/>`_)

- FIX: xerces-c: no signature file available
  (Commit `615319b1 <http://sourceforge.net/p/kaarpux/code/ci/615319b1ba321cc122809a9c69982f1372fba48f/>`_)

- FIX: cyrus-sasl: fix configure options and CFLAGS
  (Commit `4ee0acdd <http://sourceforge.net/p/kaarpux/code/ci/4ee0acdda62e2e208dc62bafe04da3762a8651ba/>`_)


Packages added
##############

- ADD: xerces: prereq for pwsafe
  (Commit `18ecc376 <http://sourceforge.net/p/kaarpux/code/ci/18ecc37654335e8d567ca9ff8beab2e0d9611afa/>`_)

- ADD: pwsafe: v 0.93BETA
  (Commit `d46e9edb <http://sourceforge.net/p/kaarpux/code/ci/d46e9edbaf45c92edf0a4c2a37a6062049768fa2/>`_)


Packages updated
################

- UPD: curl: v 7.35.0
  (Commit `bdc6ce62 <http://sourceforge.net/p/kaarpux/code/ci/bdc6ce6252d3aa77d036c9e5c4149310644ba484/>`_)

- UPD: certdata: v 824017eda3df
  (Commit `a241be2d <http://sourceforge.net/p/kaarpux/code/ci/a241be2d6799f90fde59cd8714e0e0cc8c9bdb64/>`_)

- UPD: adblockplus: v 2.5.1
  (Commit `d5c3413d <http://sourceforge.net/p/kaarpux/code/ci/d5c3413d358b9d82b3ad50209b7154ca3d30e420/>`_)

- UPD: dhcpcd: v 6.3.1
  (Commit `333cadba <http://sourceforge.net/p/kaarpux/code/ci/333cadba963dcc676e97f553abdc57a183dec39f/>`_)

- UPD: noscript: v 2.6.8.16
  (Commit `b3c37948 <http://sourceforge.net/p/kaarpux/code/ci/b3c37948d4521697fad7c734d0d0b308a22de0ea/>`_)

- UPD: linux: v 3.13.5
  (Commit `6bc5ce37 <http://sourceforge.net/p/kaarpux/code/ci/6bc5ce37ab077f51417613231a6b6a0a34231037/>`_)

- UPD: Python: 3.3.4
  (Commit `a5bc0636 <http://sourceforge.net/p/kaarpux/code/ci/a5bc0636244686d866e6b21c07155dbb88df5a2c/>`_)


Minor Changes
#############

- IMPROVE: KaarPux: Track Relevant Common Vulnerabilities and Exposures
  (Commit `7f3f121c <http://sourceforge.net/p/kaarpux/code/ci/7f3f121c0e776e5ca428cde32dc4fe8f546b5bdd/>`_)

- IMPROVE: glibc: do not use PARALLELMFLAGS
  (Commit `affdef6b <http://sourceforge.net/p/kaarpux/code/ci/affdef6b2b91bc90e751dd4c20d00fe242b14379/>`_)

- IMPROVE: certdata: upstream check returning ? on mismatch
  (Commit `1eae9923 <http://sourceforge.net/p/kaarpux/code/ci/1eae99233031e75dcc55f9fd9004641cb13a938f/>`_)

- MINOR: remove left-overs from static IP, which we do not use anymore
  (Commit `46f6f2d8 <http://sourceforge.net/p/kaarpux/code/ci/46f6f2d83fc1db904938d29aca4ac21f2e925c37/>`_)

- IMPROVE: KxBuild: scripts for installing host packages
  (Commit `9409b935 <http://sourceforge.net/p/kaarpux/code/ci/9409b93549064f8aee30f68e1ba8de8543e0fe71/>`_)

- IMPROVE: KxTools: do not use google as CVE keyword
  (Commit `aef1eaa8 <http://sourceforge.net/p/kaarpux/code/ci/aef1eaa8b9b5ba89f7a1981628a60f465358b2e7/>`_)

- MINOR: KxTools: typo in help
  (Commit `ec794bd3 <http://sourceforge.net/p/kaarpux/code/ci/ec794bd33e95ebb989c577618d484d8b3e637588/>`_)


Documentation Changes
#####################

- DOC: certdata: update info on how to find and update certdata.txt
  (Commit `7ccf882b <http://sourceforge.net/p/kaarpux/code/ci/7ccf882bf825b5087704b74fd54038062c02d408/>`_)

- DOC: KaarPux: updated CVE info
  (Commit `4cf67102 <http://sourceforge.net/p/kaarpux/code/ci/4cf671020ac5ba808e6bac72e3b889720ec2ed01/>`_)

- DOC: www: css revised to give slightly more readable homepage
  (Commit `106aed6d <http://sourceforge.net/p/kaarpux/code/ci/106aed6d3657fa933845b8d38f5bc23a636fa0b3/>`_)

- DOC: www: improved description on how to build KaarPux
  (Commit `533dbc90 <http://sourceforge.net/p/kaarpux/code/ci/533dbc90f93bf0c51fc154e3264f5e503e560089/>`_)

- DOC: KaarPux: updated CVE info
  (Commit `243d3803 <http://sourceforge.net/p/kaarpux/code/ci/243d3803d8a63b4d80ae762502b5505921dcb15d/>`_)

- DOC: KaarPux: updated CVE info
  (Commit `efd87496 <http://sourceforge.net/p/kaarpux/code/ci/efd87496742c188ed6f0a1a8c6be346e5eaa3a56/>`_)


