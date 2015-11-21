.. 
   KaarPux: http://kaarpux.kaarposoft.dk
   Copyright (C) 2015: Henrik Kaare Poulsen
   License: http://kaarpux.kaarposoft.dk/license.html

.. _changes_4_10_0:


=================================
Changes in KaarPux version 4.10.0
=================================

:program:`KaarPux` version ``4.10.0`` released on ``2015-oct-19``

- Build llvm with polly/isl

- Most packages updated to latest version

- Minor changes, bugfixes and documentation updates

Packages not updated:

- Keep linux kernel version at 4.1.*, as it is longterm supported

- Haskell and related packages not updated, as they seem quite stable.


Build llvm with polly/isl
#########################

- UPD: llvm: v 3.7.0; and build with polly/isl
  (Commit `0ce31c8f <http://sourceforge.net/p/kaarpux/code/ci/0ce31c8f92645d32b050c59c6a9ae84526e8b58e/>`_)


Packages updated
################

- UPD: texinfo: v 6.0
  (Commit `e15068ca <http://sourceforge.net/p/kaarpux/code/ci/e15068cad494c2848cac881d0e44092d1d7f2103/>`_)

- UPD: glib: v 2.46.0
  (Commit `fdf9e98e <http://sourceforge.net/p/kaarpux/code/ci/fdf9e98e0c031a41ab22b0d31a5b5039c27bc11d/>`_)

- UPD: ncurses: v 6.0
  (Commit `6a669345 <http://sourceforge.net/p/kaarpux/code/ci/6a66934579466253933cfc4a727a6261f95b194f/>`_)

- UPD: check: v 0.10.0
  (Commit `9a31485c <http://sourceforge.net/p/kaarpux/code/ci/9a31485ce01d4b079dbdeb92070392143086149e/>`_)

- UPD: cpio: v 2.12
  (Commit `abb1a808 <http://sourceforge.net/p/kaarpux/code/ci/abb1a80806f1e711c63e563350598708811d124c/>`_)

- UPD: dbus: v 1.10.0
  (Commit `23bd993b <http://sourceforge.net/p/kaarpux/code/ci/23bd993bbc49a9470ed7b2b0fa079e75cf9add05/>`_)

- UPD: file: v 5.25
  (Commit `be916306 <http://sourceforge.net/p/kaarpux/code/ci/be916306464448417894586281f164628d136d3e/>`_)

- UPD: gettext: v 0.19.6
  (Commit `dde7bf21 <http://sourceforge.net/p/kaarpux/code/ci/dde7bf21e85653721ad84c8564fc76061e43b264/>`_)

- UPD: help2man: v 1.47.2
  (Commit `b61cad5e <http://sourceforge.net/p/kaarpux/code/ci/b61cad5e0ba9670f0798fee1c40b0eeadf8e0c5c/>`_)

- UPD: icu: v 56.1
  (Commit `31d94914 <http://sourceforge.net/p/kaarpux/code/ci/31d94914964a47a72d6595dceb097c7bca2dcb05/>`_)

- UPD: iproute2: v 4.2.0
  (Commit `c441d316 <http://sourceforge.net/p/kaarpux/code/ci/c441d3163f1bc37adb5586df96e87504034a0b0a/>`_)

- UPD: kbd: v 2.0.3
  (Commit `c0a7516e <http://sourceforge.net/p/kaarpux/code/ci/c0a7516e54221b93fda68635f65a8ea07cb1b267/>`_)

- UPD: less: v 481
  (Commit `2f6652be <http://sourceforge.net/p/kaarpux/code/ci/2f6652bed02b58225e4ffaac865bb7c96378e2b8/>`_)

- UPD: libnetfilter_conntrack: v 1.0.5
  (Commit `4fcdbfc3 <http://sourceforge.net/p/kaarpux/code/ci/4fcdbfc34dcfe2e48f22aeec2871cdb46220c47e/>`_)

- UPD: libpcap: v 1.7.4
  (Commit `d60a9bfe <http://sourceforge.net/p/kaarpux/code/ci/d60a9bfeccc147aa777d11ed219a9277c1e7218a/>`_)

- UPD: libpipeline: v 1.4.1
  (Commit `16bb2d13 <http://sourceforge.net/p/kaarpux/code/ci/16bb2d132e1284b5ab9f8a3a35c6da3e4862e3a0/>`_)

- UPD: libusb: v 1.0.20
  (Commit `c1aea637 <http://sourceforge.net/p/kaarpux/code/ci/c1aea637d73e540ce8b0362ed06528bbe12efbed/>`_)

- UPD: linux: v 4.1.10
  (Commit `03e5dce9 <http://sourceforge.net/p/kaarpux/code/ci/03e5dce94daf1f1ee96187791d62c62f14cb4978/>`_)

- UPD: linux-firmware: v 20150904
  (Commit `1ef56eed <http://sourceforge.net/p/kaarpux/code/ci/1ef56eede3af41ab9cdc48ba562b561a559d5801/>`_)

- UPD: man-pages: v 4.02
  (Commit `8fb4515b <http://sourceforge.net/p/kaarpux/code/ci/8fb4515be3bfdbf988bc04913fa83f37a4da2dea/>`_)

- UPD: man-db: v 2.7.4
  (Commit `bd540d8b <http://sourceforge.net/p/kaarpux/code/ci/bd540d8b986253d595238ca577736b8116b34ae2/>`_)

- UPD: mcelog: v 128
  (Commit `d71b5374 <http://sourceforge.net/p/kaarpux/code/ci/d71b53749219bcd9a93d6a2c31c6bd53390937b6/>`_)

- UPD: os-prober: v 1.67
  (Commit `8c488007 <http://sourceforge.net/p/kaarpux/code/ci/8c48800752431fe4d9b0a073674fb060fcaa2670/>`_)

- UPD: parallel: v 20150922
  (Commit `c3342bf4 <http://sourceforge.net/p/kaarpux/code/ci/c3342bf42026c2ee4dc6378da418262c72d2adc7/>`_)

- UPD: pciutils: v 3.4.0
  (Commit `9afcf775 <http://sourceforge.net/p/kaarpux/code/ci/9afcf77546ffa65740393d8abc8c6f298e488d91/>`_)

- UPD: pkg-config: v 0.29
  (Commit `94ac0e42 <http://sourceforge.net/p/kaarpux/code/ci/94ac0e42d11ff71d44756356845aa94b467e939b/>`_)

- UPD: procps-ng: v 3.3.11
  (Commit `e2596a36 <http://sourceforge.net/p/kaarpux/code/ci/e2596a36fcec4bff36a67a9453a1500bf4ae7184/>`_)

- UPD: screen: v 4.3.1
  (Commit `bc1f725a <http://sourceforge.net/p/kaarpux/code/ci/bc1f725aee22f125ec007a28442f943e6d0844de/>`_)

- UPD: sysstat: v 11.1.7
  (Commit `6eecfe75 <http://sourceforge.net/p/kaarpux/code/ci/6eecfe75274946ea916bd13bc33b85e80d862330/>`_)

- UPD: systemd: v 227
  (Commit `a81093c8 <http://sourceforge.net/p/kaarpux/code/ci/a81093c8a8e5c061f6065e7b68d0147911cac886/>`_)

- UPD: tzdata: v 2015g
  (Commit `ddcb9cea <http://sourceforge.net/p/kaarpux/code/ci/ddcb9ceadc85d7133044e3377646ff6b80ecf59f/>`_)

- UPD: util-linux: v 2.27
  (Commit `0e55c257 <http://sourceforge.net/p/kaarpux/code/ci/0e55c257ed33f6bfcb9d6e35349106b702eae020/>`_)

- UPD: xz: v 5.2.2
  (Commit `4f6d7f66 <http://sourceforge.net/p/kaarpux/code/ci/4f6d7f66c59e597b0f481ebd39d3a6bf11211a1c/>`_)

- UPD: doxygen: v 1.8.10
  (Commit `50ae9313 <http://sourceforge.net/p/kaarpux/code/ci/50ae9313b03621310eda90dd3a2929d1257af034/>`_)

- UPD: exiv2: v 0.25
  (Commit `50632ad5 <http://sourceforge.net/p/kaarpux/code/ci/50632ad5f6a4692628eace1cd1bca8e87a2bf313/>`_)

- UPD: valgrind: v 3.11.0
  (Commit `26e3ce5c <http://sourceforge.net/p/kaarpux/code/ci/26e3ce5c06b8c102a10db49c3802bac6057f2756/>`_)

- UPD: openvas-libraries: v 8.0.5
  (Commit `639719a3 <http://sourceforge.net/p/kaarpux/code/ci/639719a344ec03591b885ffee547e778f4cf943e/>`_)

- UPD: openvas-scanner: v 5.0.4
  (Commit `581c0fa9 <http://sourceforge.net/p/kaarpux/code/ci/581c0fa94698e9b32053025e744e7f0fdf7e259f/>`_)

- UPD: openvas-cli: v 1.4.2
  (Commit `9dc37127 <http://sourceforge.net/p/kaarpux/code/ci/9dc37127731d6a0076b1c9de1922e7f5d2e49cc1/>`_)

- UPD: openvas-manager: v 6.0.6
  (Commit `7933030f <http://sourceforge.net/p/kaarpux/code/ci/7933030fc12e7e52698a6ec4cb42b4da4009455d/>`_)

- UPD: greenbone-security-assistant: v 6.0.6
  (Commit `3729b0bc <http://sourceforge.net/p/kaarpux/code/ci/3729b0bced500081057a3a3c2a003b14e0a70bac/>`_)

- UPD: acpica: v 20150930
  (Commit `2bbbc829 <http://sourceforge.net/p/kaarpux/code/ci/2bbbc8295092ea3272b6f71ce399db5ac5912407/>`_)

- UPD: astroid: v 1.3.8
  (Commit `1f68a4dc <http://sourceforge.net/p/kaarpux/code/ci/1f68a4dcae0d4b67a78e2ee4e869c6797164865c/>`_)

- UPD: boost: v 1.59.0
  (Commit `921429fe <http://sourceforge.net/p/kaarpux/code/ci/921429fe8954daed5ea710fbd48c85a676b22c4d/>`_)

- UPD: boto3: v 1.1.4
  (Commit `2aafc8a9 <http://sourceforge.net/p/kaarpux/code/ci/2aafc8a9c0efbd5777f05ee992780bf6882d32da/>`_)

- UPD: botocore: v 1.1.12
  (Commit `4e2f7b35 <http://sourceforge.net/p/kaarpux/code/ci/4e2f7b3578fef1c48d728e5a92efc9f53b970a3a/>`_)

- UPD: cliapp: v 1.20150829
  (Commit `2fbd9aa7 <http://sourceforge.net/p/kaarpux/code/ci/2fbd9aa7abb82637a8294190d7d125f0ac9af6f6/>`_)

- UPD: cmake: v 3.3.2
  (Commit `92f1fe58 <http://sourceforge.net/p/kaarpux/code/ci/92f1fe58deeb9444177a110aa20e4f6a3e9a3f9a/>`_)

- UPD: cmdtest: v 0.16
  (Commit `7990ba03 <http://sourceforge.net/p/kaarpux/code/ci/7990ba03cdddecff1194614fb4be3225c2b9f619/>`_)

- UPD: cracklib: v 2.9.5
  (Commit `d63c0805 <http://sourceforge.net/p/kaarpux/code/ci/d63c0805fa6d02c8bffcaaf85e9628faf13ac874/>`_)

- UPD: curl: v 7.45.0
  (Commit `295b7cac <http://sourceforge.net/p/kaarpux/code/ci/295b7cacd3b6df080d40e1b124f610df3e54d5f8/>`_)

- UPD: device-mapper: v 2.02.132
  (Commit `f6438f33 <http://sourceforge.net/p/kaarpux/code/ci/f6438f33627f3b8e1409be0cbede1a3d3151a148/>`_)

- UPD: dhcpcd: v 6.9.3
  (Commit `c81ef01c <http://sourceforge.net/p/kaarpux/code/ci/c81ef01c1edfead111bfe40f858e0cfaf5dc1ee2/>`_)

- UPD: dmidecode: v 3.0
  (Commit `9ddd96bb <http://sourceforge.net/p/kaarpux/code/ci/9ddd96bb8211b4d4e0e637a225566ce9f6ceffee/>`_)

- UPD: ed: v 1.12
  (Commit `15a1c8ea <http://sourceforge.net/p/kaarpux/code/ci/15a1c8eaa260dc58a65b500d234d0e7d8a8c9032/>`_)

- UPD: freetype: v 2.6.1
  (Commit `7787afa8 <http://sourceforge.net/p/kaarpux/code/ci/7787afa81071e315e78749ae7f8c885175c29227/>`_)

- UPD: gdb: v 7.10
  (Commit `51225766 <http://sourceforge.net/p/kaarpux/code/ci/51225766ad714cf02eaf057aebe34c762f837111/>`_)

- UPD: git: v 2.6.1
  (Commit `a57466a9 <http://sourceforge.net/p/kaarpux/code/ci/a57466a97d29ac60db1414fd84302117e15313e4/>`_)

- UPD: gobject-introspection: v 1.46.0
  (Commit `de4326a3 <http://sourceforge.net/p/kaarpux/code/ci/de4326a30bc6b3ca4ef158c85f59cfc1d987a3b6/>`_)

- UPD: gpgme: v 1.6.0
  (Commit `a9f7e431 <http://sourceforge.net/p/kaarpux/code/ci/a9f7e4313e73c0acaf367265bb8bfbfa9d65abb1/>`_)

- UPD: libgphoto2: v 2.5.8
  (Commit `0336ef9f <http://sourceforge.net/p/kaarpux/code/ci/0336ef9f9822f696a588398fa7e85d429a70e902/>`_)

- UPD: gphoto2: v 2.5.8
  (Commit `c4195e4c <http://sourceforge.net/p/kaarpux/code/ci/c4195e4cc5d3f1d1de17a41ec9e4326c7f0988d1/>`_)

- UPD: hdparm: v 9.48
  (Commit `ad40c863 <http://sourceforge.net/p/kaarpux/code/ci/ad40c8630b43a006032ab29446bd807d3a3cec93/>`_)

- UPD: Jinja2: v 2.8
  (Commit `a153f24a <http://sourceforge.net/p/kaarpux/code/ci/a153f24a5828af2dad410599806a3bb83fb4a0fe/>`_)

- UPD: jmespath: v 0.9.0
  (Commit `90ab024c <http://sourceforge.net/p/kaarpux/code/ci/90ab024cb85b5e2c9b338b94189a79b11ee3ff20/>`_)

- UPD: libassuan: v 2.3.0
  (Commit `bc6edb02 <http://sourceforge.net/p/kaarpux/code/ci/bc6edb02d8536cafd0866ba98520ddf58a0d4e02/>`_)

- UPD: libgcrypt: v 1.6.4
  (Commit `a2013ffe <http://sourceforge.net/p/kaarpux/code/ci/a2013ffe66593fc2e1ab2641a0065730011967dc/>`_)

- UPD: libgpg-error: v 1.20
  (Commit `9d79e1b2 <http://sourceforge.net/p/kaarpux/code/ci/9d79e1b23d2b1d8e1fd63951e30eea78ab7285b1/>`_)

- UPD: libjpeg-turbo: v 1.4.2
  (Commit `60049d15 <http://sourceforge.net/p/kaarpux/code/ci/60049d15b0317ff12e6735f458f4581af405df70/>`_)

- UPD: libmicrohttpd: v 0.9.44
  (Commit `5a098195 <http://sourceforge.net/p/kaarpux/code/ci/5a098195a43297c43036db13a18b4607918cfac2/>`_)

- UPD: libmtp: v 1.1.10
  (Commit `095a6229 <http://sourceforge.net/p/kaarpux/code/ci/095a622992fb8016832fa590251b9b732d20da80/>`_)

- UPD: libsigc++: v 2.6.1
  (Commit `9269050a <http://sourceforge.net/p/kaarpux/code/ci/9269050ac144fbe8de2092654cb6c8f61e12516d/>`_)

- UPD: libtasn1: v 4.7
  (Commit `2b93af2d <http://sourceforge.net/p/kaarpux/code/ci/2b93af2ddb5ecfa3aa23b7a8c7d8d5e8d111e8cd/>`_)

- UPD: libtiff: v 4.0.6
  (Commit `d19d1e36 <http://sourceforge.net/p/kaarpux/code/ci/d19d1e36bcc07988772592e1c154d085b66c2f6b/>`_)

- UPD: v logilab-common: v 1.0.2
  (Commit `73cc590a <http://sourceforge.net/p/kaarpux/code/ci/73cc590a4345cab4fe8b8d9a6ccc7510b992c911/>`_)

- UPD: lxc: v 1.1.4
  (Commit `032b31d4 <http://sourceforge.net/p/kaarpux/code/ci/032b31d4e601d75187f27a464f9991dc7dcb7227/>`_)

- UPD: Python: v 3.5.0
  (Commit `5091a221 <http://sourceforge.net/p/kaarpux/code/ci/5091a221a246745b86621bc680e35f41d927b9e6/>`_)

- UPD: PERLMODULES: many perl modules updated
  (Commit `2c5fd3bb <http://sourceforge.net/p/kaarpux/code/ci/2c5fd3bb9d08737e4909a8898029bc44499a90ea/>`_)

- UPD: pixman: v 0.32.8
  (Commit `2efc0357 <http://sourceforge.net/p/kaarpux/code/ci/2efc03572a4b916b56267b59bed9a570f31518b3/>`_)

- UPD: poppler: v 0.37.0
  (Commit `b31c5e93 <http://sourceforge.net/p/kaarpux/code/ci/b31c5e93e7f77192e4e324a90aa108948eb4cc98/>`_)

- UPD: pylint: v 1.4.4
  (Commit `b0f2fc7a <http://sourceforge.net/p/kaarpux/code/ci/b0f2fc7ababd968e485ec74130a15874722c3cff/>`_)

- UPD: python-twisted: v 15.4.0
  (Commit `9ed82f61 <http://sourceforge.net/p/kaarpux/code/ci/9ed82f61aab652a80e602f1c047f616319ed306d/>`_)

- UPD: ruby: v 2.2.3
  (Commit `367fe657 <http://sourceforge.net/p/kaarpux/code/ci/367fe6570a679bcea59b0e3b80a5934c9b71ee5c/>`_)

- UPD: samba: v 4.3.0
  (Commit `22636673 <http://sourceforge.net/p/kaarpux/code/ci/22636673a584ee947ff31fdbd44946e8587857ae/>`_)

- UPD: setuptools2 setuptools3: v 18.3.2
  (Commit `d52243bb <http://sourceforge.net/p/kaarpux/code/ci/d52243bb1c3be764b898a30175f3d0ce3bd30752/>`_)

- UPD: ttystatus: v 0.27
  (Commit `284ec72b <http://sourceforge.net/p/kaarpux/code/ci/284ec72b87b3237e73b11da409e9182edd244422/>`_)

- UPD: vala: v 0.30.0
  (Commit `6e00656e <http://sourceforge.net/p/kaarpux/code/ci/6e00656ecc910eb091ed5de54053323aa157b8d2/>`_)

- UPD: wavpack: v 4.75.2
  (Commit `46027a51 <http://sourceforge.net/p/kaarpux/code/ci/46027a51d244b9451ef35a2b2c3f077025b18354/>`_)

- UPD: zope.interface: v 4.1.3
  (Commit `62c44787 <http://sourceforge.net/p/kaarpux/code/ci/62c44787453529c81cf4d5739263109d28141b63/>`_)

- UPD: glew: v 1.13.0
  (Commit `f6c22847 <http://sourceforge.net/p/kaarpux/code/ci/f6c22847455413b1158fe75e284f779d178864d8/>`_)

- UPD: libclc: v 6d784075bc56815b0fc493690572c893979abbdd => 2015-10-06
  (Commit `f572bb89 <http://sourceforge.net/p/kaarpux/code/ci/f572bb89e2df118385851e87866036bb3a5141eb/>`_)

- UPD: libdrm: v 2.4.65
  (Commit `effc3de7 <http://sourceforge.net/p/kaarpux/code/ci/effc3de7957387ba9b2d665ea475caa8f7c01931/>`_)

- UPD: libepoxy: v 1.3.1
  (Commit `64ab2399 <http://sourceforge.net/p/kaarpux/code/ci/64ab23999778bbc7c3007792fc4e8ae7e99bf93b/>`_)

- UPD: libevdev: v 1.4.4
  (Commit `6f37ce03 <http://sourceforge.net/p/kaarpux/code/ci/6f37ce038788562d4011a4008d9a1450c58af97c/>`_)

- UPD: libxcb: v 1.11.1
  (Commit `835ccdd9 <http://sourceforge.net/p/kaarpux/code/ci/835ccdd940d0c2963b348e8c532e998e2eaac2bc/>`_)

- UPD: xf86-input-wacom: v 0.31.0
  (Commit `0545c4a9 <http://sourceforge.net/p/kaarpux/code/ci/0545c4a96e355ee44ab49d01f82bd550deefcda7/>`_)

- UPD: xf86-video-vesa: v 2.3.4
  (Commit `0719938e <http://sourceforge.net/p/kaarpux/code/ci/0719938e5a730cb7ec7c388707b32466465b9cc8/>`_)

- UPD: xterm: v 320
  (Commit `6dd690cb <http://sourceforge.net/p/kaarpux/code/ci/6dd690cb539eb16399bb587ad7b91f2acde0fdc6/>`_)

- UPD: xorg-proto: packages updated to latest version
  (Commit `7a6cd928 <http://sourceforge.net/p/kaarpux/code/ci/7a6cd92805206f6473082f5701a620fa6c6d967b/>`_)

- UPD: xorg-lib2: packages updated to latest version
  (Commit `2733af41 <http://sourceforge.net/p/kaarpux/code/ci/2733af4107ae73f3d3d0489c596b75276deb00f3/>`_)

- UPD: libXi: v 1.7.5
  (Commit `d88eee35 <http://sourceforge.net/p/kaarpux/code/ci/d88eee3547bab56c48dd75d60b2b27a08f6bc9d4/>`_)

- UPD: MesaLib: v 11.0.3
  (Commit `03844ba6 <http://sourceforge.net/p/kaarpux/code/ci/03844ba6cfd511b2398c22bcac70fa8eee0bc8cc/>`_)

- UPD: at-spi2-core: v 2.18.0
  (Commit `1ecd753b <http://sourceforge.net/p/kaarpux/code/ci/1ecd753b95246a7a5363bc1e18b457292c7d0aa2/>`_)

- UPD: bluez: v 5.35
  (Commit `6d3077af <http://sourceforge.net/p/kaarpux/code/ci/6d3077afbac9095e55789a7ffa4389c97cc22bdd/>`_)

- UPD: cairomm: v 1.12.0
  (Commit `8a3f7ede <http://sourceforge.net/p/kaarpux/code/ci/8a3f7ede07f7956fa7e0316b9903b8f6a783fd44/>`_)

- UPD: cups: v 2.1.0
  (Commit `b3350c59 <http://sourceforge.net/p/kaarpux/code/ci/b3350c59ccd6f9d4d93650ad320938e5668adf1e/>`_)

- UPD: ghostscript: v 9.18
  (Commit `924b25a5 <http://sourceforge.net/p/kaarpux/code/ci/924b25a5fd661437f93c99a990722bc5e02e1d56/>`_)

- UPD: gnome-common: v 3.18.0
  (Commit `3866f505 <http://sourceforge.net/p/kaarpux/code/ci/3866f5050b581d1172a37f08affc55bedd3c60f9/>`_)

- UPD: hplip: v 3.15.9
  (Commit `0b5f81b8 <http://sourceforge.net/p/kaarpux/code/ci/0b5f81b80f06fe05acaa60b304c73b7b9683c60e/>`_)

- UPD: iso-codes: v 3.62
  (Commit `efab972c <http://sourceforge.net/p/kaarpux/code/ci/efab972c1d387ac3bfe8a68eab1b231e36c08796/>`_)

- UPD: libpwquality: v 1.3.0
  (Commit `3be9e87f <http://sourceforge.net/p/kaarpux/code/ci/3be9e87f7b2991c44f8293368916d1b87b356ee9/>`_)

- UPD: libsndfile: v 4b14e4519031abe6c842cdb017bfa3d206ed8a99
  (Commit `54117ca6 <http://sourceforge.net/p/kaarpux/code/ci/54117ca66d24a7e5a7904165a626c8b21d5066e4/>`_)

- UPD: pyatspi: v 2.18.0
  (Commit `a8e6fe3f <http://sourceforge.net/p/kaarpux/code/ci/a8e6fe3fb9ce1d9fd9daff04ee8501f78850d5de/>`_)

- UPD: pyatspi3: v 2.18.0
  (Commit `989abed4 <http://sourceforge.net/p/kaarpux/code/ci/989abed49bfca4e76f3f8f95205b5172e0b70192/>`_)

- UPD: pycups: v 1.9.73
  (Commit `8f9113bb <http://sourceforge.net/p/kaarpux/code/ci/8f9113bb3d9e78d567c85eec00daa9a7cdff8389/>`_)

- UPD: pygobject: v 3.18.0
  (Commit `b35f19d0 <http://sourceforge.net/p/kaarpux/code/ci/b35f19d06a78e6b63f0a6ce227fe86f3defcb665/>`_)

- UPD: requests: v 2.8.0
  (Commit `934b04e0 <http://sourceforge.net/p/kaarpux/code/ci/934b04e0a84222c057cdfbfa708c8b43dfca3855/>`_)

- UPD: shared-mime-info: v 1.5
  (Commit `96b96ea0 <http://sourceforge.net/p/kaarpux/code/ci/96b96ea01be34f37b9f5f76f3d3388713650e9ae/>`_)

- UPD: spice-protocol: v 0.12.10
  (Commit `6f24480c <http://sourceforge.net/p/kaarpux/code/ci/6f24480c70ee86e9fee77af9455bad313b62a19b/>`_)

- UPD: spice: v 0.12.6
  (Commit `50812667 <http://sourceforge.net/p/kaarpux/code/ci/50812667e0c5cb81ce12cafadb267f3e046aa285/>`_)

- UPD: wpa_supplicant: v 2.5
  (Commit `5a31ecb3 <http://sourceforge.net/p/kaarpux/code/ci/5a31ecb378154b208187d3e21edf423afd8fb6a8/>`_)

- UPD: x264: v 20151011-2245
  (Commit `a2a34354 <http://sourceforge.net/p/kaarpux/code/ci/a2a34354d60a5e1fbd9564d8d91f198845a51e96/>`_)

- UPD: xvidcore: v 1.3.4
  (Commit `a3daefd9 <http://sourceforge.net/p/kaarpux/code/ci/a3daefd95267132b8ea8e3138d9454ecc0be2b7c/>`_)

- UPD: gnome: v 3.18.0
  (Commit `c9c75c01 <http://sourceforge.net/p/kaarpux/code/ci/c9c75c0100cc11d9c43b839373a4b7b2106c4259/>`_)

- UPD: cups-filters: v 1.0.76
  (Commit `0497bdd4 <http://sourceforge.net/p/kaarpux/code/ci/0497bdd4eb5104ad7d586ea51bd8daedf5a1d821/>`_)

- UPD: d-feet: v 0.3.10
  (Commit `c095c600 <http://sourceforge.net/p/kaarpux/code/ci/c095c600b38a1c26a809313d7c9241a79a5528e2/>`_)

- UPD: foomatic-db: v 20150825
  (Commit `e871ccbe <http://sourceforge.net/p/kaarpux/code/ci/e871ccbead65aa37046618ad142440966d99145a/>`_)

- UPD: gedit-plugins: v 3.18.0
  (Commit `e35ba7a3 <http://sourceforge.net/p/kaarpux/code/ci/e35ba7a3ddc0cbe532608d3f7f95ee492418fc4b/>`_)

- UPD: qemu: v 2.4.0.1
  (Commit `59b3995e <http://sourceforge.net/p/kaarpux/code/ci/59b3995e2bd70a3f81604403978e01f444e6744f/>`_)

- UPD: qt: v 5.5.1
  (Commit `97e9d543 <http://sourceforge.net/p/kaarpux/code/ci/97e9d5430e6e3f8d0121e4402d9741190b2cdf8b/>`_)

- UPD: gegl: v 0.3.0
  (Commit `c13f8cba <http://sourceforge.net/p/kaarpux/code/ci/c13f8cbad5572af9b367b1506a11554eb1442d7c/>`_)

- Revert "UPD: gegl: v 0.3.0"
  (Commit `9d74dd5b <http://sourceforge.net/p/kaarpux/code/ci/9d74dd5b682d7ab2eca5b3f5b8897db770b10a49/>`_)

- UPD: protobuf: v 2.6.1
  (Commit `c2803304 <http://sourceforge.net/p/kaarpux/code/ci/c28033041a1b6d6281d82fe4e89ed272b729d012/>`_)

- UPD: firefox: v 41.0.2
  (Commit `5b3c4713 <http://sourceforge.net/p/kaarpux/code/ci/5b3c471330845deee94ec46f759d88619f7991ab/>`_)

- UPD: thunderbird: v 38.3.0
  (Commit `9211c5fb <http://sourceforge.net/p/kaarpux/code/ci/9211c5fb8152603c556c62e67c06ab5196e3273d/>`_)

- UPD: provider_for_google_calendar: v 1.0.4
  (Commit `f7dd72d0 <http://sourceforge.net/p/kaarpux/code/ci/f7dd72d08fe5b2ffd37556147e62741d07831b58/>`_)

- UPD: flash_player_11: v 11.2.202.535
  (Commit `e520c4da <http://sourceforge.net/p/kaarpux/code/ci/e520c4da174c00b3c08b3e74d70a02ce89bcce6c/>`_)

- UPD: openjdk: v 8u60-b28
  (Commit `811892ee <http://sourceforge.net/p/kaarpux/code/ci/811892eebacdc911071212d70076bf5f293631f4/>`_)

- UPD: mercurial: v 3.5.2
  (Commit `ab135576 <http://sourceforge.net/p/kaarpux/code/ci/ab1355765815a2e02f05410a3ae5dc33bc8869dc/>`_)

- UPD: wireshark: v 1.12.8
  (Commit `9fc42fbf <http://sourceforge.net/p/kaarpux/code/ci/9fc42fbfe25b249ebae3e91953311747884a2df7/>`_)

- UPD: bitcoin: v 0.11.1
  (Commit `be8fcd53 <http://sourceforge.net/p/kaarpux/code/ci/be8fcd53fff342970efe7d9291383621cf6fccec/>`_)

- UPD: dogecoin: v 1.8.3
  (Commit `76133a7c <http://sourceforge.net/p/kaarpux/code/ci/76133a7cc8be56b1825b06527cbcb4abd1151f65/>`_)

- UPD: bfgminer: v 5.3.0
  (Commit `247aeec8 <http://sourceforge.net/p/kaarpux/code/ci/247aeec8f97bc8fbf9a9c8e80400747e76eb3668/>`_)

- UPD: ocaml: v 4.02.3
  (Commit `066ddded <http://sourceforge.net/p/kaarpux/code/ci/066dddeda3c9fd3e390f8a92617a0d0823349d2c/>`_)

- UPD: nemiver: v 0.9.6
  (Commit `0a1f82ec <http://sourceforge.net/p/kaarpux/code/ci/0a1f82ecefdb29edfd3e731a65b0215807052a38/>`_)

- UPD: eclipse: v 4.5.1
  (Commit `cf8c76b7 <http://sourceforge.net/p/kaarpux/code/ci/cf8c76b756c3d228963ccd3c1165ffdda0b8f59d/>`_)

- UPD: at-spi2-atk: v 2.18.1
  (Commit `3bae8a5d <http://sourceforge.net/p/kaarpux/code/ci/3bae8a5dbb2dea95d3ef5e2b7b0bb5431c73b78f/>`_)

- UPD: at-spi2-core: v 2.18.1
  (Commit `a11684c4 <http://sourceforge.net/p/kaarpux/code/ci/a11684c4fb7163f2648b5cdf2e912775b3e9089f/>`_)

- UPD: cantarell-fonts: v 0.0.17.2
  (Commit `ac0935ef <http://sourceforge.net/p/kaarpux/code/ci/ac0935efa7d57456505fa846515c636dad376333/>`_)

- UPD: caribou: v 0.4.19
  (Commit `c8083916 <http://sourceforge.net/p/kaarpux/code/ci/c80839164bc3bf67f1e84ab251311870717bdc68/>`_)

- UPD: cheese: v 3.18.1
  (Commit `be402cbc <http://sourceforge.net/p/kaarpux/code/ci/be402cbc6974c3e5b97ae7f45f33d733ad50c01d/>`_)

- UPD: clutter: v 1.24.2
  (Commit `7467eb77 <http://sourceforge.net/p/kaarpux/code/ci/7467eb7763d68cc1fc273d9ac103778380db66ea/>`_)

- UPD: clutter-gst3: v 3.0.14
  (Commit `a5270d56 <http://sourceforge.net/p/kaarpux/code/ci/a5270d5678d6b568e63f0588e30c1a81f1bc98fd/>`_)

- UPD: coq: v 8.4pl6
  (Commit `727bf95d <http://sourceforge.net/p/kaarpux/code/ci/727bf95dd3da17524dcb129c883b0c621bf588ef/>`_)

- UPD: dconf-editor: v 3.18.1
  (Commit `eaf4ba3c <http://sourceforge.net/p/kaarpux/code/ci/eaf4ba3cd529541d308f7cff78ec03d50281ef3b/>`_)

- UPD: gdk-pixbuf: v 2.32.1
  (Commit `c7030d20 <http://sourceforge.net/p/kaarpux/code/ci/c7030d202c08c2b353dd2ca1b57b259fa151a8da/>`_)

- UPD: gedit: v 3.18.1
  (Commit `1a537a31 <http://sourceforge.net/p/kaarpux/code/ci/1a537a31fba40b36f6762535910ded4da813adab/>`_)

- UPD: glib: v 2.46.1
  (Commit `b7d040b0 <http://sourceforge.net/p/kaarpux/code/ci/b7d040b03baf86d27424cc8eb64a0545498dc640/>`_)

- UPD: glib-networking: v 2.46.1
  (Commit `3b766481 <http://sourceforge.net/p/kaarpux/code/ci/3b766481d81256131fbc9d08f45424a1f4086606/>`_)

- UPD: gnome-calculator: v 3.18.1
  (Commit `6c3b8c2f <http://sourceforge.net/p/kaarpux/code/ci/6c3b8c2f277e1f3a854c7f6d5565e8419a81fb96/>`_)

- UPD: gnome-characters: v 3.18.1
  (Commit `dfb2f21e <http://sourceforge.net/p/kaarpux/code/ci/dfb2f21e5fb00bf21a6c1274f6a34ebb41165014/>`_)

- UPD: gnome-control-center: v 3.18.1
  (Commit `db0d8386 <http://sourceforge.net/p/kaarpux/code/ci/db0d8386b879ffb02a5944d641d22cebbf2b7848/>`_)

- UPD: gnome-desktop: 3.18.1
  (Commit `81ee0ad3 <http://sourceforge.net/p/kaarpux/code/ci/81ee0ad35889ec1a42411074c9d69e204824a5e4/>`_)

- UPD: gnome-disk-utility: v 3.18.1
  (Commit `28220ad3 <http://sourceforge.net/p/kaarpux/code/ci/28220ad35d3b93a975c3a236fda8707f01aa3bbc/>`_)

- UPD: gnome-logs: v 3.18.1
  (Commit `679049de <http://sourceforge.net/p/kaarpux/code/ci/679049de9e59d5cc1cd2ea36140a1293e253b28a/>`_)

- UPD: gnome-online-accounts: v 3.18.1
  (Commit `5575d098 <http://sourceforge.net/p/kaarpux/code/ci/5575d0984f9dbbffd8d86acef030b1f2c8342136/>`_)

- UPD: gnome-session: v 3.18.1.2
  (Commit `a6e141c6 <http://sourceforge.net/p/kaarpux/code/ci/a6e141c62c7b9266a4a644af15a2bb5ba8a6dc52/>`_)

- UPD: gnome-settings-daemon: v 3.18.1
  (Commit `70844be6 <http://sourceforge.net/p/kaarpux/code/ci/70844be63c192c862eed1b96c826ebd88d7ba461/>`_)

- UPD: gnome-shell-extensions: v 3.18.1
  (Commit `4842d6cf <http://sourceforge.net/p/kaarpux/code/ci/4842d6cf4a136433b1e7c90695e0a54dc83d9cbe/>`_)

- UPD: gnome-shell: v 3.18.1
  (Commit `42dc0a34 <http://sourceforge.net/p/kaarpux/code/ci/42dc0a34654ac3cc1695fcd8397066828488f4d4/>`_)

- UPD: gnome-taquin: v 3.18.1.1
  (Commit `ee050315 <http://sourceforge.net/p/kaarpux/code/ci/ee0503152a1fca033227e677a438d31fd404585b/>`_)

- UPD: gnome-terminal: v 3.18.1
  (Commit `3a6ebe08 <http://sourceforge.net/p/kaarpux/code/ci/3a6ebe08dd9c7f5fd0b95f3b7249682e16582feb/>`_)

- UPD: gnome-user-docs: v 3.18.1
  (Commit `4f7eb9d6 <http://sourceforge.net/p/kaarpux/code/ci/4f7eb9d6df8464fb96334e31674586e6f62199f4/>`_)

- UPD: gnupg: v 2.1.9
  (Commit `e3f94c05 <http://sourceforge.net/p/kaarpux/code/ci/e3f94c058ab9514217e239b83e83bb16963bfaae/>`_)

- UPD: grilo-plugins: v 0.2.16
  (Commit `66f22199 <http://sourceforge.net/p/kaarpux/code/ci/66f221992a26cbe0243b6356b3d8e4358ee1ec35/>`_)

- UPD: gst: v 1.6.0; gstreamer
  (Commit `2895d310 <http://sourceforge.net/p/kaarpux/code/ci/2895d310dcd9606c0681922c46b9053ef9e8c092/>`_)

- UPD: gtk+: v 3.18.2
  (Commit `bd0b353d <http://sourceforge.net/p/kaarpux/code/ci/bd0b353dc49337872bff2f6e8fc68d5f143089bc/>`_)

- UPD: gtksourceview: v 3.18.1
  (Commit `de6ad3a1 <http://sourceforge.net/p/kaarpux/code/ci/de6ad3a19cabefc908746e8ad209c2eb75b80298/>`_)

- UPD: gucharmap: v 3.18.1
  (Commit `6bb1b592 <http://sourceforge.net/p/kaarpux/code/ci/6bb1b5922dff01fdf9485b2c8f1b68efbdc068c7/>`_)

- UPD: gvfs: v 1.26.1.1
  (Commit `6b468bf1 <http://sourceforge.net/p/kaarpux/code/ci/6b468bf1eb107aedd2f7257c2b7bb8a9092fda5b/>`_)

- UPD: harfbuzz: v 1.0.6
  (Commit `22a033e7 <http://sourceforge.net/p/kaarpux/code/ci/22a033e7a779f23bf9202a01797ed8df280a9cfb/>`_)

- UPD: libgweather: v 3.18.1
  (Commit `681ad19a <http://sourceforge.net/p/kaarpux/code/ci/681ad19a6a248e8deea7049dbd6dfa467e14137d/>`_)

- UPD: libndp: v 1.5
  (Commit `cf9e24bc <http://sourceforge.net/p/kaarpux/code/ci/cf9e24bc21c9ebd944dbe14c053bbce5c30b905a/>`_)

- UPD: libreoffice: v 5.0.2.2
  (Commit `a998a6bb <http://sourceforge.net/p/kaarpux/code/ci/a998a6bb7757c58a21b8fd9f869b42f921736ce1/>`_)

- UPD: librsvg: 2.40.11
  (Commit `47bfb7ac <http://sourceforge.net/p/kaarpux/code/ci/47bfb7ac6bbe4993765a1b434fcdeaef96404fd7/>`_)

- UPD: libsoup: v 2.52.1
  (Commit `6e92b9f3 <http://sourceforge.net/p/kaarpux/code/ci/6e92b9f3d28371d6e33e1604903bc482795c1a03/>`_)

- UPD: libwacom: v 0.15
  (Commit `2333b55e <http://sourceforge.net/p/kaarpux/code/ci/2333b55ed1b9474bd543bfde48dc10336181049f/>`_)

- UPD: mutter: v 3.18.1
  (Commit `4495d382 <http://sourceforge.net/p/kaarpux/code/ci/4495d38204ec6ffc70849b47f7fbf62e0333cb50/>`_)

- UPD: network-manager-applet: v 1.0.6
  (Commit `b0e0c39e <http://sourceforge.net/p/kaarpux/code/ci/b0e0c39e723bdd55ac0d36dcaf135d872313299a/>`_)

- UPD: orca: v 3.18.1
  (Commit `2b277476 <http://sourceforge.net/p/kaarpux/code/ci/2b2774763dd3facd3380fbb638e7b607838d9e4c/>`_)

- UPD: pango: v 1.38.1
  (Commit `e6f6add9 <http://sourceforge.net/p/kaarpux/code/ci/e6f6add9bdeb6aabdb9e287d2aa94722847da0ca/>`_)

- UPD: nautilus: v 3.18.1
  (Commit `eaedf50d <http://sourceforge.net/p/kaarpux/code/ci/eaedf50da98c2937c67263b7507b17b8be3687b3/>`_)

- UPD: pulseaudio: v 7.0
  (Commit `d8a6f65c <http://sourceforge.net/p/kaarpux/code/ci/d8a6f65c567954be90e693a8da88a263f6d84d37/>`_)

- UPD: requests: v 2.8.1
  (Commit `029153a1 <http://sourceforge.net/p/kaarpux/code/ci/029153a1c3a686fdea571879867ad529614d6a26/>`_)

- UPD: setuptools*: v 18.4
  (Commit `ff5f89f0 <http://sourceforge.net/p/kaarpux/code/ci/ff5f89f0bb386a48baf5aab36eb05b43b37c823e/>`_)

- UPD: spice-gtk: v 0.30
  (Commit `21debd77 <http://sourceforge.net/p/kaarpux/code/ci/21debd7789d37239d5cdbf3a00471e72ff7287bd/>`_)

- UPD: totem: v 3.18.1
  (Commit `ea82d3eb <http://sourceforge.net/p/kaarpux/code/ci/ea82d3eb05ccdc2b455fdcc3426fe81d370e7e72/>`_)

- UPD: vinagre: v 3.18.1
  (Commit `499cde93 <http://sourceforge.net/p/kaarpux/code/ci/499cde9347b1724518bd275bb971f74296fb0243/>`_)

- UPD: vte: v 0.42.1
  (Commit `153eac5e <http://sourceforge.net/p/kaarpux/code/ci/153eac5e2f5d2d637640663da9e2b1d4e7f64ebd/>`_)

- UPD: WebKit2: v 2.10.2
  (Commit `2b0d9a67 <http://sourceforge.net/p/kaarpux/code/ci/2b0d9a67e85739c353d8e442ff1792af194e8f26/>`_)

- UPD: yelp-xsl: v 3.18.1
  (Commit `491b278c <http://sourceforge.net/p/kaarpux/code/ci/491b278c3ea4ecb2369c628f6c0095b2d9de59ec/>`_)

- UPD: yelp: v 3.18.1
  (Commit `4f16317a <http://sourceforge.net/p/kaarpux/code/ci/4f16317af7997a61ed178a420d81aa0ad6688ff1/>`_)

- UPD: busybox: v 1.24.0
  (Commit `d2d1abc8 <http://sourceforge.net/p/kaarpux/code/ci/d2d1abc8d84857360a0cafd2cc6163fb2ea7ed80/>`_)

- UPD: elfutils: v 0.164
  (Commit `84c86afa <http://sourceforge.net/p/kaarpux/code/ci/84c86afa0359894e0701c522b305ddbf35573ebb/>`_)

- UPD: sqlite: v 3.9.1
  (Commit `0b2d9441 <http://sourceforge.net/p/kaarpux/code/ci/0b2d94413f41783ad3f63dbbe101992fa9de9d79/>`_)

- UPD: flash_player_11: 11.2.202.540
  (Commit `7761bcc4 <http://sourceforge.net/p/kaarpux/code/ci/7761bcc4760cb7644bea0370c12eb3c9f2b7ff08/>`_)

- FIX: pycairo: use newer waf
  (Commit `680a16a5 <http://sourceforge.net/p/kaarpux/code/ci/680a16a537022a5884f7f2bd749913a602069e99/>`_)

- FIX: hyphen: move to gnome_pre; now a prereq of GNOME
  (Commit `27b3c181 <http://sourceforge.net/p/kaarpux/code/ci/27b3c181d25e8e442daceca4f8479866b32738db/>`_)

- FIX: litecoin: compile with -fPIC
  (Commit `ed1f8f87 <http://sourceforge.net/p/kaarpux/code/ci/ed1f8f87b58addb04310317edaaf8c70879dd690/>`_)

- FIX: gdm: --enable-gdm-xsession
  (Commit `1691b768 <http://sourceforge.net/p/kaarpux/code/ci/1691b7687f8ef5490f09ffa7891006f184acaa52/>`_)

- FIX: systemd: core ignore -.slice and init.scope when isolating (from upstream)
  (Commit `d38d3448 <http://sourceforge.net/p/kaarpux/code/ci/d38d3448a7230b0c5e810fb8a67b60a286586ea6/>`_)

- ADD: hiredis libssh: prereq for openvas-libraries
  (Commit `2f36255b <http://sourceforge.net/p/kaarpux/code/ci/2f36255b1ba13d12e3fd131b38ca4756ca97c43f/>`_)

- ADD: camlp4 camlp5: split off from ocaml pagckage
  (Commit `88c2001b <http://sourceforge.net/p/kaarpux/code/ci/88c2001bfbfc6349cb32718eaa754994b2dbcc2a/>`_)

- REMOVE: empathy evolution-data-server evolution gnome-contacts libchamplain WebKit1; unwanted GNOME packages
  (Commit `fba7566b <http://sourceforge.net/p/kaarpux/code/ci/fba7566bb79dd424bd393529b7948e8743534b93/>`_)

- ADD: evolution-data-server: re-introduce, as it is prereq for other GNOME packages
  (Commit `ea114ab7 <http://sourceforge.net/p/kaarpux/code/ci/ea114ab75f1b0f6c98cb13660992e8e39475eb55/>`_)


Minor changes, bugfixes and documentation updates
#################################################

- MINOR: gpg_keys.txt: add GnuPG key
  (Commit `e7eb6f86 <http://sourceforge.net/p/kaarpux/code/ci/e7eb6f86c7184478de0e22988071c34e018e8d14/>`_)

- IMPROVE: lsof: use better mirror site for download
  (Commit `d302d9e5 <http://sourceforge.net/p/kaarpux/code/ci/d302d9e567278204a7290869ee5ff1ee67a41a07/>`_)

- IMPROVE: ltrace: add upstream version check
  (Commit `fd39a8c4 <http://sourceforge.net/p/kaarpux/code/ci/fd39a8c4cc6dce38e22fb89193666a9545390936/>`_)

- IMPROVE: npth: add upstream version check
  (Commit `4e0a84e1 <http://sourceforge.net/p/kaarpux/code/ci/4e0a84e141af609638fab8b669eab06fe22e34eb/>`_)

- IMPROVE: download_packages_2.sh: download GPG keys with wrong fingerprint again
  (Commit `405059f5 <http://sourceforge.net/p/kaarpux/code/ci/405059f52ccbe9e416a1c23194e83b6f2d28874c/>`_)

- IMPROVE: iptables: build libnetfilter_conntrack before iptables
  (Commit `ec1d03cc <http://sourceforge.net/p/kaarpux/code/ci/ec1d03cc4fb4a8a1c03b0f0f7adaf7170841c183/>`_)

- IMPROVE: KxBuild: use mirrors for GNU downloads
  (Commit `288742fa <http://sourceforge.net/p/kaarpux/code/ci/288742fab4acb757e917c50b4284884b092def5c/>`_)

- IMPROVE: KxBuild: add new GPG keys
  (Commit `1bb2600f <http://sourceforge.net/p/kaarpux/code/ci/1bb2600f933fdcc0c2f295e5a75fb39a2f0e7673/>`_)

- FIX: kx_gnome.pl: fix syntax
  (Commit `1e268afb <http://sourceforge.net/p/kaarpux/code/ci/1e268afbbf5e022c2686efa89ff51d9de593dd16/>`_)

- FIX: guile: do not verify signature with key which is now revoked
  (Commit `8d554f35 <http://sourceforge.net/p/kaarpux/code/ci/8d554f356102a41ea6cfb377b942904fe102004d/>`_)

- FIX: gpg_keys: remove unused, revoked keys
  (Commit `67e4181d <http://sourceforge.net/p/kaarpux/code/ci/67e4181dda724ad60623c49169526b7bdde704ee/>`_)

- FIX: kernel_kvm_performance_settings: handle device-names better
  (Commit `09370deb <http://sourceforge.net/p/kaarpux/code/ci/09370deb0a26e79535e61e83f5914c768531c693/>`_)

- FIX: kx_version.pl: handle PERLMODULE_ correctly
  (Commit `9845ccbd <http://sourceforge.net/p/kaarpux/code/ci/9845ccbda1ebf10b8d5f21f11928e25dc40b08c4/>`_)

- FIX: gpg_keys: re-introduce key, which was not stale after all
  (Commit `797a48f8 <http://sourceforge.net/p/kaarpux/code/ci/797a48f82ab764fa4099bb35201c3f529f286307/>`_)

- DOC: KaarPux: updated CVE info
  (Commit `08055394 <http://sourceforge.net/p/kaarpux/code/ci/080553945890086e0b2e0a887a38b65dbf4f6359/>`_)
