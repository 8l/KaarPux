.. 
   KaarPux: http://kaarpux.kaarposoft.dk
   Copyright (C) 2015: Henrik Kaare Poulsen
   License: http://kaarpux.kaarposoft.dk/license.html

.. _changes_4_2_5:


================================
Changes in KaarPux version 4.2.5
================================


:program:`KaarPux` version ``4.2.5`` released on ``2014-apr-29``

- linux version 3.14.2

- firefox version 29.0

- thunderbird version 24.5.0

- flash player version 11.2.202.356

- Many other package updates

- Improved build scripts and build documentation

- Bug fixes, minor improvements, documentation improvements


Packages updated
################

- UPD: linux: v 3.14.2
  (Commit `9126f23b <http://sourceforge.net/p/kaarpux/code/ci/9126f23bbd49455ae2412250e2a399db7f448df3/>`_,
  `de47174d <http://sourceforge.net/p/kaarpux/code/ci/de47174d3aad31ca6ab1164e366dad4088cb12f5/>`_)

- UPD: firefox: v 29.0
  (Commit `e29d74f7 <http://sourceforge.net/p/kaarpux/code/ci/e29d74f78ddff972dd2970d1b720423a35413428/>`_)

- UPD: thunderbird: v 24.5.0
  (Commit `aeef0d25 <http://sourceforge.net/p/kaarpux/code/ci/aeef0d251ec50bcd2a0c309d6c582ef051fed41d/>`_)

- UPD: flash_player_11: v 11.2.202.356
  (Commit `6d443feb <http://sourceforge.net/p/kaarpux/code/ci/6d443feb89d6ae613f30e3e2df643ca6fd170586/>`_)

- UPD: certdata: v ac5db8c74ac0
  (Commit `ea4729bf <http://sourceforge.net/p/kaarpux/code/ci/ea4729bf075b40f025a6da8945ae7cc1298be3fb/>`_)

- UPD: ghostery: v 5.2.1
  (Commit `f2b53db5 <http://sourceforge.net/p/kaarpux/code/ci/f2b53db5fd196a613a410fb79a77004e5cf029e7/>`_)

- UPD: noscript: v 2.6.8.20
  (Commit `3fc82dd1 <http://sourceforge.net/p/kaarpux/code/ci/3fc82dd17a7b6314cae4bc431f54beae43ae8d0b/>`_)

- UPD: curl: v 7.36.0 (security!)
  (Commit `f69b6124 <http://sourceforge.net/p/kaarpux/code/ci/f69b612479eef04beb61c1f62e1d89474766ae73/>`_)

- UPD: qemu: v 2.0.0
  (Commit `36831665 <http://sourceforge.net/p/kaarpux/code/ci/3683166518e7d6685cccd647919ce8636e5c4a2d/>`_)

- UPD: libgphoto2: v 2.5.4
  (Commit `ecb22013 <http://sourceforge.net/p/kaarpux/code/ci/ecb22013af0963f007838e81ebc664cde958e9be/>`_)

- UPD: gvfs: v 1.20.1
  (Commit `02ac4fba <http://sourceforge.net/p/kaarpux/code/ci/02ac4fba60d637fd76b3f1640bc330de1d45e53b/>`_)

- UPD: eclipse: v 4.3.2
  (Commit `9571004e <http://sourceforge.net/p/kaarpux/code/ci/9571004eed15866a9fb895f8af89a69a73285386/>`_)

- UPD: foomatic-db: v 20140325; also change download location
  (Commit `72c9be2d <http://sourceforge.net/p/kaarpux/code/ci/72c9be2d129010f297bcf26ba45c73392b4d84e9/>`_)

- UPD: libwww-perl: v 6.05
  (Commit `5374001e <http://sourceforge.net/p/kaarpux/code/ci/5374001e454b28ff8e63f685e47f5ba2eab52496/>`_)

- UPD: sudo: v 1.8.10p2
  (Commit `546ac26e <http://sourceforge.net/p/kaarpux/code/ci/546ac26e089a43bdd8ccc96e987c88fcf2c0ac92/>`_)

- UPD: json-c: v 0.12
  (Commit `32e0008d <http://sourceforge.net/p/kaarpux/code/ci/32e0008d5bd2c0a950b073c5ff1fdc1a0f9e5365/>`_)

- UPD: cups: v 1.7.2
  (Commit `3aa905ca <http://sourceforge.net/p/kaarpux/code/ci/3aa905cab9c3587b52501d1be041394a9d823d89/>`_)

- UPD: MesaLib: v 10.1.1
  (Commit `0efb1a86 <http://sourceforge.net/p/kaarpux/code/ci/0efb1a86a662cedbe941cec958d426741fdda198/>`_)

- UPD: Python: v 3.4.0
  (Commit `1d112769 <http://sourceforge.net/p/kaarpux/code/ci/1d1127696d6caefeb7b528b624d7feb6f9361225/>`_)

- UPD: wireshark: v 1.10.7
  (Commit `a278029d <http://sourceforge.net/p/kaarpux/code/ci/a278029d71bd08627e888cc1796f2e8fe37ef0c3/>`_)

- UPD: cups-filters: v 1.0.53
  (Commit `daed49b6 <http://sourceforge.net/p/kaarpux/code/ci/daed49b6cd43769eb253e52c52e080e33eea3dca/>`_)


Improved build scripts and build documentation
##############################################

- FIX: make: configure --without-guile; fixes ticket #4
  (Commit `44c806f4 <http://sourceforge.net/p/kaarpux/code/ci/44c806f4200b680200306c09b3b38223e76d4d46/>`_)

- IMPROVE: KxBuild: Do not barf when host commands are not found
  (Commit `f9baff25 <http://sourceforge.net/p/kaarpux/code/ci/f9baff250a1c225b0ea0671142c8ecc399d341f6/>`_)

- IMPROVE: KxBuild: add more config options to kvm.sh
  (Commit `2915b9eb <http://sourceforge.net/p/kaarpux/code/ci/2915b9ebb42a8a250ac19b40c4774012fa38eab9/>`_)

- IMPROVE: KxBuild: use "time" (in quotes) instead of /bin/time
  (Commit `24479b9b <http://sourceforge.net/p/kaarpux/code/ci/24479b9bf67bfcda0376cc080aef9132c0c6eec0/>`_)

- MINOR: KxBuild: silence output of which gpg
  (Commit `03499ec6 <http://sourceforge.net/p/kaarpux/code/ci/03499ec60a4ef94f872dd860503229072406cdab/>`_)

- IMPROVE: KxBuild: Avoid potentially misleading 'Terminated' output when killing sadc
  (Commit `e381e2a4 <http://sourceforge.net/p/kaarpux/code/ci/e381e2a4ec4e7741b1c573688e2781af503a6a52/>`_)

- IMPROVE: certdata: move to bootstrap_8 phase
  (Commit `275b1ebf <http://sourceforge.net/p/kaarpux/code/ci/275b1ebf7874d160db37a253a09691745d1e3fab/>`_)

- IMPROVE: KxBuild: disable tests by default
  (Commit `0ac1605f <http://sourceforge.net/p/kaarpux/code/ci/0ac1605f2893f1a859142f0f060efd8273ab6eff/>`_)

- MINOR: KxBuild: improve identification of current version
  (Commit `569387fe <http://sourceforge.net/p/kaarpux/code/ci/569387fedc2e1f9446ef2a2de66ed7ef673c815f/>`_)

- DOC: www: document the need for YAML::Tiny on host system
  (Commit `e4e32c09 <http://sourceforge.net/p/kaarpux/code/ci/e4e32c0980c146757ed93dfe195546137e49aa4d/>`_)

- DOC: www: propose to use the fastest CPU frequency scaling governor
  (Commit `61148697 <http://sourceforge.net/p/kaarpux/code/ci/61148697abb55af38202e5207d646aaedd1ddc11/>`_)

- DOC: www: Users and SSH keys for KVM
  (Commit `5206767a <http://sourceforge.net/p/kaarpux/code/ci/5206767ae6cc4f5366065ebf44d4f02824edb4e5/>`_)

- DOC: www: clarify which usernames to use; fixes ticket #5
  (Commit `1570b392 <http://sourceforge.net/p/kaarpux/code/ci/1570b39295d919d987f24daf2b44677cd67778ea/>`_)

- DOC: www: put tool installation on host system first in build sequence
  (Commit `34e34d7d <http://sourceforge.net/p/kaarpux/code/ci/34e34d7de5521c86e15c0018584bb9649fec8679/>`_)

- DOC: www: do not recommend using the complete disk (no room for bootloader)
  (Commit `1cec42b1 <http://sourceforge.net/p/kaarpux/code/ci/1cec42b1eaf542ce417e0f7a118886f9f49d6655/>`_)

- DOC: www: remove grub-mkdevicemap, which grub does not have anymore
  (Commit `7139a14b <http://sourceforge.net/p/kaarpux/code/ci/7139a14bfb0dbc4462487f2806cdbdc3ffd2e859/>`_)

- DOC: www: mention that you can download_all_packages while Preparing to build KaarPux
  (Commit `d0a479c0 <http://sourceforge.net/p/kaarpux/code/ci/d0a479c0e62677f6c8f8a4cabe03e13683b23898/>`_)


Bugs fixed
##########

- FIX: \*: correct upstream locations
  (Commit `65f1e564 <http://sourceforge.net/p/kaarpux/code/ci/65f1e564b366044b852a71072f19188288696047/>`_)

- FIX: KxBuild: avahi is installed twice; first without gtk3 (as dependency to cups); later with gtk3
  (Commit `e83f9659 <http://sourceforge.net/p/kaarpux/code/ci/e83f965974254a8e6004b51bae62a74cc9d9227d/>`_)

- FIX: binutils: check  with -j1; parallel check fails
  (Commit `c1847613 <http://sourceforge.net/p/kaarpux/code/ci/c18476132d0c82bf4f44b20ae4d2e9b88150d182/>`_)

- FIX: flex: correct check
  (Commit `e606cbc3 <http://sourceforge.net/p/kaarpux/code/ci/e606cbc3ff968f652df0daea2db208a058d94bf8/>`_)

- FIX: KxBuild: move less and util-linux before gzip (for make check in gzip)
  (Commit `34a615a2 <http://sourceforge.net/p/kaarpux/code/ci/34a615a2206b9a222e10172d533c7edcadec7d11/>`_)

- FIX: KxBuild: move iana-etc to bootstrap_7 before perl (for perl: make check)
  (Commit `783159c5 <http://sourceforge.net/p/kaarpux/code/ci/783159c50ca432dda57f8f5a122a7fb76911fca4/>`_)

- FIX: util-linux: configure_tools -> configure_kx
  (Commit `17ca0ce8 <http://sourceforge.net/p/kaarpux/code/ci/17ca0ce8c798538d90daae54a5f1a4e6914c807f/>`_)

- FIX: gettext: check with -j1
  (Commit `773ba41f <http://sourceforge.net/p/kaarpux/code/ci/773ba41f5363e0701e2b64c697eed7156349c1be/>`_)

- FIX: \*: create SoureForge tickets for failed test cases, and remove them from build
  (Commit `7715303d <http://sourceforge.net/p/kaarpux/code/ci/7715303d2a4b64db233294e3c4b648b6b7b0a448/>`_)

- FIX: KxBuild: remember to run TEST2 step (when required)
  (Commit `78d03f87 <http://sourceforge.net/p/kaarpux/code/ci/78d03f8717a5b7bb5c0b2685a49a41d4fb0cffc5/>`_)

- FIX: KxBuild: exit after build is complete
  (Commit `f27f2627 <http://sourceforge.net/p/kaarpux/code/ci/f27f262714013b52e60e9db5b114c94e2fdfc2f6/>`_)


Packages added
##############

- ADD: libmtp: Media Transfer Protocol
  (Commit `b8901b5c <http://sourceforge.net/p/kaarpux/code/ci/b8901b5cdb266a611287d780eb7d3c8851d40482/>`_)

- ADD: gphoto2: use gPhoto software from a terminal
  (Commit `1e9d148c <http://sourceforge.net/p/kaarpux/code/ci/1e9d148c8453050ea4d02d53e035e681a7c2cbc8/>`_)


Minor Changes
#############

- IMPROVE: \*: do not build static libraries which are not used
  (Commit `abf82d83 <http://sourceforge.net/p/kaarpux/code/ci/abf82d837d870351af7c1a7c5ad71c33a74fd4a9/>`_)

- IMPROVE: libtool: better verify_cli
  (Commit `4316bc95 <http://sourceforge.net/p/kaarpux/code/ci/4316bc95c2a35e117e16670a1bd541ef5d0884dd/>`_)

- IMPROVE: glibc: remove extraneous sotruss and tzselect from verify_cli
  (Commit `050accce <http://sourceforge.net/p/kaarpux/code/ci/050accce19f915ccb2708dde9123aaae761d69dd/>`_)

- IMPROVE: libgphoto2: install udev rules
  (Commit `354c176f <http://sourceforge.net/p/kaarpux/code/ci/354c176fab46c6c2004f7ed1c77a703049a59423/>`_)

- IMPROVE: linux: add CONFIG_INTEL_IDLE
  (Commit `d5db8cc9 <http://sourceforge.net/p/kaarpux/code/ci/d5db8cc97ad5a9051d0c39b00a68ffbbc9164e78/>`_)

- REMOVE: xen dev86 yajl: dropping support for using KaarPux as xen HOST
  (Commit `07b0da99 <http://sourceforge.net/p/kaarpux/code/ci/07b0da9984fbeeff1b8a8dff3d86e19f7607eb46/>`_)


Documentation Changes
#####################

- DOC: www: better css for appendix table-of-contents
  (Commit `339bfd4b <http://sourceforge.net/p/kaarpux/code/ci/339bfd4bf5e0e5bc95a7ab63fdff424e1a02f39b/>`_)

- DOC: www: remove old cruft
  (Commit `d040da03 <http://sourceforge.net/p/kaarpux/code/ci/d040da031e32406addf7fbffdc1f550e1ada2934/>`_)

- DOC: www: typo
  (Commit `9b7cd4d2 <http://sourceforge.net/p/kaarpux/code/ci/9b7cd4d2fd745ef5b7cd7a1c955203648d41610c/>`_)

- DOC: www: document size of downloads
  (Commit `ee318db1 <http://sourceforge.net/p/kaarpux/code/ci/ee318db1d51ff19c8fc283bc25fc8b8b5203839c/>`_)

- DOC: www: remove stale references
  (Commit `ece130bf <http://sourceforge.net/p/kaarpux/code/ci/ece130bf2eed05cd581db0c7d812d0c98d1299f5/>`_)

- DOC: www: fix initial breadcrumb link on package pages
  (Commit `b601fc02 <http://sourceforge.net/p/kaarpux/code/ci/b601fc0282aa6e323a6bac400b49464033d5bd0a/>`_)

- DOC: KaarPux: updated CVE info
  (Commit `b7acd86b <http://sourceforge.net/p/kaarpux/code/ci/b7acd86b3d5752027de47e1c8bb4d0bba1214a06/>`_,
  `b2b07960 <http://sourceforge.net/p/kaarpux/code/ci/b2b07960a6bb10fe6954402e7a4c9b3b29de59d8/>`_,
  `1d75ec91 <http://sourceforge.net/p/kaarpux/code/ci/1d75ec91750c9624c4b882d53eb0d10b5bb70567/>`_,
  `23f5d50e <http://sourceforge.net/p/kaarpux/code/ci/23f5d50e52601b7446e94b35ffbd7f99fcc7fb65/>`_,
  `a27439bf <http://sourceforge.net/p/kaarpux/code/ci/a27439bf0e52d9a911ed0f9fb8bb934b32c0616b/>`_)


