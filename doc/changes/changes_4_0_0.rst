.. 
   KaarPux: http://kaarpux.kaarposoft.dk
   Copyright (C) 2015: Henrik Kaare Poulsen
   License: http://kaarpux.kaarposoft.dk/license.html

.. _changes_4_0_0:


================================
Changes in KaarPux version 4.0.0
================================


:program:`KaarPux` version ``4.0.0`` released on ``2014-01-12``

- Building packages with clang/llvm 3.4

- LibreOffice updated to version 4.1.4.2

- Linux Kernel updated to version 3.12.6

- Bugs fixed, packages updated and minor improvements


Building packages with clang/llvm 3.4
#####################################

We now include
`clang version 3.4 <http://llvm.org/releases/3.4/tools/clang/docs/ReleaseNotes.html>`_.
Most packages are now compiled with ``clang version 3.4``.
However, bootstrap packages, and a few "troublesome" packages are compiled build with
``gcc``.

- UPD: llvm: v 3.4
  (Commit `f6ef2597 <http://sourceforge.net/p/kaarpux/code/ci/f6ef2597c22d3d991c7be0bba1890c7ce56ff149/>`_)

- UPD: llvm: v 3.3; also add version wizard code for additional downloads
  (Commit `8120f978 <http://sourceforge.net/p/kaarpux/code/ci/8120f97847d352638e22054ecaa36a92c65c6ca5/>`_)

- FIX: MesaLib: crippled as gallium llvm does not work with LLVM 3.3
  (Commit `ddb81336 <http://sourceforge.net/p/kaarpux/code/ci/ddb8133618e177fb47dba4f2d95fa81726394050/>`_)

- UPD: MesaLib: put back all relevant options
  (Commit `ee309223 <http://sourceforge.net/p/kaarpux/code/ci/ee30922344523ff4cc2e0f0c38ffb109243d861a/>`_)

- FIX: nemiver: patch for SafePtr; CLANG compilation broke
  (Commit `c9cd164b <http://sourceforge.net/p/kaarpux/code/ci/c9cd164bcde62f76fe194eba5c0bd1a3658c75be/>`_)

- FIX: KxBuild: use clang for all steps
  (Commit `ae345148 <http://sourceforge.net/p/kaarpux/code/ci/ae345148e9a153ba4c50fc5e1fbc0f2f92457e0f/>`_)

- FIX: llvm: put --enable-experimental-targets=R600 into the final build
  (Commit `b09edadd <http://sourceforge.net/p/kaarpux/code/ci/b09edadd996b40f3b10532fc150428ab74734525/>`_)

- FIX: icedtea-web: use c++98
  (Commit `37b80c5a <http://sourceforge.net/p/kaarpux/code/ci/37b80c5a1729889ba7d1fcb2fa13c605d067cd56/>`_)

- FIX: libtheora: do not use -fforce-addr with clang
  (Commit `d6afb60e <http://sourceforge.net/p/kaarpux/code/ci/d6afb60e9d7b4cdeae1c83dd24aa0757ea612fcf/>`_)

- FIX: libmad: use_gcc
  (Commit `15691c2b <http://sourceforge.net/p/kaarpux/code/ci/15691c2b401c7fac0fbfb6570519e80fa51bf340/>`_)

- FIX: icedtea7: small corrections for clang/llvm
  (Commit `b971ea01 <http://sourceforge.net/p/kaarpux/code/ci/b971ea013b82ef0f0fe457d220c47f465103eb4c/>`_)

- FIX: thunderbird: patch for clang/llvm
  (Commit `9b4b2d4f <http://sourceforge.net/p/kaarpux/code/ci/9b4b2d4f59e6bd96f88a9cb5534b6d3ef5d70f29/>`_)

- FIX: thunderbird: patch for clang/llvm
  (Commit `234e376f <http://sourceforge.net/p/kaarpux/code/ci/234e376f4be4873625eb8b2cafa6303813887671/>`_)

- FIX: libvisio: small correction for clang/llvm
  (Commit `ee2f465e <http://sourceforge.net/p/kaarpux/code/ci/ee2f465e2982986997e50a9531fc87ee12ad17f2/>`_)

- IMPROVE: KxBuild: Install clang with llvm (and do it early)
  (Commit `1395a040 <http://sourceforge.net/p/kaarpux/code/ci/1395a040e5e04bbb228be1e082796b299868815b/>`_)

- IMPROVE: KxBuild: Build with clang by default, if it is found
  (Commit `65daa96c <http://sourceforge.net/p/kaarpux/code/ci/65daa96c1f1ac2c9344145f55385d4559d461ae9/>`_)

- IMPROVE: luit xmodmap: apply patches for llvm
  (Commit `4392635b <http://sourceforge.net/p/kaarpux/code/ci/4392635b9861fdb1a35b9c0f450f7a14430fd24b/>`_)

- IMPROVE: gobject-introspection: patch when using clang
  (Commit `6c862fd4 <http://sourceforge.net/p/kaarpux/code/ci/6c862fd4a702246a293521e91494b24c5ce8168b/>`_)

- IMPROVE: firefox thunderbird: do not compile with clang; use gcc
  (Commit `2ed4b12c <http://sourceforge.net/p/kaarpux/code/ci/2ed4b12c9a7e1a697b6033d3efefab437d5f77e4/>`_)

- IMPROVE: \*: do not compile with clang; use gcc
  (Commit `7598a18c <http://sourceforge.net/p/kaarpux/code/ci/7598a18c94be391fded77ca2772433b4b738796d/>`_)

- IMPROVE: icedtea7: compile with clang
  (Commit `3bc458b7 <http://sourceforge.net/p/kaarpux/code/ci/3bc458b77dcc042837ce7622421bfa16deb1f384/>`_)

- IMPROVE: samba: compile with clang
  (Commit `0667c999 <http://sourceforge.net/p/kaarpux/code/ci/0667c999c3a212a0d9d104ab2899dd609fcd63f4/>`_)

- IMPROVE: boost: compile with clang
  (Commit `68b291fe <http://sourceforge.net/p/kaarpux/code/ci/68b291fe1a6f4c92769a3f125265fd3af4111e59/>`_)

- IMPROVE: firefox: compile with clang
  (Commit `2bfa9cbe <http://sourceforge.net/p/kaarpux/code/ci/2bfa9cbe6954690175c4e1646d0fe54b155ecf01/>`_)

- IMPROVE: thunderbird: compile with clang
  (Commit `01e14157 <http://sourceforge.net/p/kaarpux/code/ci/01e141571f52b406744d92286b2064bc0411652a/>`_)

- IMPROVE: llvm: add GPG key for Bill Wendling @ Apple
  (Commit `2b2d7474 <http://sourceforge.net/p/kaarpux/code/ci/2b2d7474c9530e0dc71a878ee74f9edcb07016de/>`_)

- IMPROVE: KxBuild: by default build with clang++ -std=c++11
  (Commit `3a140855 <http://sourceforge.net/p/kaarpux/code/ci/3a140855951d9a03f72639482ff0505085b0d1b2/>`_)

- IMPROVE: ragel: fix compile with clang
  (Commit `9faa8cef <http://sourceforge.net/p/kaarpux/code/ci/9faa8cefce8a5567de95a4dda3934ade0b6ca0c9/>`_)

- IMPROVE: qpdf: fix compile with clang
  (Commit `73eb906a <http://sourceforge.net/p/kaarpux/code/ci/73eb906a25e9752dede7f8470ffbd14d6c72b1b0/>`_)

- IMPROVE: faac: fix compile with clang
  (Commit `93910669 <http://sourceforge.net/p/kaarpux/code/ci/939106699e0de7dedd37ce13d6401a820e530059/>`_)

- IMPROVE: cyrus-sasl: compile with clang
  (Commit `df5ee18c <http://sourceforge.net/p/kaarpux/code/ci/df5ee18c917327c2220914dc8c88a2233bd01a26/>`_)

- IMPROVE: gdlmm: compile with clang
  (Commit `c6acf0aa <http://sourceforge.net/p/kaarpux/code/ci/c6acf0aaf28459cc1f163cc9eed9204b97a2245f/>`_)

- IMPROVE: gnupg: compile with clang
  (Commit `980a50da <http://sourceforge.net/p/kaarpux/code/ci/980a50da111aaef12286d4d70d00fc7115940f5a/>`_)

- IMPROVE: hunspell: compile with clang
  (Commit `4698c2e0 <http://sourceforge.net/p/kaarpux/code/ci/4698c2e07e7cd064fec468d2bfd5597efbd62e25/>`_)

- IMPROVE: clucene: compile with clang
  (Commit `55ae975b <http://sourceforge.net/p/kaarpux/code/ci/55ae975b26ce588614313f8fe92628c791af9cdd/>`_)

- IMPROVE: icedtea-web: compile with clang
  (Commit `fc34ae94 <http://sourceforge.net/p/kaarpux/code/ci/fc34ae947b2f0082b65c051d71a5b7cbffff25ae/>`_)

- IMPROVE: cdparanoia: compile with clang
  (Commit `fc3f4349 <http://sourceforge.net/p/kaarpux/code/ci/fc3f4349545e69ae1618885165f45d860f3e98c5/>`_)

- IMPROVE: liboil: compile with clang
  (Commit `9f475e50 <http://sourceforge.net/p/kaarpux/code/ci/9f475e504e8b90480d418f322547242df6772967/>`_)

- IMPROVE: libvorbis: compile with clang
  (Commit `1a8e5f62 <http://sourceforge.net/p/kaarpux/code/ci/1a8e5f622b4ec0296d9470aafb613f24ae491708/>`_)

- IMPROVE: cyrus-sasl: for now, use_gcc
  (Commit `325ed4b9 <http://sourceforge.net/p/kaarpux/code/ci/325ed4b9a2491446ee73351c01f718e1afd684f1/>`_)

- IMPROVE: thunderbird: clang changes similar to those for firefox
  (Commit `feef2cfd <http://sourceforge.net/p/kaarpux/code/ci/feef2cfdf6f5fa2a8c19a7f4afde659ad43d3110/>`_)

- IMPROVE: nemiver codelite wxWidgets: clang++ --std=c++98
  (Commit `6c2670c0 <http://sourceforge.net/p/kaarpux/code/ci/6c2670c0fad8b10cb5dfabf3b1d4d184c350b0d6/>`_)

- IMPROVE: qt: clang++ --std=c++98
  (Commit `2a1d9c79 <http://sourceforge.net/p/kaarpux/code/ci/2a1d9c79e8e749e72b27b69c50ab10a1e321d32b/>`_)

- IMPROVE: ruby: compile with clang
  (Commit `d0790d43 <http://sourceforge.net/p/kaarpux/code/ci/d0790d436ba534311a86473ac46d20c53b656ecb/>`_)

- IMPROVE: cups: use_gcc
  (Commit `2a5aef7e <http://sourceforge.net/p/kaarpux/code/ci/2a5aef7e314892c59bdf1826fcad6e5c610b3df8/>`_)

- IMPROVE: linux: minor modifications to kernel config
  (Commit `b7639a81 <http://sourceforge.net/p/kaarpux/code/ci/b7639a818e9eb02292dc4798f7f14d162bccfc20/>`_)

- IMPROVE: MesaLib: build with gcc; minor config options update
  (Commit `db3aab17 <http://sourceforge.net/p/kaarpux/code/ci/db3aab17d83b59951506b7e57c07cb98c7ede311/>`_)

- IMPROVE: xorg-server: build with clang
  (Commit `c00c9ebe <http://sourceforge.net/p/kaarpux/code/ci/c00c9ebe83667e8a8102ce2642ee2d8da230c431/>`_)

- IMPROVE: xf86-video-ati: build with gcc in separate package
  (Commit `986992ca <http://sourceforge.net/p/kaarpux/code/ci/986992ca4829bc9a95b51f72261cacdfa748824b/>`_)

- IMPROVE: MesaLib: --enable-opencl
  (Commit `7b691d5d <http://sourceforge.net/p/kaarpux/code/ci/7b691d5dc5de948096740a0c881c5c6392abce40/>`_)


LibreOffice 4.1.4.2
###################

- UPD: libreoffice: v 4.1.4.2
  (Commit `62144fa1 <http://sourceforge.net/p/kaarpux/code/ci/62144fa11e917497eb8a8343a29c854aad55665c/>`_)

- ADD: liblangtag libetonyek libodfgen liborcus: prereqs for libreoffice
  (Commit `3dfb1fd3 <http://sourceforge.net/p/kaarpux/code/ci/3dfb1fd36e73f6d5bde68e38a62f766f3204f5b6/>`_)

- UPD: graphite2: v 1.2.4
  (Commit `7f2d124c <http://sourceforge.net/p/kaarpux/code/ci/7f2d124caea68a813907019b811ade70c7aa7d55/>`_)

- UPD: libcdr: v 0.0.14
  (Commit `a9eee614 <http://sourceforge.net/p/kaarpux/code/ci/a9eee614e6dd3b1f86650b11ce4fa6cb63e499ed/>`_)

- UPD: libexttextcat: v 3.4.3
  (Commit `e02bdd02 <http://sourceforge.net/p/kaarpux/code/ci/e02bdd021be8d901633c9cc143cb35aa38003523/>`_)

- UPD: libwpd: v 0.9.9
  (Commit `ff4ea791 <http://sourceforge.net/p/kaarpux/code/ci/ff4ea79133bfc763869a63e11db1d762258ddd04/>`_)

- UPD: libwpg: v 0.2.2
  (Commit `c0a46a96 <http://sourceforge.net/p/kaarpux/code/ci/c0a46a960228647a2ccb0b09065f9ad18cd375ed/>`_)

- UPD: libwps: v 0.2.9
  (Commit `e64fd347 <http://sourceforge.net/p/kaarpux/code/ci/e64fd347e489fea71810de45115599572168cc26/>`_)

- UPD: mdds: v 0.10.1
  (Commit `84d6382a <http://sourceforge.net/p/kaarpux/code/ci/84d6382ab49300a89a556de157ff1e4794b56e09/>`_)

- UPD: mdds: downgrade to 0.8.1; needed by libreoffice 4.1.4.2
  (Commit `f57001cd <http://sourceforge.net/p/kaarpux/code/ci/f57001cdd57dbd160bbd2e78c11649c257efe5b6/>`_)

- UPD: raptor2: v 2.0.12
  (Commit `6f314852 <http://sourceforge.net/p/kaarpux/code/ci/6f31485232b57801814fc474ce851f44abd18ed8/>`_)

- UPD: rasqal: v 0.9.31
  (Commit `553c5e8d <http://sourceforge.net/p/kaarpux/code/ci/553c5e8db003a2855e8494441c2699b499fa44ea/>`_)

- UPD: redland: v 1.0.17
  (Commit `24e0fb44 <http://sourceforge.net/p/kaarpux/code/ci/24e0fb441326cf42cc0bbfc6ba8343e08de24a9b/>`_)

- UPD: vigra: v 1.10.0
  (Commit `5f5dcb66 <http://sourceforge.net/p/kaarpux/code/ci/5f5dcb66b01b694387d15879f5e40a5b735009cb/>`_)


Linux Kernel 3.12.6
###################

- UPD: linux: v 3.12.6
  (Commit `e01ca544 <http://sourceforge.net/p/kaarpux/code/ci/e01ca544f3afb8e579c11b6a352b57c09b5c2656/>`_)

- IMPROVE: linux: do not use CONFIG_NO_HZ_FULL; it does not play nicely with kvm
  (Commit `b89feb66 <http://sourceforge.net/p/kaarpux/code/ci/b89feb669e887cf907dac69be042dbaf40fda989/>`_)


Bugs fixed
##########

- FIX: thunderbird: remove deprecated patch
  (Commit `617c7964 <http://sourceforge.net/p/kaarpux/code/ci/617c796417c04ec0ab7b1fa1d911e87d5a9a0d42/>`_)

- FIX: KxBuild: correct checking of sha1 asc signatures
  (Commit `874f36b4 <http://sourceforge.net/p/kaarpux/code/ci/874f36b49052b1d571c8aaaf010249e898292160/>`_)

- FIX: KxBuild: correct name for SHA_FILE in common_functions.shinc
  (Commit `0f9a5edd <http://sourceforge.net/p/kaarpux/code/ci/0f9a5edde405b7f3317870c28ad386c78bde0b90/>`_)


Packages updated
################

- UPD: qpdf: v 4.1.0; also compile with gcc
  (Commit `b7e94831 <http://sourceforge.net/p/kaarpux/code/ci/b7e94831d67571f72b5f91d530f207c2e54ea03b/>`_)

- UPD: samba: v 4.0.6
  (Commit `631cd0f9 <http://sourceforge.net/p/kaarpux/code/ci/631cd0f97fb5abbdc871ef7c02f93b9740518c11/>`_)

- UPD: flac: v 1.3.0
  (Commit `3652f1ce <http://sourceforge.net/p/kaarpux/code/ci/3652f1ce33929f03f439ad0b39bfd0c8ec96b7aa/>`_)

- UPD: ruby: v 2.0.0-p353
  (Commit `f707e663 <http://sourceforge.net/p/kaarpux/code/ci/f707e663c4b6b28ecbb4c31f20cd95c02b1008d0/>`_)

- UPD: xproto: v 7.0.25
  (Commit `1142a322 <http://sourceforge.net/p/kaarpux/code/ci/1142a322b5f18b3a4918d767ef38e59b99d73774/>`_)

- UPD: xcb-proto: v 1.9
  (Commit `0efafd6b <http://sourceforge.net/p/kaarpux/code/ci/0efafd6badd51e1d19a58506f78779479405ef15/>`_)

- UPD: xinit: v 1.3.3
  (Commit `b7907a39 <http://sourceforge.net/p/kaarpux/code/ci/b7907a3965e21f772a55830d38d9a0d485b97a95/>`_)

- UPD: xf86-video-ati / xf86-video-r128: v 7.2.0 / 6.9.2
  (Commit `1e3ed9f3 <http://sourceforge.net/p/kaarpux/code/ci/1e3ed9f33c2025d1312ea88c8fc9b55a34a735f1/>`_)

- UPD: xf86-video-fbdev: v 0.4.4
  (Commit `f1e28901 <http://sourceforge.net/p/kaarpux/code/ci/f1e289016f250a36db9abc1b9c8977c791620b07/>`_)

- UPD: llvm: v 3.4beta: snapshot of upcoming v 3.4
  (Commit `c1172a65 <http://sourceforge.net/p/kaarpux/code/ci/c1172a65bb8364ceba990438ac7a99cec1ecd45d/>`_)

- UPD: binutils: v 2.24
  (Commit `5015d7f7 <http://sourceforge.net/p/kaarpux/code/ci/5015d7f7e20fe733b67439c37c47e7aea6bb1810/>`_)

- UPD: bluez: v 5.13
  (Commit `510d8755 <http://sourceforge.net/p/kaarpux/code/ci/510d87555046486c78965abe065e3fc0b368d2ef/>`_)

- UPD: coreutils: v 8.22
  (Commit `11ce5363 <http://sourceforge.net/p/kaarpux/code/ci/11ce5363f5d5efd66ceea3c1a4c2851bfb30bc1a/>`_)

- UPD: exempi: v 2.2.1; also: use_gcc
  (Commit `13ff9c0b <http://sourceforge.net/p/kaarpux/code/ci/13ff9c0b3dc5377bc7615b10d29a93b0561bcac6/>`_)

- UPD: gdb: v 7.6.2
  (Commit `cb661d57 <http://sourceforge.net/p/kaarpux/code/ci/cb661d57b7e77f3565eac84e0cf10f55584e2d50/>`_)

- UPD: xcb-proto libxcb: v 1.10
  (Commit `0c148c39 <http://sourceforge.net/p/kaarpux/code/ci/0c148c3952a0236a59c7acbe21a1b0c09c38f086/>`_)

- UPD: ltrace: v 0.7.3
  (Commit `f218f997 <http://sourceforge.net/p/kaarpux/code/ci/f218f997de69e075bd847149a3c6672d5c19aab2/>`_)

- UPD: poppler: v 0.24.5; also use_gcc
  (Commit `39b6a555 <http://sourceforge.net/p/kaarpux/code/ci/39b6a5559203c886959ce788d84b5ac4505a5dea/>`_)

- UPD: WebKit: v 2.3.3; also use_gcc
  (Commit `a08a797e <http://sourceforge.net/p/kaarpux/code/ci/a08a797e7f923ee52fd87124bd1954d00b8b9aa4/>`_)

- UPD: cups-filters: 1.0.43
  (Commit `b86a0929 <http://sourceforge.net/p/kaarpux/code/ci/b86a09298db07394de97f4897b37fa658cbbd30f/>`_)

- UPD: openssl: v 1.0.1f
  (Commit `641c977f <http://sourceforge.net/p/kaarpux/code/ci/641c977fd8d301b5c17a884ed83c7b5cc3d57adc/>`_)

- UPD: openssh: v 6.4p1
  (Commit `7b48c71c <http://sourceforge.net/p/kaarpux/code/ci/7b48c71c3b9ea150db3a2691635d50f80daffd24/>`_)

- UPD: nss: v 3.15.4
  (Commit `e9a56711 <http://sourceforge.net/p/kaarpux/code/ci/e9a56711f46535dbb877189b8a29b41bfe4dcae1/>`_)

- UPD: gnutls: v 3.1.18
  (Commit `0c8f9657 <http://sourceforge.net/p/kaarpux/code/ci/0c8f965744c05f3ddc8d85cef854b7e84835f99b/>`_)

- UPD: noscript: v 2.6.8.10
  (Commit `3e78d050 <http://sourceforge.net/p/kaarpux/code/ci/3e78d05073cedd2377df1e53c989f4c3c0fd9e83/>`_)

- UPD: p11-kit: v 0.20.1
  (Commit `9251cf6e <http://sourceforge.net/p/kaarpux/code/ci/9251cf6ebe6f08d94cbc61a7f2c8290fe36cbece/>`_)

- UPD: nettle: v 2.7.1
  (Commit `87b1aaea <http://sourceforge.net/p/kaarpux/code/ci/87b1aaea2703817222ebf858bf16d04fb91f3120/>`_)

- UPD: gnutls: v 3.2.8.1
  (Commit `cefde88b <http://sourceforge.net/p/kaarpux/code/ci/cefde88be61f24581f5a53e55cd60115bd48863a/>`_)

- UPD: provider_for_google_calendar: v 0.25
  (Commit `60ed1d0a <http://sourceforge.net/p/kaarpux/code/ci/60ed1d0a96635eb58fd10acc8042ea646d51615a/>`_)

- FIX: KxBuild: move libtasn1 before nettle and p11-kit before gnutls
  (Commit `31c781ca <http://sourceforge.net/p/kaarpux/code/ci/31c781ca8d3e284b48c0606a58feb1c2e92533c7/>`_)

- FIX: KxBuild: move bluez after ical
  (Commit `58f9fbc6 <http://sourceforge.net/p/kaarpux/code/ci/58f9fbc682512b2794d85513d0302b9ace6d926b/>`_)


Packages added
##############

- ADD: libclc, lm_sensors
  (Commit `b0c932bf <http://sourceforge.net/p/kaarpux/code/ci/b0c932bf2808c6744953a9545fa6ee2f98e49769/>`_)

- FIX: lm_sensors: correct package name in master.yaml
  (Commit `b1c76541 <http://sourceforge.net/p/kaarpux/code/ci/b1c76541f9618ef6e56ee8087b20f18c293c470c/>`_)


Minor Changes
#############

- REMOVE: xorg-drivers: remove unused intel driver
  (Commit `7400f4fb <http://sourceforge.net/p/kaarpux/code/ci/7400f4fb52b8270201b544e2ca2d009d7ee04f79/>`_)

- IMPROVE: luit xmodmap: remember to build them
  (Commit `c252319c <http://sourceforge.net/p/kaarpux/code/ci/c252319ccdacf2060cfc74473940976d1724565d/>`_)

- IMPROVE: cracklib: make install reentrant
  (Commit `7b9c1b75 <http://sourceforge.net/p/kaarpux/code/ci/7b9c1b7559f275416e8375379a04611ff72bc558/>`_)

- MINOR: kx_version.plinc: split version substitution into own function
  (Commit `f957f5bd <http://sourceforge.net/p/kaarpux/code/ci/f957f5bde603a0693915501c3eee752edfa10f43/>`_)

- MINOR: KxBuild: show number of processors and amount of memory
  (Commit `f02ec0da <http://sourceforge.net/p/kaarpux/code/ci/f02ec0daa89ddd2f1b0177b50cac416776d6ecc9/>`_)

- IMPROVE: KxBuild: 48G build dirs
  (Commit `f0d2efaf <http://sourceforge.net/p/kaarpux/code/ci/f0d2efafe017ea4a70d891ab042f2a56426ea79b/>`_)

- IMPROVE: KxBuild: only import gpg keys not already in keyring
  (Commit `8598e504 <http://sourceforge.net/p/kaarpux/code/ci/8598e50422dbbbf28a90616f0f4681fcb011bc1c/>`_)

- IMPROVE: KaarPux: add /opt/share/pkgconfig to PKG_CONFIG_PATH in etc/profile.d/opt.sh
  (Commit `55e50ce1 <http://sourceforge.net/p/kaarpux/code/ci/55e50ce1329f38854663526496a9c378bed75825/>`_)

- MINOR: KxBuild: copyright 2014
  (Commit `15500ef5 <http://sourceforge.net/p/kaarpux/code/ci/15500ef5b5c6fe0f1c9cdd32ec7540a2ebd82ebf/>`_)

- MINOR: KxBuild: copyright 2014
  (Commit `4048f50d <http://sourceforge.net/p/kaarpux/code/ci/4048f50d04034692e5d92371688d16c6aa660f64/>`_)


