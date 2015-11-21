.. 
   KaarPux: http://kaarpux.kaarposoft.dk
   Copyright (C) 2015: Henrik Kaare Poulsen
   License: http://kaarpux.kaarposoft.dk/license.html

.. _changes_4_8_1:


================================
Changes in KaarPux version 4.8.1
================================


:program:`KaarPux` version ``4.8.1`` released on ``2015-jan-12``

- Linux kernel version 3.18.2

- Many packages updated - including security updates

- Many bug fixes - including security fixes

- Minor Changes and Documentation Changes


Linux kernel version 3.18.2
###########################

- UPD: linux: v 3.18.2
  (Commit `a0ba2cfa <http://sourceforge.net/p/kaarpux/code/ci/a0ba2cfa66ecd012df9a4793466f84892a954c74/>`_,
  `40dfa7d1 <http://sourceforge.net/p/kaarpux/code/ci/40dfa7d16d06e49d7f229c6b00aa9bbf8b2d3857/>`_)


Many packages updated - including security updates
##################################################

- UPD: libtool: v 2.4.4
  (Commit `5ea423f7 <http://sourceforge.net/p/kaarpux/code/ci/5ea423f7efb3169d2f0d8f09e1a67fb5d7cf0501/>`_)

- UPD: Python2: v 2.7.9
  (Commit `1080f944 <http://sourceforge.net/p/kaarpux/code/ci/1080f944100c7a7ecc522946a82853a9b1a145b1/>`_)

- UPD: systemd: v 218
  (Commit `462e0400 <http://sourceforge.net/p/kaarpux/code/ci/462e0400f7e0c4250ab761684a73255a8d463dba/>`_)

- UPD: systemtap: v 2.7-0.117.g8ccd746013fa
  (Commit `1c4a33f9 <http://sourceforge.net/p/kaarpux/code/ci/1c4a33f9bbf756e15ed110c1dff2fc527d9f100c/>`_)

- UPD: cmake: 3.1.0
  (Commit `da8fbdb9 <http://sourceforge.net/p/kaarpux/code/ci/da8fbdb9269c30406f799df40697586e37dff9ee/>`_)

- UPD: curl: v 7.39.0
  (Commit `868b7544 <http://sourceforge.net/p/kaarpux/code/ci/868b7544ee177ee4717889818220adf45b8be955/>`_)

- UPD: git: v 2.2.1
  (Commit `78c8c9a5 <http://sourceforge.net/p/kaarpux/code/ci/78c8c9a5f7cf8f62d1d21d1e59a4e339776e3e33/>`_)

- UPD: gnutls: v 3.3.11
  (Commit `47166485 <http://sourceforge.net/p/kaarpux/code/ci/47166485e4cc9d333c864d29955adf2a95c954fe/>`_)

- UPD: gpgme: v 1.5.3
  (Commit `3ff80742 <http://sourceforge.net/p/kaarpux/code/ci/3ff80742bbdbb74e13055b3cbbedfd3ecc32e25b/>`_)

- UPD: libgpg-error: v 1.17
  (Commit `e4799862 <http://sourceforge.net/p/kaarpux/code/ci/e47998623cd4e0f22751b1edd64343012604703d/>`_)

- UPD: libdrm: v 2.4.58
  (Commit `35f64bba <http://sourceforge.net/p/kaarpux/code/ci/35f64bba43637195ca25a7d30dd1d111c89a5600/>`_)

- UPD: libpng: v 1.6.15
  (Commit `5116b049 <http://sourceforge.net/p/kaarpux/code/ci/5116b049b3f0d224ee35facd0e50f76729168fae/>`_)

- UPD: MesaLib: v 10.3.5
  (Commit `70513bf1 <http://sourceforge.net/p/kaarpux/code/ci/70513bf1ff0e38ff78daca242c7a20a858abfeea/>`_)

- UPD: NetworkManager network-manager-applet: v 1.0.0
  (Commit `c6368c90 <http://sourceforge.net/p/kaarpux/code/ci/c6368c9056c8910815925929c3df2dc6427b6140/>`_)

- UPD: qemu: v 2.2.0
  (Commit `49340dc0 <http://sourceforge.net/p/kaarpux/code/ci/49340dc09caf5d373e3507e40a1ca094941a088e/>`_)

- UPD: WebKit2: v 2.7.3
  (Commit `43f00c99 <http://sourceforge.net/p/kaarpux/code/ci/43f00c9997fea29747759ab068759122c136bc94/>`_)

- UPD: xcb-util-image xcb-util-keysyms xcb-util: update to latest version
  (Commit `2f1a788a <http://sourceforge.net/p/kaarpux/code/ci/2f1a788a46d9cb0906aad3cd20ac77390f86c6e0/>`_)

- UPD: xf86-input-wacom: v 0.27.0
  (Commit `f643d00d <http://sourceforge.net/p/kaarpux/code/ci/f643d00d5a6e06bf1379d2f6e096001491324bf9/>`_)

- UPD: xf86-video-ati: v 7.5.0
  (Commit `78f2e3eb <http://sourceforge.net/p/kaarpux/code/ci/78f2e3ebf5b369996a369cf4346be7bc5d93f52a/>`_)

- UPD: xf86-video-qxl: v 0.1.3
  (Commit `bd18e2a8 <http://sourceforge.net/p/kaarpux/code/ci/bd18e2a82fc294e74afa168d9e4204eec4636472/>`_)

- UPD: xkeyboard-config: v 2.13
  (Commit `063748dc <http://sourceforge.net/p/kaarpux/code/ci/063748dcfcf0fbcac30481865de9223e27dc323b/>`_)

- UPD: xf86-input-evdev xf86-video-nouveau xf86-video-intel: updated to latest version
  (Commit `f03f3242 <http://sourceforge.net/p/kaarpux/code/ci/f03f324216b2ff8aae7fbc8e4fc436797f5b1e10/>`_)

- UPD: xinit xkbcomp: updated to latest version
  (Commit `18f31f82 <http://sourceforge.net/p/kaarpux/code/ci/18f31f82e17c2d8f1dfecad52573222e8754d172/>`_)

- UPD: xorg-server: v 1.16.3
  (Commit `ba528c25 <http://sourceforge.net/p/kaarpux/code/ci/ba528c259ef387324278342c56ec96f26a52f910/>`_)

- UPD: wget: v 1.16.1
  (Commit `f982cbb5 <http://sourceforge.net/p/kaarpux/code/ci/f982cbb52e126eb503c99f985c339db87fd8fb2f/>`_)

- UPD: xz: v 5.2.0
  (Commit `3891ce17 <http://sourceforge.net/p/kaarpux/code/ci/3891ce172be459a8ec383794d76d1cbea63327a2/>`_)

- UPD: binutils: v 2.25
  (Commit `a5941e19 <http://sourceforge.net/p/kaarpux/code/ci/a5941e19eb3f8a53170a8dc72cff4d3069f6bae1/>`_)

- UPD: openssl: v 1.0.1k
  (Commit `5bd8b171 <http://sourceforge.net/p/kaarpux/code/ci/5bd8b171c665bdcf8987cc9c0152170a77ef495d/>`_)

- UPD: glibc: v 2.20-480-g46abb64
  (Commit `a10cdf00 <http://sourceforge.net/p/kaarpux/code/ci/a10cdf001dfc00bb3f67ccb03515b9fcf54e8025/>`_)

- UPD: elfutils: v 0.161
  (Commit `a3901fd6 <http://sourceforge.net/p/kaarpux/code/ci/a3901fd6ca7217e3320d3f687ada75c8fa3a1984/>`_)


Many bug fixes - including security fixes
#########################################

- FIX: libtool: patch for failing ltdl dryrun
  (Commit `414f71a7 <http://sourceforge.net/p/kaarpux/code/ci/414f71a74bd38f8dc7be975faa09aee7fdcd9e3c/>`_)

- FIX: icedtea7: upstream changeset 7682:74a70385c21d
  (Commit `3f06806b <http://sourceforge.net/p/kaarpux/code/ci/3f06806b4a861c91156a2d5ff1e5d0bb35f5786c/>`_)

- FIX: jasper: patch multiple vulnerabilities
  (Commit `d423363c <http://sourceforge.net/p/kaarpux/code/ci/d423363c320d22767b484d3f03d6d1c1287b4d0f/>`_)

- FIX: unzip: patch CVE-2014-8139 CVE-2014-8140 CVE-2014-8141
  (Commit `4043c78e <http://sourceforge.net/p/kaarpux/code/ci/4043c78e64de8c95b97cfd78885a160246d79878/>`_)

- FIX: yaml: patch CVE-2014-9130
  (Commit `8e8c259e <http://sourceforge.net/p/kaarpux/code/ci/8e8c259e9dc1bad5a03b1eccee6610d3317d43ce/>`_)

- FIX: firefox: patch to avoid segfault
  (Commit `20820c5e <http://sourceforge.net/p/kaarpux/code/ci/20820c5e507c0a56c9c11411117639855fa1eabb/>`_)

- FIX: gnome-control-center: patch to work with NetworkManager 1.0
  (Commit `f169514e <http://sourceforge.net/p/kaarpux/code/ci/f169514e380dbfdbede8838080162f5b0d4a67f7/>`_)

- FIX: systemtap: Update dentry.stp to handle more kernels, especially 3.18
  (Commit `953e18bc <http://sourceforge.net/p/kaarpux/code/ci/953e18bca5d949d61a865bd08d5d19e2f8acd63f/>`_)

- FIX: elfutils: Fix dir traversal vuln in ar extraction (CVE-2014-9447)
  (Commit `012fc8c4 <http://sourceforge.net/p/kaarpux/code/ci/012fc8c4b0b4b16877fa07e6f767bb3d78c82db8/>`_)

- FIX: exiv2: patch for CVE-2014-9449
  (Commit `6cf69937 <http://sourceforge.net/p/kaarpux/code/ci/6cf69937709d2656756ef1b59193ba14c1a452f0/>`_)


Minor Changes and Documentation Changes
#######################################

- FIX: WebKit1: correct upstream version check
  (Commit `192905b6 <http://sourceforge.net/p/kaarpux/code/ci/192905b6769ab5c962221121001a95608974491c/>`_)

- MINOR: bash-completion: temporarily disable check
  (Commit `fcfe6168 <http://sourceforge.net/p/kaarpux/code/ci/fcfe61681c8491f397551a96bea3bbfe7891fd3d/>`_)

- MINOR: wget: temporarily disable check
  (Commit `9e3817ab <http://sourceforge.net/p/kaarpux/code/ci/9e3817aba50c8dbf90dc4544cdee678ffaffc2d5/>`_)

- MINOR: util-linux: Need TERM=xterm to avoid FAILED (more/regexp)
  (Commit `ac322678 <http://sourceforge.net/p/kaarpux/code/ci/ac322678cb5dddd959f37e8621c9cd6d3b320212/>`_)

- MINOR: KxBuild: improve build sequence in beginning of bootstrap_8
  (Commit `1c48c064 <http://sourceforge.net/p/kaarpux/code/ci/1c48c064b69baeb133b40db980a7af794d9e5fb9/>`_)

- MINOR: adwaita-icon-theme: use upstream_gnome instead of upstream_gnome_uneven for version check
  (Commit `349248ba <http://sourceforge.net/p/kaarpux/code/ci/349248bafcedaf0465f09197a3378142d2f34bc0/>`_)

- MINOR: codelite: temporarily disabled
  (Commit `15acffdd <http://sourceforge.net/p/kaarpux/code/ci/15acffdd27844fe146fa4464d25670f58feba7ca/>`_,
  `2c30f0c9 <http://sourceforge.net/p/kaarpux/code/ci/2c30f0c95a85bcb69a90d58fdab193eca52c1f98/>`_)

- IMPROVE: man-db: install setuid to (new) user 'man'
  (Commit `b94fee1a <http://sourceforge.net/p/kaarpux/code/ci/b94fee1a10e27b65ce55f6f4748ad95ec4832ac7/>`_)

- IMPROVE: dangerous_install_remote: use rsync; better options; minor improvements
  (Commit `b91880f7 <http://sourceforge.net/p/kaarpux/code/ci/b91880f7089402f462d8b73a7333b78d5276b83b/>`_)

- IMPROVE: kx_cve: check CVEs for 2015
  (Commit `27960d87 <http://sourceforge.net/p/kaarpux/code/ci/27960d87950ab6ebf275ddf2641fb91aafef582f/>`_)

- DOC: KaarPux: removed duplicates in CVE info
  (Commit `37eb069f <http://sourceforge.net/p/kaarpux/code/ci/37eb069f70e1b469982b35f6716aa4ab0a9c6a3d/>`_)

- DOC: KaarPux: updated CVE info
  (Commit `aa4ab898 <http://sourceforge.net/p/kaarpux/code/ci/aa4ab89891c2e56c51538644aca1c14e8b000f03/>`_,
  `dcc1a837 <http://sourceforge.net/p/kaarpux/code/ci/dcc1a83719786915900f8dab42f76009324197a6/>`_)


