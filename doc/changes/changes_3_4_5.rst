.. 
   KaarPux: http://kaarpux.kaarposoft.dk
   Copyright (C) 2015: Henrik Kaare Poulsen
   License: http://kaarpux.kaarposoft.dk/license.html

.. _changes_3_4_5:


================================
Changes in KaarPux version 3.4.5
================================


:program:`KaarPux` version ``3.4.5`` released on ``2012-feb-21``

Several upstream security fixes

- Linux kernel security update

- Java / IcedTea security update

- Mozilla security updates

- Other security updates

- Several (mostly minor) changes


Linux kernel security update
############################

- UPD: linux: v 3.7.9
  (Commit `60905ae0 <http://sourceforge.net/p/kaarpux/code/ci/60905ae082400a2195783d0e9820e945282f8b64/>`_)
  Fixes `CVE-2013-0871 <http://seclists.org/oss-sec/2013/q1/326>`_

- UPD: systemtap: v 2.1: Works with newest kernel 3.7.9
  (Commit `05f9f458 <http://sourceforge.net/p/kaarpux/code/ci/05f9f4588ed6c97d1a4fb001944d16c9e660c34d/>`_)


Java / IcedTea security update
##############################

- UPD: icedtea: v 2.3.7: multiple security fixes
  (Commit `27b70e6f <http://sourceforge.net/p/kaarpux/code/ci/27b70e6fe8afb16286b6e6abe7effd0bd10658f2/>`_)
  See `GNU/Andrew’s Blog: IcedTea 2.1.6, 2.2.6 & 2.3.7 for OpenJDK 7 Released! <http://blog.fuseyism.com/index.php/2013/02/20/security-icedtea-2-1-6-2-2-6-2-3-7-for-openjdk-7-released/>`_


Mozilla security updates
########################

- UPD: nss: v 3.14.3
  (Commit `b34edfa4 <http://sourceforge.net/p/kaarpux/code/ci/b34edfa4fc58e1eb6f7a0c851f38d6cd9de0f190/>`_)
  Fixes `CVE-2013-1620 <https://bugzilla.mozilla.org/show_bug.cgi?id=822365>`_

- UPD: thunderbird: v 17.0.3
  (Commit `63db18c6 <http://sourceforge.net/p/kaarpux/code/ci/63db18c6f08da9afd7d051c3df91aeec3401bb36/>`_)

- UPD: xulrunner firefox: v 19.0
  (Commit `f0c9adf8 <http://sourceforge.net/p/kaarpux/code/ci/f0c9adf848ed96e161b743b91b2e55ad9a181761/>`_)

- UPD: adblockplus: v 2.2.3
  (Commit `0a5e723c <http://sourceforge.net/p/kaarpux/code/ci/0a5e723c80d461912242addcd77b3aff42a227f0/>`_)

- UPD: noscript 2.6.5.7
  (Commit `f87bb2aa <http://sourceforge.net/p/kaarpux/code/ci/f87bb2aa14e9da78b8e2b6bd936989ab74f78b15/>`_)


Other security updates
######################

- UPD: openssl: v 1.0.1e
  (Commit `2e82f17a <http://sourceforge.net/p/kaarpux/code/ci/2e82f17a79539dd8da13693d553ada2562a02114/>`_)

- UPD: gnutls: v 3.1.8
  (Commit `5ab85d8c <http://sourceforge.net/p/kaarpux/code/ci/5ab85d8c28dd02ed4214024d4b65983b95a91086/>`_)


Several (mostly minor) changes
##############################

- FIX: KaarPux: make empty  master/verify/verify_cli/tests/ directory
  (Commit `e38ecdc5 <http://sourceforge.net/p/kaarpux/code/ci/e38ecdc5b8f358f233bcf38821aeccc344632362/>`_)

- ADD: pigz: A parallel implementation of gzip for modern multi-processor, multi-core machines
  (Commit `827bafa7 <http://sourceforge.net/p/kaarpux/code/ci/827bafa7f597d1c72347fe0d9e808f43dc16b684/>`_)

- ADD: pygobject2 pygtk: Re-introduce deprecated python bindings
  (Commit `64d3dffb <http://sourceforge.net/p/kaarpux/code/ci/64d3dffb212179a4c62a96fa4ca523c8bdc94443/>`_)

- IMPROVE: KaarPux: Test framework
  (Commit `4ff8bb64 <http://sourceforge.net/p/kaarpux/code/ci/4ff8bb64704666d35c33ccb6ab08586f7582b4b2/>`_)

- IMPROVE: KaarPux: Toolchain tests
  (Commit `d2692811 <http://sourceforge.net/p/kaarpux/code/ci/d2692811b4d6c828e6093ed124813b6aeae59f74/>`_)

- IMPROVE: \*: simple verification testcases
  (Commit `a49f02f6 <http://sourceforge.net/p/kaarpux/code/ci/a49f02f64651183adcef3edc95b3ecb7afc37b4d/>`_)

- IMPROVE: KaarPux: make verify_toolchain reentrant
  (Commit `5d33da87 <http://sourceforge.net/p/kaarpux/code/ci/5d33da87fe817f2dfb0447e7311f055e87f14ba1/>`_)

- MINOR: wget: favor OpenSSL over gnuTLS (not yet installed)
  (Commit `38ea5db2 <http://sourceforge.net/p/kaarpux/code/ci/38ea5db2350c1cd71fe126424074b32a79aa3ff5/>`_)

- FIX: wget: do not use openSSL in bootstrap_8 (since openSSL is not available yet
  (Commit `8d63fbeb <http://sourceforge.net/p/kaarpux/code/ci/8d63fbeb4791152a0a4f754c81ea56d70f3964ff/>`_)

- DOC: www: Document toolchain and CLI verification
  (Commit `412a994a <http://sourceforge.net/p/kaarpux/code/ci/412a994ad6df727506b00890383efe1ed6cc7f4d/>`_)
  (Commit `6e0fb9a7 <http://sourceforge.net/p/kaarpux/code/ci/6e0fb9a7f4bde0ede8348be84d8ebef25c1017da/>`_)


