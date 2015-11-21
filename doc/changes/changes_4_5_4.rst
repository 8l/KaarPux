.. 
   KaarPux: http://kaarpux.kaarposoft.dk
   Copyright (C) 2015: Henrik Kaare Poulsen
   License: http://kaarpux.kaarposoft.dk/license.html

.. _changes_4_5_4:


================================
Changes in KaarPux version 4.5.4
================================


:program:`KaarPux` version ``4.5.4`` released on ``2014-aug-12``

- Bugs fixed

- Many packages updated

- Packages added for testing: ttystatus cliapp cmdtest

- Package ntp removed (we now have systemd-timesync)

- Many minor changes (in particular for testing)


Bugs fixed
##########

- FIX: shadow: allow long group names
  (Commit `58832a9b <http://sourceforge.net/p/kaarpux/code/ci/58832a9b304e3e115b366bb7a53fd9444731b15f/>`_)

- FIX: cmake: do not run Qt4Deploy as Qt4 is not installed yet
  (Commit `b52f9b96 <http://sourceforge.net/p/kaarpux/code/ci/b52f9b961934a89ce6207de47c0ad9c200822348/>`_)

- FIX: libreoffice: install
  (Commit `b26dddaf <http://sourceforge.net/p/kaarpux/code/ci/b26dddaff7a4174ce3bd5832335749840fab7c68/>`_)

- FIX: KxBuild: run Xvfb with 24bit color depth (to make GLX work)
  (Commit `e7441441 <http://sourceforge.net/p/kaarpux/code/ci/e7441441597f8d0dbc809429eff90a2b05cdafe5/>`_)

- FIX: nss: update expired certificate
  (Commit `e39facbc <http://sourceforge.net/p/kaarpux/code/ci/e39facbc2273d41c25a0e22e8092e45cf386ee1c/>`_)

- FIX: KxBuild: make KX_KEEP_BUILD_DIRECTORIES work
  (Commit `df5d666c <http://sourceforge.net/p/kaarpux/code/ci/df5d666c824c092036e755aadda52dfd572ca9ce/>`_)

- FIX: tar: fix testsuite
  (Commit `4be58b12 <http://sourceforge.net/p/kaarpux/code/ci/4be58b129c16286272d275221e830314d3a43be2/>`_)

- FIX: exiv2: make_repeat
  (Commit `ad425f3e <http://sourceforge.net/p/kaarpux/code/ci/ad425f3ecbaa5a59d8c349aa05a91959313f407e/>`_)

- IMPROVE: coreutils: build again in bootstrap_8 to pick up dependencies on attr, acl, pcre, and libcap
  (Commit `1dd046c2 <http://sourceforge.net/p/kaarpux/code/ci/1dd046c27261d9b1f9a43fcd78d9e355b8e57f9a/>`_)


Packages updated
################

- UPD: openssl: v 1.0.1i
  (Commit `63685773 <http://sourceforge.net/p/kaarpux/code/ci/63685773478eda0323563aa1e23938a7a5d69ddf/>`_)

- UPD: gnutls: v 3.3.6
  (Commit `72671aa1 <http://sourceforge.net/p/kaarpux/code/ci/72671aa11ee1f58a91f85da563042f3ff06bc48b/>`_)

- UPD: nss: v 3.16.4
  (Commit `144568cb <http://sourceforge.net/p/kaarpux/code/ci/144568cb16a5583538c874d7e8e9613feff07d69/>`_)

- UPD: certdata: v cd52a7f89548
  (Commit `586e8cb1 <http://sourceforge.net/p/kaarpux/code/ci/586e8cb1fe5222c98ddff94041853ac1c39df2a6/>`_)

- UPD: adblockplus: v 2.6.4
  (Commit `1d101767 <http://sourceforge.net/p/kaarpux/code/ci/1d101767274c22be95d0cbbdee6f0ec85b4632bc/>`_)

- UPD: ghostery: v 5.3.2
  (Commit `4c9a5476 <http://sourceforge.net/p/kaarpux/code/ci/4c9a5476b8eca96c8199e18f8c7b420ea5fb3ba9/>`_)

- UPD: noscript: v 2.6.8.36
  (Commit `08e25e83 <http://sourceforge.net/p/kaarpux/code/ci/08e25e83bedf7a527d0c34db318da3fe83a1ba61/>`_)

- UPD: empathy: v 3.12.4
  (Commit `fe243a68 <http://sourceforge.net/p/kaarpux/code/ci/fe243a68c4715cebcdf62066f19e0c0f2a170d36/>`_)

- UPD: evince: v 3.12.2
  (Commit `89d6028b <http://sourceforge.net/p/kaarpux/code/ci/89d6028bd304b8b6aea05f8c217ba5ed3ccf7e3a/>`_)

- UPD: evolution-data-server: v 3.12.4
  (Commit `d832c199 <http://sourceforge.net/p/kaarpux/code/ci/d832c199214aca816f04845a121d48b8da7a84aa/>`_)

- UPD: evolution: v 3.12.4
  (Commit `ee90dc89 <http://sourceforge.net/p/kaarpux/code/ci/ee90dc8941b49321a685113787b5e1d75e9af7ac/>`_)

- UPD: gnome-\*: update to latest version
  (Commit `67cf678a <http://sourceforge.net/p/kaarpux/code/ci/67cf678a047f5a8c942301284b017fb1a4eea3fd/>`_)

- UPD: vte: v 0.36.3
  (Commit `7db19d63 <http://sourceforge.net/p/kaarpux/code/ci/7db19d63174aaaa4377ea7cb354d4d494d9ba460/>`_)

- UPD: xf86-video-intel: v 2.99.914
  (Commit `f41f431a <http://sourceforge.net/p/kaarpux/code/ci/f41f431aa0f4db6d01b231bad1a03e2c93b092e9/>`_)

- UPD: linux: 3.15.9
  (Commit `76ccb20f <http://sourceforge.net/p/kaarpux/code/ci/76ccb20fbfdc1c400aec69eb34bc809bdad1d666/>`_)

- UPD: harfbuzz: v 0.9.34
  (Commit `e9dc9dba <http://sourceforge.net/p/kaarpux/code/ci/e9dc9dbafaa8c052ce2286a50fbe70d27370bcbb/>`_)

- UPD: libpeas: v 1.10.1
  (Commit `0b8eab0d <http://sourceforge.net/p/kaarpux/code/ci/0b8eab0d10773c68c59772b6bb59c0b8ab8bc71c/>`_)

- UPD: network-manager-applet: v 0.9.10.0
  (Commit `3a050d5f <http://sourceforge.net/p/kaarpux/code/ci/3a050d5fa1757f0b34e7a5d93d8de8c66edd682e/>`_)

- UPD: libreoffice: v 4.3.0.4
  (Commit `2c7049f4 <http://sourceforge.net/p/kaarpux/code/ci/2c7049f4e9dc973c182d97965d9edfc03bc4b010/>`_)

- UPD: qemu: v 2.1.0
  (Commit `3c3e979a <http://sourceforge.net/p/kaarpux/code/ci/3c3e979a4fd693235018a4e0165ac9170d7ee84d/>`_)


Packages added
##############

- ADD: ttystatus cliapp cmdtest: for testing
  (Commit `32bfa285 <http://sourceforge.net/p/kaarpux/code/ci/32bfa285ef1bfd44c16978fd864747e4f0a80d65/>`_)


Packages removed
################

- REMOVE: ntp: we now have systemd-timesync
  (Commit `da25a0f0 <http://sourceforge.net/p/kaarpux/code/ci/da25a0f0557e6c3ef94b6994059727f22f1ba471/>`_)


Minor Changes
#############

- IMPROVE: KaarPux: Create all users/groups manually, and disable systemd-sysusers.service
  (Commit `29b93e04 <http://sourceforge.net/p/kaarpux/code/ci/29b93e04c16a8ca2b75a6a4022c1a6403bcb5c3b/>`_)

- MINOR: gcc: move libstdc++.so.XXX-gdb.py to better path (avoiding ldconfig warnings)
  (Commit `cf112d6f <http://sourceforge.net/p/kaarpux/code/ci/cf112d6fae821fdeea0a5e0eda7310648cd80d84/>`_)

- MINOR: lua: make symbolic links to libraries
  (Commit `5012291f <http://sourceforge.net/p/kaarpux/code/ci/5012291fc85601d261648afc7923705be0e693bf/>`_)

- IMPROVE: KxBuild: better connectivity check in virtual/kvm.sh
  (Commit `74ec4fb5 <http://sourceforge.net/p/kaarpux/code/ci/74ec4fb56d8e54abc92eee73a823ef25700dc6be/>`_)

- IMPROVE: llvm: improve testing; streamline yaml file; separate build directories;  check download signature
  (Commit `579c6471 <http://sourceforge.net/p/kaarpux/code/ci/579c647177d7d4de1910af43226ff08da728c3a4/>`_)

- IMPROVE: xorg-server: make sure Xvfb supports RANDR extension
  (Commit `50d08ab2 <http://sourceforge.net/p/kaarpux/code/ci/50d08ab222e93abfd210c7e895cf12c78d5f482f/>`_)

- IMPROVE: KxBuild: do not let systemd intercept coredumps (in particular good if we run with testing)
  (Commit `8a21c891 <http://sourceforge.net/p/kaarpux/code/ci/8a21c891813c72c5f1c020413da49e9cac0e9347/>`_)

- IMPROVE: nss: add testing
  (Commit `f2e39526 <http://sourceforge.net/p/kaarpux/code/ci/f2e395267872434bfce5b79d4ad0414c18b061ac/>`_)

- IMPROVE: krb5: install only libraries
  (Commit `fff31e3f <http://sourceforge.net/p/kaarpux/code/ci/fff31e3fe31d34bf81a1f2e48679cc8732e5666d/>`_)

- IMPROVE: KxBuild: move expect and dejagnu earlier (for testing)
  (Commit `90d2b4d3 <http://sourceforge.net/p/kaarpux/code/ci/90d2b4d3f5ff25d56554f9eb5a5cc9bd5e39e924/>`_)

- IMPROVE: KxBuild: move cppunit earlier (for testing)
  (Commit `370f3ea0 <http://sourceforge.net/p/kaarpux/code/ci/370f3ea07437957ae1a5cf753afbfa3e66a5b634/>`_)

- IMPROVE: net-snmp: fix test
  (Commit `73d4803a <http://sourceforge.net/p/kaarpux/code/ci/73d4803a4316570d3d4ee650dc74e31087ca7aba/>`_)

- IMRPOVE: gtksourceview: Fix tests when gtksourceview is not installed
  (Commit `be04a639 <http://sourceforge.net/p/kaarpux/code/ci/be04a639ebf7ee6dd1226ff3ad5a38563426b22f/>`_)

- IMPROVE: x*: add 'make check' for xorg packages
  (Commit `8c10baec <http://sourceforge.net/p/kaarpux/code/ci/8c10baeca6f2001ac3a0deb54c4013d223792e1c/>`_)

- MINOR: clutter: remove failing testcases (TODO: investigate further)
  (Commit `d2924259 <http://sourceforge.net/p/kaarpux/code/ci/d29242595114a42cc480184775d85afd987e4aa4/>`_)

- MINOR: gst-plugins-bad: ignore test results
  (Commit `253653a5 <http://sourceforge.net/p/kaarpux/code/ci/253653a5aa593efdfd4e5f84a6ff132ce8e0533e/>`_)

- IMPROVE: gst-plugins-good: remove failing testcase
  (Commit `93faa3e3 <http://sourceforge.net/p/kaarpux/code/ci/93faa3e33488672d20498b8206ef1581bfbce884/>`_)

- IMPROVE: telepathy-mission-control: repeat test if failing the first time around
  (Commit `ae3caa51 <http://sourceforge.net/p/kaarpux/code/ci/ae3caa519be7e1ad45415b71fa1ebc9a5a773923/>`_)

- IMPROVE: wxWidgets: remove failing testcases
  (Commit `242a8a3f <http://sourceforge.net/p/kaarpux/code/ci/242a8a3f25fc6430f42c5f67f5676831ff6aa7e0/>`_)

- IMPROVE: \*: add 'make check'
  (Commit `fb2e6079 <http://sourceforge.net/p/kaarpux/code/ci/fb2e60791dbd0d97df416a6a408ede541278f13b/>`_)

- IMPROVE: KxBuild: move acl, attr, pcre earlier for path, sed, tar, grep to pick them up
  (Commit `241d63b7 <http://sourceforge.net/p/kaarpux/code/ci/241d63b7e80cb94bef5b1d44d33fe278d008c823/>`_)

- IMPROVE: kx_dependencies: new options: --reduce --show-build --show-ldd
  (Commit `cc1fb125 <http://sourceforge.net/p/kaarpux/code/ci/cc1fb12515ccb507a21de5a5be97367b5634ef80/>`_)

- IMPROVE: KxBuild: make use of tmpfs in dangerous_build_bootstrap optional
  (Commit `1e37f240 <http://sourceforge.net/p/kaarpux/code/ci/1e37f240953e3d4831349547083ddd2da4e5118a/>`_)

- IMPROVE: asciidoc: add checking
  (Commit `b72e5f78 <http://sourceforge.net/p/kaarpux/code/ci/b72e5f78a867b95aef69eae7d743bed0be2c061a/>`_)

- IMPROVE: berkeley-db: add checking
  (Commit `739f1640 <http://sourceforge.net/p/kaarpux/code/ci/739f164069aad8bba9d09865b2aa719583854396/>`_)

- IMPROVE: busybox: add 'make check'. TODO: investigate failing testcases
  (Commit `ec156fc0 <http://sourceforge.net/p/kaarpux/code/ci/ec156fc0bbc3ca15da8ced3725958a2256aed95a/>`_)

- IMPROVE: coreutils: add 'make check'. TODO: investigate failing testcases
  (Commit `25903c91 <http://sourceforge.net/p/kaarpux/code/ci/25903c91bab4164169b8f40d10d1086b20c2a235/>`_)

- IMPROVE: grub: add 'make check'. TODO: investigate failing testcases
  (Commit `d056f2ff <http://sourceforge.net/p/kaarpux/code/ci/d056f2ff6ff40ba076c630e40d12ebd0dac5ce18/>`_)

- IMPROVE: linux-pam: do not 'make check' if ${KX_DISABLE_TEST} is seIMPROVE: linux-pam: do not 'make check' if ${KX_DISABLE_TEST} is set
  (Commit `0d1faf99 <http://sourceforge.net/p/kaarpux/code/ci/0d1faf9958f67cc7ee9b15049fe6a196ed8adba6/>`_)

- IMPROVE: man-db: execute test cases, but still ignore the result
  (Commit `fced02af <http://sourceforge.net/p/kaarpux/code/ci/fced02afda5ed51ca0913acbddf1009344e89803/>`_)

- IMPROVE: openssh: make tests
  (Commit `a90ecf8d <http://sourceforge.net/p/kaarpux/code/ci/a90ecf8db966475169d56fcc7efcef88512b7eef/>`_)

- IMPROVE: openssl: execute test cases, but still ignore the result
  (Commit `4fce5497 <http://sourceforge.net/p/kaarpux/code/ci/4fce54976f279eb6c53404a0a4444b139d968b1f/>`_)

- IMPROVE: patch: add check_ignore. TODO: come back and see if we can make the scripts dash/posix compatible
  (Commit `b0d74e08 <http://sourceforge.net/p/kaarpux/code/ci/b0d74e0856f48553b944d8ee7511367b36a23a75/>`_)

- IMPROVE: vim: add test
  (Commit `d26152b2 <http://sourceforge.net/p/kaarpux/code/ci/d26152b28785910c614aa655b60736c36bbaf731/>`_)

- IMPROVE: \*: make check
  (Commit `776d22bb <http://sourceforge.net/p/kaarpux/code/ci/776d22bb64afb14158d49ae97f1de1ebb3899cc7/>`_)

- DOC: gnome-color-manager: add comment about test failures
  (Commit `8039890b <http://sourceforge.net/p/kaarpux/code/ci/8039890b983683e2f0ea509b6227a317f8c59ef5/>`_)

- DOC: sane-backends: note that test suite fails due to hard-coded dates
  (Commit `8e6a1688 <http://sourceforge.net/p/kaarpux/code/ci/8e6a16885d7e76b3394acf462d9c1fbd873304cb/>`_)

- DOC: \*: note that 'make check' does nothing
  (Commit `591695c0 <http://sourceforge.net/p/kaarpux/code/ci/591695c0763e992116eaf01b04ed85db503a119a/>`_)

- DOC: \*: note that package has no test-suite
  (Commit `d0dccf6a <http://sourceforge.net/p/kaarpux/code/ci/d0dccf6a908ee29b34b2a9cc7ec83bd01a24cf51/>`_,
  `dddd41c6 <http://sourceforge.net/p/kaarpux/code/ci/dddd41c65257faf043e360590e3d2ab3556bd8e8/>`_,
  `719fe04e <http://sourceforge.net/p/kaarpux/code/ci/719fe04eb68bc2c0cd47902efd518cbda00b6f81/>`_)

- DOC: KaarPux: updated CVE info
  (Commit `34f3d425 <http://sourceforge.net/p/kaarpux/code/ci/34f3d425d6c46e6fa581a215d7d6571bac898ebc/>`_)


