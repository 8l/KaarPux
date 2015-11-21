.. 
   KaarPux: http://kaarpux.kaarposoft.dk
   Copyright (C) 2015: Henrik Kaare Poulsen
   License: http://kaarpux.kaarposoft.dk/license.html

.. _changes_4_9_0:


================================
Changes in KaarPux version 4.9.0
================================

:program:`KaarPux` version ``4.9.0`` released on ``2015-jun-28``

Most packages updated to newest version; in particular:

- Linux 4.0.6

- GNOME 3.16.2

Also a few requisite packages added and bugs fixed.


Bugs fixed
##########

- FIX: perl: patch for gcc5
  (Commit `233ebb8a <http://sourceforge.net/p/kaarpux/code/ci/233ebb8a29de105322fcb1d220497dd755f17eee/>`_)

- FIX: qemu: CVE-2015-3456 (VENOM)
  (Commit `604cec58 <http://sourceforge.net/p/kaarpux/code/ci/604cec58f1a093d704d162426a279c8f31dc0812/>`_)

- FIX: ldns: incorrect use of defined with @array
  (Commit `a7dc28d3 <http://sourceforge.net/p/kaarpux/code/ci/a7dc28d344c9b2344ed24dac9ff546675035727e/>`_)

- FIX: valgrind: patch to allow Linux kernel 4.*
  (Commit `aa64c665 <http://sourceforge.net/p/kaarpux/code/ci/aa64c6655f7182316e49a84da2807f7e206acf60/>`_)

- FIX: nmap: use bundled liblua
  (Commit `f7aacf19 <http://sourceforge.net/p/kaarpux/code/ci/f7aacf19ade84d188bdc84546f9a6cf240b3670b/>`_)

- FIX: xf86-video-intel: more patches for compilation errors
  (Commit `572e20b1 <http://sourceforge.net/p/kaarpux/code/ci/572e20b1295fd9bfb5be6d1983157c30ee6327f1/>`_)

- FIX: mozjs17 mozjs24: patch for perl array
  (Commit `34b32f26 <http://sourceforge.net/p/kaarpux/code/ci/34b32f26e984a7265b1aab2699a17a33fe38a3ce/>`_)

- FIX: libtirpc: downgrade to 0.3.1
  (Commit `6dcd4efd <http://sourceforge.net/p/kaarpux/code/ci/6dcd4efd759656092645ae55bf453a6e9cb37e32/>`_)

- FIX: openssh: generate all host keys; systemd does not allow -N '' anymore
  (Commit `800be393 <http://sourceforge.net/p/kaarpux/code/ci/800be393a85113014872d4eb932e79fb15923d5c/>`_)

- FIX: cups: correct systemd paths
  (Commit `4d1103f3 <http://sourceforge.net/p/kaarpux/code/ci/4d1103f395449695763525ef06ef9b9fd84117e3/>`_)

- FIX: gdm: gdm logs to journald, but still tries to access logfile in /var/lib/gdm/.local/share
  (Commit `1abd7469 <http://sourceforge.net/p/kaarpux/code/ci/1abd74692653c82f8ea568bfdbe12e1ccb79c118/>`_)


Packages added
##############

- ADD: libgudev (split off from systemd)
  (Commit `3b5b2ef7 <http://sourceforge.net/p/kaarpux/code/ci/3b5b2ef74ff6a0f2ba8339ea6db744f364ae8c92/>`_)

- ADD: npth: prereq for gnupg
  (Commit `46bb3d78 <http://sourceforge.net/p/kaarpux/code/ci/46bb3d781ab4d9008fb23a4f695ac1fa715a248c/>`_)

- ADD: vte290: re-introduce vte290 as prereq to nemiver
  (Commit `92fba3e2 <http://sourceforge.net/p/kaarpux/code/ci/92fba3e2469a95287564eae75488f1657b1f47f9/>`_)

- ADD: gnome-logs; replacement for gnome-system-log
  (Commit `21cef5ce <http://sourceforge.net/p/kaarpux/code/ci/21cef5ce9df3c00c6c3da1c8f222418d7f515ece/>`_)

- ADD: requests: HTTP library, written in Python, for human beings; needed for cups
  (Commit `f24f2e8f <http://sourceforge.net/p/kaarpux/code/ci/f24f2e8fc115dbb20dfe332532a36c81cd246763/>`_)


Packages updated
################

- UPD: linux: v 3.18.14
  (Commit `15100241 <http://sourceforge.net/p/kaarpux/code/ci/1510024164a32aef1fb3b67659481b4970c378fa/>`_)

- UPD: icedtea-web: v 1.6
  (Commit `1eeae834 <http://sourceforge.net/p/kaarpux/code/ci/1eeae834aa6d409a050f3cd9cde93329a2cf9f1a/>`_)

- UPD: nss: v 3.19.1
  (Commit `33a9a2f0 <http://sourceforge.net/p/kaarpux/code/ci/33a9a2f08e369aaf525767270abaff679d411e7e/>`_)

- UPD: IO-Socket-SSL: v 2.015
  (Commit `c7dc333e <http://sourceforge.net/p/kaarpux/code/ci/c7dc333e2e7498194b36f4437756935f55514ede/>`_)

- UPD: pcre: v 8.37
  (Commit `4b81bcda <http://sourceforge.net/p/kaarpux/code/ci/4b81bcda261539c04a92960e1918738a07d85272/>`_)

- UPD: firefox: v 38.0.5
  (Commit `ba6e55f5 <http://sourceforge.net/p/kaarpux/code/ci/ba6e55f55f221d4282e9b86f92de3bf3858f2295/>`_)

- UPD: krb5: v 1.13.2
  (Commit `622c434d <http://sourceforge.net/p/kaarpux/code/ci/622c434dbb9427f7a7e8fa50c3db5795c8b40a71/>`_)

- UPD: bash: v 4.3.39
  (Commit `e97fe9dd <http://sourceforge.net/p/kaarpux/code/ci/e97fe9dd1cc6c14dc54d9bb7afe29bcae20eb34a/>`_)

- UPD: wireshark: v 1.12.5
  (Commit `dff89ba6 <http://sourceforge.net/p/kaarpux/code/ci/dff89ba60d9448870701092dab19488f2c313c23/>`_)

- UPD: openssl: v 1.0.2a
  (Commit `5bcc4f58 <http://sourceforge.net/p/kaarpux/code/ci/5bcc4f58f2d9644720606387ce1b32bcd0953dbf/>`_)

- UPD: linux: v 4.0.5
  (Commit `865f2c4c <http://sourceforge.net/p/kaarpux/code/ci/865f2c4c6280c9354def3c5488eafde8fa675e7c/>`_)

- UPD: systemd: v 220
  (Commit `16250ce7 <http://sourceforge.net/p/kaarpux/code/ci/16250ce73603f857635ca9de4c5efb94c127a878/>`_)

- UPD: ulogd: v 2.0.5
  (Commit `dd532fe1 <http://sourceforge.net/p/kaarpux/code/ci/dd532fe18f6ab62b75947efaa331320aba67b97b/>`_)

- UPD: perl: v 5.22.0
  (Commit `2f907b93 <http://sourceforge.net/p/kaarpux/code/ci/2f907b9366148d336adf6f9481e54e43de08d64f/>`_)

- UPD: XML-Parser: v 2.44
  (Commit `7fb03329 <http://sourceforge.net/p/kaarpux/code/ci/7fb0332977b33740184e99cfae33bc5c6b4fce11/>`_)

- UPD: busybox: v 1.23.2
  (Commit `86e7f744 <http://sourceforge.net/p/kaarpux/code/ci/86e7f74496cd85fa141f7c65e422697e6156a2a4/>`_)

- UPD: automake: v 1.15
  (Commit `35821b05 <http://sourceforge.net/p/kaarpux/code/ci/35821b051fd84b10fb4cdf5106945e14b70ab40f/>`_)

- UPD: berkeley-db: v 6.1.23
  (Commit `059cda1f <http://sourceforge.net/p/kaarpux/code/ci/059cda1ff5f0e993f9c8cdbf87b710c94fb2dcb5/>`_)

- UPD: bison: v 3.0.4
  (Commit `bb3e06a5 <http://sourceforge.net/p/kaarpux/code/ci/bb3e06a5339d0b6ef251403ba19d24d4f173fd4e/>`_)

- UPD: dbus: v 1.8.18
  (Commit `f19a4cc0 <http://sourceforge.net/p/kaarpux/code/ci/f19a4cc0ef5f4478e0ac0d211fdabc47674ffc3c/>`_)

- UPD: dejagnu: v 1.5.3
  (Commit `f2c70aff <http://sourceforge.net/p/kaarpux/code/ci/f2c70affa62cdfd405d4c9b06ce42157ea5e3daf/>`_)

- UPD: e2fsprogs: v 1.42.13
  (Commit `8db643af <http://sourceforge.net/p/kaarpux/code/ci/8db643af3d82558c000818044728f93d68117e30/>`_)

- UPD: efibootmgr: v 0.12
  (Commit `637353ec <http://sourceforge.net/p/kaarpux/code/ci/637353ec51e7090c3e03d5c057986be57ea55227/>`_)

- UPD: efivar: v 0.20
  (Commit `42489e04 <http://sourceforge.net/p/kaarpux/code/ci/42489e0484fd50de428418701900e2cbf523d998/>`_)

- UPD: gawk: v 4.1.3
  (Commit `10fdaf96 <http://sourceforge.net/p/kaarpux/code/ci/10fdaf96d1ed2611c044d47dfb971f83be17da91/>`_)

- UPD: gettext: v 0.19.4
  (Commit `b1ddf033 <http://sourceforge.net/p/kaarpux/code/ci/b1ddf03347c8a943866f91fe1e368fc4a45c6545/>`_)

- UPD: glib: v 2.44.1
  (Commit `19705955 <http://sourceforge.net/p/kaarpux/code/ci/19705955038146bcc5579728b6899c21769a0c5e/>`_)

- UPD: gptfdisk: v 1.0.0
  (Commit `8ae9d7d7 <http://sourceforge.net/p/kaarpux/code/ci/8ae9d7d75c25514ad2e6bde047d94ec9be7effde/>`_)

- UPD: help2man: v 1.46.6
  (Commit `dbfe02c0 <http://sourceforge.net/p/kaarpux/code/ci/dbfe02c07ff5ef3e114105f532e68f7124429fad/>`_)

- UPD: icu: v 55.1
  (Commit `0560e1a8 <http://sourceforge.net/p/kaarpux/code/ci/0560e1a829496d4d7b53db59b65f07dba4fca77a/>`_)

- UPD: inetutils: v 1.9.3
  (Commit `f641eeab <http://sourceforge.net/p/kaarpux/code/ci/f641eeabf410e0578997b51b7a8188841f02a26f/>`_)

- UPD: intltool: v 0.51.0
  (Commit `2f00bd9c <http://sourceforge.net/p/kaarpux/code/ci/2f00bd9cbd613e7e290137d97f813ede031f2859/>`_)

- UPD: iproute2: v 4.0.0
  (Commit `0bbb8f7f <http://sourceforge.net/p/kaarpux/code/ci/0bbb8f7f8578b0fdfc6b7d49d8624606efc7ad73/>`_)

- UPD: kmod: v 20
  (Commit `1a8f7782 <http://sourceforge.net/p/kaarpux/code/ci/1a8f7782aa4707fdf5e2370eb6961c1e4bdfa500/>`_)

- UPD: libpcap: v 1.7.3
  (Commit `996e5fd9 <http://sourceforge.net/p/kaarpux/code/ci/996e5fd94015dafc967439a48c46f98518f78c06/>`_)

- UPD: libtirpc: v 0.3.1
  (Commit `16402d3e <http://sourceforge.net/p/kaarpux/code/ci/16402d3ea54a959313c01a81ca231a8dadf2debb/>`_)

- UPD: libtool: v 2.4.6
  (Commit `669a40eb <http://sourceforge.net/p/kaarpux/code/ci/669a40ebf362f849fcbd8cc3651e94ae72416e73/>`_)

- UPD: linux-firmware: v 20150521
  (Commit `bb7bc0af <http://sourceforge.net/p/kaarpux/code/ci/bb7bc0afa16343d7f09726684aa90892ce0c4a06/>`_)

- UPD: linux-pam: v 1.2.0
  (Commit `4ee43820 <http://sourceforge.net/p/kaarpux/code/ci/4ee4382023e484ee76741b290c95dcd6dbc41ed9/>`_)

- UPD: man-pages: v 4.00
  (Commit `305759e7 <http://sourceforge.net/p/kaarpux/code/ci/305759e71f2840747570fbb352046b4753df115e/>`_)

- UPD: mcelog: v 118
  (Commit `9ae8120b <http://sourceforge.net/p/kaarpux/code/ci/9ae8120bea7447e12419d8ede6b3aa9a7f8e3de6/>`_)

- UPD: os-prober: v 1.65
  (Commit `f422e987 <http://sourceforge.net/p/kaarpux/code/ci/f422e987405856f0f2b43ac46ccb9bfa5d429120/>`_)

- UPD: Python2: v 2.7.10
  (Commit `4c41fd69 <http://sourceforge.net/p/kaarpux/code/ci/4c41fd6941740376e3d71fa1ebe517bf291c4b16/>`_)

- UPD: parallel: v 20150522
  (Commit `0ca7b91e <http://sourceforge.net/p/kaarpux/code/ci/0ca7b91eb44e87a9870a7925b816d1170a09b091/>`_)

- UPD: patch: v 2.7.5
  (Commit `8fa05955 <http://sourceforge.net/p/kaarpux/code/ci/8fa05955dcfc1369f11cd799365efb5a9a47024a/>`_)

- UPD: pciutils: v 3.3.1
  (Commit `46845964 <http://sourceforge.net/p/kaarpux/code/ci/468459644dd65d4b8b3635fa12f21496ee17800c/>`_)

- UPD: sqlite: v 3.8.10.2
  (Commit `c80f2804 <http://sourceforge.net/p/kaarpux/code/ci/c80f2804fddabdedec881ef6eed7eeca15125897/>`_)

- UPD: strace: v 4.10
  (Commit `8c3ff790 <http://sourceforge.net/p/kaarpux/code/ci/8c3ff79031d4f50a11c244b060f2b85ddf3fb8a4/>`_)

- UPD: tcllib: v 1_17
  (Commit `43dcad58 <http://sourceforge.net/p/kaarpux/code/ci/43dcad58c70e258fd011510d831fc1f64e4873ed/>`_)

- UPD: tzdata: v 2015d
  (Commit `e5fb8bc4 <http://sourceforge.net/p/kaarpux/code/ci/e5fb8bc498caf9a81cb4443e3b0c8c31ba5c8a46/>`_)

- UPD: sysstat: v 11.1.4
  (Commit `3ed226c9 <http://sourceforge.net/p/kaarpux/code/ci/3ed226c99f7ea0908f915212b8a76c0698c96040/>`_)

- UPD: util-linux: v 2.26.2
  (Commit `0a617342 <http://sourceforge.net/p/kaarpux/code/ci/0a617342cf1c281390a9fab86b3e7870b0e2af87/>`_)

- UPD: wget: v 1.16.3
  (Commit `8bda1e87 <http://sourceforge.net/p/kaarpux/code/ci/8bda1e87afc2f90a84991f82e4d760b271b07c25/>`_)

- UPD: which: v 2.21
  (Commit `92404a76 <http://sourceforge.net/p/kaarpux/code/ci/92404a76f68b2b11a92be6fb4ac0385e0a42d509/>`_)

- UPD: xz: v 5.2.1
  (Commit `3817b110 <http://sourceforge.net/p/kaarpux/code/ci/3817b110351d4a9e03bb20e4694dfa35aeb9b968/>`_)

- UPD: samba: v 4.2.2
  (Commit `a0b2d247 <http://sourceforge.net/p/kaarpux/code/ci/a0b2d247946a5ff9b2070717b4a6fcc20fde383d/>`_)

- UPD: gnupg: v 2.1.4
  (Commit `1eacb293 <http://sourceforge.net/p/kaarpux/code/ci/1eacb2938b2c62bc63086797b9d2dd297597d9f9/>`_)

- UPD: gpgme: v 1.5.5
  (Commit `11918ae3 <http://sourceforge.net/p/kaarpux/code/ci/11918ae37e91a1044bb111bba42b651df413c56a/>`_)

- UPD: ruby: v 2.2.2
  (Commit `0bd5dcda <http://sourceforge.net/p/kaarpux/code/ci/0bd5dcda219df6cefb53f714ea573f32711320fc/>`_)

- UPD: acpica: v 20150515
  (Commit `e33c2f79 <http://sourceforge.net/p/kaarpux/code/ci/e33c2f79846ea4c8e3989f1e31b9caff85616a5b/>`_)

- UPD: astroid: v 1.3.6
  (Commit `6ca5ce66 <http://sourceforge.net/p/kaarpux/code/ci/6ca5ce66e53cf9af3369fe1f67d451f5fcf47f7b/>`_)

- UPD: astroid: v 1.3.6
  (Commit `ed8d2b4d <http://sourceforge.net/p/kaarpux/code/ci/ed8d2b4dd962592d3a4311e4556efd2dcf0e9747/>`_)

- UPD: cliapp: v 1.20150305
  (Commit `85947102 <http://sourceforge.net/p/kaarpux/code/ci/8594710295b9b364ba8a4bd629ff6fee04ca5133/>`_)

- UPD: cmake: v 3.2.3
  (Commit `0be17464 <http://sourceforge.net/p/kaarpux/code/ci/0be17464e5f9b403e0955880efabecde3b7c3a8e/>`_)

- UPD: cmdtest: v 0.14
  (Commit `c2d0a994 <http://sourceforge.net/p/kaarpux/code/ci/c2d0a9948f8e1a62715ed25a6b06cab82db8ce43/>`_)

- UPD: cracklib: v 2.9.4
  (Commit `d77f666f <http://sourceforge.net/p/kaarpux/code/ci/d77f666f306b0e8edfe601c05346629eac0a5d50/>`_)

- UPD: device-mapper: v 2.02.120
  (Commit `a9a08bfb <http://sourceforge.net/p/kaarpux/code/ci/a9a08bfbf22081094b2d91a6c8eab0c5977c0a4b/>`_)

- UPD: dhcpcd: v 6.9.0
  (Commit `819e5397 <http://sourceforge.net/p/kaarpux/code/ci/819e539781b02107efdeeb6338436a974f45fcb1/>`_)

- UPD: doxygen: v 1.8.9.1
  (Commit `428bf892 <http://sourceforge.net/p/kaarpux/code/ci/428bf892008f8a95debc41583597f69d526e164d/>`_)

- UPD: ed: v 1.11
  (Commit `a258ee58 <http://sourceforge.net/p/kaarpux/code/ci/a258ee587563eb0b83a1a751d8e6e1e831ec7e3b/>`_)

- UPD: net-snmp: v 5.7.3
  (Commit `4c437c98 <http://sourceforge.net/p/kaarpux/code/ci/4c437c9824593e0e839559a9f1c36cc05d93fc44/>`_)

- UPD: fuse: v 2.9.4
  (Commit `4eaed799 <http://sourceforge.net/p/kaarpux/code/ci/4eaed79955f68a4938e0acee78991453d5c07cf8/>`_)

- UPD: git: v 2.4.3
  (Commit `a1569d7f <http://sourceforge.net/p/kaarpux/code/ci/a1569d7f9d09d6facfbd22790ff828aade56913f/>`_)

- UPD: gobject-introspection: v 1.44.0
  (Commit `8b11f606 <http://sourceforge.net/p/kaarpux/code/ci/8b11f606ca00a3a4dd1d7589bdad9e94ca162e2c/>`_)

- UPD: gphoto2: v 2.5.6
  (Commit `8147616b <http://sourceforge.net/p/kaarpux/code/ci/8147616bc47a16f917a1aca085b52cf116700c11/>`_)

- UPD: hdparm: v 9.45
  (Commit `91bc8493 <http://sourceforge.net/p/kaarpux/code/ci/91bc8493f6e41ff5f80408434ef0c1b5d80c804b/>`_)

- UPD: lcms2: v 2.7
  (Commit `fc48abad <http://sourceforge.net/p/kaarpux/code/ci/fc48abad06177ca66f5d398e3412a8910a0eab6d/>`_)

- UPD: libassuan: v 2.2.1
  (Commit `12150890 <http://sourceforge.net/p/kaarpux/code/ci/121508905b56ace3fce9bbdf573372a09c9bc41f/>`_)

- UPD: libdvdcss: v 1.3.99
  (Commit `8a7b85f9 <http://sourceforge.net/p/kaarpux/code/ci/8a7b85f9499d07f462196fb2b1b787641d33052f/>`_)

- UPD: libdvdnav: v 5.0.3
  (Commit `df21dda4 <http://sourceforge.net/p/kaarpux/code/ci/df21dda422269b7a7553ef2e55dc984424831cf6/>`_)

- UPD: libdvdread: v 5.0.3
  (Commit `821c38e5 <http://sourceforge.net/p/kaarpux/code/ci/821c38e58511d98a6b949f3763d3cf488a04a472/>`_)

- UPD: libgcrypt: v 1.6.3
  (Commit `b8ad4568 <http://sourceforge.net/p/kaarpux/code/ci/b8ad45687ab7c9157fd69e8b4bf1cc7107740653/>`_)

- UPD: libgd: v 2.1.1
  (Commit `a9c0509f <http://sourceforge.net/p/kaarpux/code/ci/a9c0509f9394840cbe4949ac9734013170a4898f/>`_)

- UPD: libgee: v 0.18.0
  (Commit `f3f17d12 <http://sourceforge.net/p/kaarpux/code/ci/f3f17d12030ca0445296275c14a1c0c528c4c9b3/>`_)

- UPD: libgpg-error: v 1.19
  (Commit `06f4fd9e <http://sourceforge.net/p/kaarpux/code/ci/06f4fd9e4626f573ac5ff394fcc2f18752e1b0d0/>`_)

- UPD: libgphoto2: v 2.5.7
  (Commit `4da8ba7d <http://sourceforge.net/p/kaarpux/code/ci/4da8ba7dbab43f87e17a36b963ac91fb9ed58eb7/>`_)

- UPD: libmicrohttpd: v 0.9.42
  (Commit `a91fbf6e <http://sourceforge.net/p/kaarpux/code/ci/a91fbf6e30edefc30ae773b857abb5c57475d52c/>`_)

- UPD: libmtp: v 1.1.9
  (Commit `35719740 <http://sourceforge.net/p/kaarpux/code/ci/357197406a0c01920087da92a8eb1e6aad83ba70/>`_)

- UPD: libquvi-scripts: v 0.9.20131130
  (Commit `0f1e3567 <http://sourceforge.net/p/kaarpux/code/ci/0f1e3567c95ab27fba5e4d1c97bdc85ef253ce9f/>`_)

- UPD: libquvi: v 0.9.4
  (Commit `7df5997b <http://sourceforge.net/p/kaarpux/code/ci/7df5997bed97aa1f1be1f250657dea08fe47e8f7/>`_)

- UPD: quvi: v 0.9.5
  (Commit `1ccf10e3 <http://sourceforge.net/p/kaarpux/code/ci/1ccf10e36e022d45df94da4d75f47d831a88b63d/>`_)

- UPD: libxml2: v 2.9.2
  (Commit `46ed33e0 <http://sourceforge.net/p/kaarpux/code/ci/46ed33e086c74627d6415d4f162ed640279e2866/>`_)

- UPD: llvm: v 3.6.1
  (Commit `cc99bea5 <http://sourceforge.net/p/kaarpux/code/ci/cc99bea51159d8ca385dd4d3999a1b78e3d1719c/>`_)

- UPD: logilab-common: v 0.63.2
  (Commit `b4a0cccb <http://sourceforge.net/p/kaarpux/code/ci/b4a0cccba73505579455063700e65bf0b00c0e85/>`_)

- UPD: lua: v 5.3.0
  (Commit `2a57fede <http://sourceforge.net/p/kaarpux/code/ci/2a57fede118c701c6722d526adfe93857308f311/>`_)

- UPD: lxc: v 1.1.2
  (Commit `9874b7ae <http://sourceforge.net/p/kaarpux/code/ci/9874b7ae0b3747b2032d79740df1a719c72f1aba/>`_)

- UPD: nasm:  v 2.11.08
  (Commit `941a34c0 <http://sourceforge.net/p/kaarpux/code/ci/941a34c082b4ac979df7a615e726c8b318fd4464/>`_)

- UPD: Pygments: v 2.0.2
  (Commit `89a006b1 <http://sourceforge.net/p/kaarpux/code/ci/89a006b1e7a5a08f7a6004037ec6b5e29cf69f98/>`_)

- UPD: p11-kit: v 0.23.1
  (Commit `8953eee7 <http://sourceforge.net/p/kaarpux/code/ci/8953eee720ef1a3c25bd6123c384d21c0e5ef370/>`_)

- UPD: poppler: v 0.33.0
  (Commit `edf24959 <http://sourceforge.net/p/kaarpux/code/ci/edf24959fbd8f2011c18c58c55a5a11795e21c85/>`_)

- UPD: pylint: v 1.4.3; and use pypi upstream
  (Commit `d1776397 <http://sourceforge.net/p/kaarpux/code/ci/d177639748a33d0d455b14fedaf12b4463fdc238/>`_)

- UPD: python-twisted: v 15.2.1
  (Commit `e0855e20 <http://sourceforge.net/p/kaarpux/code/ci/e0855e20206bcfc7bebb5df11aed01995d70aae4/>`_)

- UPD: qpdf: v 5.1.3
  (Commit `926f1981 <http://sourceforge.net/p/kaarpux/code/ci/926f1981f4069f1af3dae87f89ca854306253a11/>`_)

- UPD: Sphinx: v 1.3.1
  (Commit `2506abe1 <http://sourceforge.net/p/kaarpux/code/ci/2506abe1699702160889adf1e39edb7ba3083972/>`_)

- UPD: setuptools2 setuptools3: v 17.1.1
  (Commit `3769aeb2 <http://sourceforge.net/p/kaarpux/code/ci/3769aeb28f8d73419b9dbd26c8bf21c37c0eb943/>`_)

- UPD: sharutils: v 4.15.2
  (Commit `442bb3bc <http://sourceforge.net/p/kaarpux/code/ci/442bb3bcc201b52b4f9a05379ffd62ac608d8d4e/>`_)

- UPD: smartmontools: v 6.4
  (Commit `d08386af <http://sourceforge.net/p/kaarpux/code/ci/d08386af8b6337955378e553b383f427bcb773bd/>`_)

- UPD: vala: v 0.29.1
  (Commit `879cd726 <http://sourceforge.net/p/kaarpux/code/ci/879cd726bed699ad7a5fa0b6d3326e1bcede8bb2/>`_)

- UPD: wavpack: v 4.75.0; and use_gcc since it handles inline assembly better
  (Commit `ae81d73f <http://sourceforge.net/p/kaarpux/code/ci/ae81d73f29a975f998b6839fd16e0a9db65092e8/>`_)

- UPD: xerces-c: v 3.1.2
  (Commit `f0e8fd5a <http://sourceforge.net/p/kaarpux/code/ci/f0e8fd5a7b6ef7190288ddcf88b1e240a5560778/>`_)

- UPD: zope.interface: v 4.1.2
  (Commit `1213f451 <http://sourceforge.net/p/kaarpux/code/ci/1213f4510d3796b7911480688563594b5be946ab/>`_)

- UPD: alsa-lib: v 1.0.29
  (Commit `1e77a28d <http://sourceforge.net/p/kaarpux/code/ci/1e77a28ddafabccabc4120deb3d60ad428e5211d/>`_)

- UPD: at-spi2-core: v 2.16.0
  (Commit `0c5ce34e <http://sourceforge.net/p/kaarpux/code/ci/0c5ce34e05db55acfeec828e59488655f7e96afd/>`_)

- UPD: b43-fwcutter: v 019
  (Commit `8f8c4ee2 <http://sourceforge.net/p/kaarpux/code/ci/8f8c4ee2dd0eef6c2662a24b4a2c948ac1d891c0/>`_)

- UPD: cairo: v 1.14.2
  (Commit `2f331542 <http://sourceforge.net/p/kaarpux/code/ci/2f3315423457536440e7154657e7215c9e14f7a9/>`_)

- UPD: cups: v 2.0.3
  (Commit `fc5e532f <http://sourceforge.net/p/kaarpux/code/ci/fc5e532f1ad6eb8e604cde019045ee8ad8da173c/>`_)

- UPD: dejavu-fonts-ttf: v 2.35
  (Commit `fb6caf8e <http://sourceforge.net/p/kaarpux/code/ci/fb6caf8e9008c1704e875e641865f87484ecae6c/>`_)

- UPD: foomatic-db-engine: v 4.0.12
  (Commit `7327eba4 <http://sourceforge.net/p/kaarpux/code/ci/7327eba4c14bcbedad6beebed30e92948549e264/>`_)

- UPD: ghostscript: v 9.16
  (Commit `b80ef91a <http://sourceforge.net/p/kaarpux/code/ci/b80ef91a80eb6f19dbd5cf6751fee51042d77c71/>`_)

- UPD: hplip: v 3.15.6
  (Commit `7b237f6c <http://sourceforge.net/p/kaarpux/code/ci/7b237f6cadd3e90ecd866a0021a568468a4e427b/>`_)

- UPD: iso-codes: 3.58
  (Commit `715ce7f1 <http://sourceforge.net/p/kaarpux/code/ci/715ce7f1f500f399c6fb76c29cd9d9d77a32e432/>`_)

- UPD: json-glib: v 1.0.4
  (Commit `e9d58ca3 <http://sourceforge.net/p/kaarpux/code/ci/e9d58ca36eca60e0159d6f6830452a2c3375212f/>`_)

- UPD: libclc: v 4f09ca6d0de55ebf792858f50ffc65d9cc1c8613 => 2015-05-13
  (Commit `c8ced251 <http://sourceforge.net/p/kaarpux/code/ci/c8ced251370a3c2bd049d3884fccfbcf778a9a5b/>`_)

- UPD: libdc1394: v 2.2.3
  (Commit `762ca76c <http://sourceforge.net/p/kaarpux/code/ci/762ca76cb2b3372c8f52cb898a67e967c081f08a/>`_)

- UPD: libdrm: v 2.4.61
  (Commit `7075ef3a <http://sourceforge.net/p/kaarpux/code/ci/7075ef3afbd993b0dedfffcd20cefbefdd555718/>`_)

- UPD: libevdev: v 1.4.2
  (Commit `4cb6b5a9 <http://sourceforge.net/p/kaarpux/code/ci/4cb6b5a9106e5273da0aeafda21ea8be8970c0d7/>`_)

- UPD: libmusicbrainz: v 5.1.0
  (Commit `9a429f35 <http://sourceforge.net/p/kaarpux/code/ci/9a429f35c14d304afe592d172e354bb1d51823be/>`_)

- UPD: libraw1394: v 2.1.1
  (Commit `51953554 <http://sourceforge.net/p/kaarpux/code/ci/51953554d845d8ba81bbe9cf2b30ac18ba631c64/>`_)

- UPD: libsndfile: v d9bae19203ff6ea22f00072a4b887db0d6e15754
  (Commit `25f00d08 <http://sourceforge.net/p/kaarpux/code/ci/25f00d0875ece398adecdb731ec358e9d44f9511/>`_)

- UPD: libvorbis: v 1.3.5
  (Commit `0f77fde9 <http://sourceforge.net/p/kaarpux/code/ci/0f77fde970a29051cecc9f2275d425e54d7ac8d4/>`_)

- UPD: libxkbfile: v 1.0.9
  (Commit `cd782366 <http://sourceforge.net/p/kaarpux/code/ci/cd782366d41ef38c4eafbd3d9b4413d7a63c98e2/>`_)

- UPD: MesaLib: v 10.5.7
  (Commit `fd3c5a7f <http://sourceforge.net/p/kaarpux/code/ci/fd3c5a7ff90a0b6ba946ceaf2a6d80398195cefc/>`_)

- UPD: neon: v 0.30.1
  (Commit `dc5a9484 <http://sourceforge.net/p/kaarpux/code/ci/dc5a94842d0a7a345e8ef3d921efaa6c87816177/>`_)

- UPD: orc: v 0.4.23
  (Commit `3881670d <http://sourceforge.net/p/kaarpux/code/ci/3881670d753f274de32cd460494b70bc90e016a2/>`_)

- UPD: pyatspi pyatspi3: v 2.16.0
  (Commit `315690ca <http://sourceforge.net/p/kaarpux/code/ci/315690ca8bd3ba3cd4eb9242712dd9f28ac08cb0/>`_)

- UPD: pycups: v 1.9.72
  (Commit `74db4555 <http://sourceforge.net/p/kaarpux/code/ci/74db45554dbe163074214604545d50829482069d/>`_)

- UPD: pycurl: v 7.19.5.1
  (Commit `6e26df34 <http://sourceforge.net/p/kaarpux/code/ci/6e26df34323081f709e3307a0965342a462635e2/>`_)

- UPD: pygobject: v 3.16.1
  (Commit `9f941c19 <http://sourceforge.net/p/kaarpux/code/ci/9f941c193af659f08c69773c87b7c7236c2794f7/>`_)

- UPD: pyparsing: v 2.0.3
  (Commit `3238b05d <http://sourceforge.net/p/kaarpux/code/ci/3238b05dd19e0cd96001192f82438fafa2946be8/>`_)

- UPD: rdesktop: v 1.8.3
  (Commit `b53632e2 <http://sourceforge.net/p/kaarpux/code/ci/b53632e2aa82b6f0091e683def8868d5ad3086af/>`_)

- UPD: shared-mime-info: v 1.4
  (Commit `62ab2253 <http://sourceforge.net/p/kaarpux/code/ci/62ab22538c1047ebd19611e1fd10b790a367758c/>`_)

- UPD: x264: v 20141218-2245
  (Commit `310b5a97 <http://sourceforge.net/p/kaarpux/code/ci/310b5a9702e4118a2eadd667a174ff24935f2378/>`_)

- UPD: xf86-input-wacom: v 0.30.0
  (Commit `e5f83cda <http://sourceforge.net/p/kaarpux/code/ci/e5f83cda8e85cef9b71627d9c38440033dea86df/>`_)

- UPD: xf86-video-qxl: v 0.1.4
  (Commit `61e0bbca <http://sourceforge.net/p/kaarpux/code/ci/61e0bbcae5fd3d747d9a384e537012fe955c46bf/>`_)

- UPD: xkeyboard-config: v 2.15
  (Commit `3ba341ac <http://sourceforge.net/p/kaarpux/code/ci/3ba341ac025c653c3e21353c0cabaa4dff4094d3/>`_)

- UPD: xmodmap: v 1.0.9
  (Commit `e6dc8041 <http://sourceforge.net/p/kaarpux/code/ci/e6dc8041edc61a32f9da8a9e6876f900fe252c64/>`_)

- UPD: twm: v 1.0.9
  (Commit `f8fac410 <http://sourceforge.net/p/kaarpux/code/ci/f8fac41028f686f8c85f4349ae40b36f9ce1f8bd/>`_)

- UPD: xf86-input-evdev: v 2.9.2
  (Commit `9780f6f8 <http://sourceforge.net/p/kaarpux/code/ci/9780f6f8dc7d83a9acae58233a0c77d7be6d36d4/>`_)

- UPD: font-util: v 1.3.1
  (Commit `70d79261 <http://sourceforge.net/p/kaarpux/code/ci/70d79261d753f83bc679ed30ba4bcf6e4dbfe91a/>`_)

- UPD: libXdmcp: v 1.1.2
  (Commit `977ebae2 <http://sourceforge.net/p/kaarpux/code/ci/977ebae27dc98ae1f721066b2c04747bf6f4582d/>`_)

- UPD: libXt: v 1.1.5
  (Commit `6947a33d <http://sourceforge.net/p/kaarpux/code/ci/6947a33dfe0553a797cb99cac2d5336efcdb5d5b/>`_)

- UPD: libXrandr: v 1.5.0
  (Commit `389c5bfc <http://sourceforge.net/p/kaarpux/code/ci/389c5bfc88af6c8375cbbde72fa6996cebf0f5d2/>`_)

- UPD: libXvMC: v 1.0.9
  (Commit `2895016f <http://sourceforge.net/p/kaarpux/code/ci/2895016f4adeb4933384d71ee96712c9b9f7acfa/>`_)

- UPD: libXaw: v 1.0.13
  (Commit `c15c2835 <http://sourceforge.net/p/kaarpux/code/ci/c15c2835b7ab3a036a82b0686cbe383dfb390a6a/>`_)

- UPD: randrproto: v 1.5.0
  (Commit `317f6fda <http://sourceforge.net/p/kaarpux/code/ci/317f6fdad0cf4c01666a0bd6c013297ef4802def/>`_)

- UPD: xorg-utils1: packages updated to latest version
  (Commit `251233a9 <http://sourceforge.net/p/kaarpux/code/ci/251233a9dcc17c3d9f0c8036a14a07c1672c56a1/>`_)

- UPD: xdriinfo: v 1.0.5
  (Commit `5a1d8e46 <http://sourceforge.net/p/kaarpux/code/ci/5a1d8e46d33cd6350cd8149236141b748faf2a8d/>`_)

- UPD: xterm: v 318
  (Commit `5c07ca57 <http://sourceforge.net/p/kaarpux/code/ci/5c07ca575526c4640196ff54a86f9702043d068f/>`_)

- UPD: libical: v 1.0.1; and use upstream on github
  (Commit `20b048ef <http://sourceforge.net/p/kaarpux/code/ci/20b048ef652d08a86d13e69105e01913a5b67b70/>`_)

- UPD: gnome: 3.16.2
  (Commit `1a5adc59 <http://sourceforge.net/p/kaarpux/code/ci/1a5adc59b582b3182999dadad9e84a6a422cffd5/>`_)

- UPD: system-config-printer: v 1.5.7
  (Commit `fc424dbf <http://sourceforge.net/p/kaarpux/code/ci/fc424dbf2201081d19596aeb77068882a83e92ae/>`_)

- UPD: cabextract: v 1.6
  (Commit `9c1655ae <http://sourceforge.net/p/kaarpux/code/ci/9c1655ae175d5817d38832b77b2e33a7a7baaa8d/>`_)

- UPD: cups-filters: v 1.0.69
  (Commit `b676108c <http://sourceforge.net/p/kaarpux/code/ci/b676108c84812b09871434c101dc2f402cb824c9/>`_)

- UPD: foomatic-db: v 20150411
  (Commit `14eb6684 <http://sourceforge.net/p/kaarpux/code/ci/14eb66841019710c3e946001d3b850c5744241f3/>`_)

- UPD: gedit-plugins: v 3.16.0
  (Commit `3214c55e <http://sourceforge.net/p/kaarpux/code/ci/3214c55e417e95e052a59971fac03ff218b04977/>`_)

- UPD: nose: v 1.3.7
  (Commit `358e1e40 <http://sourceforge.net/p/kaarpux/code/ci/358e1e40c8c5b9a16161dae2abeabb541de5440b/>`_)

- UPD: pep8: v 1.6.2
  (Commit `5edceef4 <http://sourceforge.net/p/kaarpux/code/ci/5edceef49a312c326faa828141bdcf9a1eeb4fac/>`_)

- UPD: pinentry: v 0.9.4
  (Commit `acfb9985 <http://sourceforge.net/p/kaarpux/code/ci/acfb99852f2e8bd8e5d0e5820e311abe73cd12c1/>`_)

- UPD: openjdk: v 8u60-b20
  (Commit `e9564db1 <http://sourceforge.net/p/kaarpux/code/ci/e9564db12ec7f2038d3f076f4d1050d61dd22fe9/>`_)

- UPD: nss: v 3.19.2
  (Commit `6521050a <http://sourceforge.net/p/kaarpux/code/ci/6521050a7662e445eb1396d5ec9fdb435e44db15/>`_)

- UPD: thunderbird: v 38.0.1
  (Commit `d789b7f5 <http://sourceforge.net/p/kaarpux/code/ci/d789b7f524e28c1b1ef767e61cc5ed4c9111744a/>`_)

- UPD: firefox: v 38.0.6
  (Commit `07d622c2 <http://sourceforge.net/p/kaarpux/code/ci/07d622c228db67de9cbd0ff6f12cc7495fbc2d7a/>`_)

- UPD: wireshark: v 1.12.6
  (Commit `899e950b <http://sourceforge.net/p/kaarpux/code/ci/899e950bef42106d4cd3435f21d0353143bee81d/>`_)

- UPD: mercurial: v 3.4.1
  (Commit `b0fceb08 <http://sourceforge.net/p/kaarpux/code/ci/b0fceb082eaea9fd7ae19a1a34d8fbef8472aacc/>`_)

- UPD: babl: v 0.1.12
  (Commit `00663bb6 <http://sourceforge.net/p/kaarpux/code/ci/00663bb6254ab825fcdf1f9c5aac021ae338bd07/>`_)

- UPD: gnuplot: v 5.0.1
  (Commit `ee1bfe53 <http://sourceforge.net/p/kaarpux/code/ci/ee1bfe53a1ed395002726943496139b27e2f7797/>`_)

- UPD: hyphen: v 2.8.8
  (Commit `02490979 <http://sourceforge.net/p/kaarpux/code/ci/0249097974975e2a25b1e6008767daa2b263a4f4/>`_)

- UPD: junit: v 4.12
  (Commit `20499842 <http://sourceforge.net/p/kaarpux/code/ci/204998421c3762e2f8d03b55f78ff390933e2401/>`_)

- UPD: lua: 5.3.1
  (Commit `564434f1 <http://sourceforge.net/p/kaarpux/code/ci/564434f169f63c9a2a4afafb6a6d699171e458db/>`_)

- UPD: wxWidgets: v 3.0.2
  (Commit `6a851a87 <http://sourceforge.net/p/kaarpux/code/ci/6a851a87bfc51976df95deaa13a1831328b90466/>`_)

- UPD: flash_player_11: v 11.2.202.466
  (Commit `1176f765 <http://sourceforge.net/p/kaarpux/code/ci/1176f76514a0dbfe9504e83dc5a2e90d18173eb1/>`_)

- UPD: openssl: v 1.0.2c
  (Commit `acea46a2 <http://sourceforge.net/p/kaarpux/code/ci/acea46a20584dccadae70cd8c0681e7ff79f4759/>`_)

- UPD: gstreamer: v 1.5.1
  (Commit `415c1eea <http://sourceforge.net/p/kaarpux/code/ci/415c1eeae700cbb53519b3d58f1edf01f4c40e55/>`_)

- UPD: evince: v 3.16.1
  (Commit `2636b425 <http://sourceforge.net/p/kaarpux/code/ci/2636b42594233a0963dfe05cfea0e4f7cb87ec86/>`_)

- UPD: gedit: v 3.16.2
  (Commit `466939dc <http://sourceforge.net/p/kaarpux/code/ci/466939dc1ad06d0e64faf9afd5ff7c816c8687c4/>`_)

- UPD: gnome-calculator: v 3.16.2
  (Commit `70bd8349 <http://sourceforge.net/p/kaarpux/code/ci/70bd834967ac6459b78b9b296f62aa9ee7af967d/>`_)

- UPD: gnome-disk-utility: v 3.16.2
  (Commit `c548b920 <http://sourceforge.net/p/kaarpux/code/ci/c548b9201bb22e521679aeb4e9fd6b05dc76a5d9/>`_)

- UPD: gnome-online-accounts: v 3.16.3
  (Commit `f6eeca9d <http://sourceforge.net/p/kaarpux/code/ci/f6eeca9dcb260d279e24e500d3c3cdd79fd1a331/>`_)

- UPD: gnome-shell: v 3.16.2
  (Commit `53063a97 <http://sourceforge.net/p/kaarpux/code/ci/53063a9751ead23136a109be286e19d878726a72/>`_)

- UPD: mutter: v 3.16.2
  (Commit `8671cb83 <http://sourceforge.net/p/kaarpux/code/ci/8671cb830754307d86467dd5d1c8527627ea4aae/>`_)

- UPD: gtk+: v 3.16.4
  (Commit `c6f7df20 <http://sourceforge.net/p/kaarpux/code/ci/c6f7df204328bcdd0e67252979c1a6c0ac0ba465/>`_)

- UPD: gtk-doc: v 1.24
  (Commit `de7fb4b5 <http://sourceforge.net/p/kaarpux/code/ci/de7fb4b5f4240c65ea8ec4001538e4f7f6a4a346/>`_)

- UPD: git: v 2.4.4
  (Commit `8e5c06eb <http://sourceforge.net/p/kaarpux/code/ci/8e5c06ebd3f7bf96c138638a1cc0dd9d56d90e5a/>`_)

- UPD: gnupg: v 2.1.5
  (Commit `27da6322 <http://sourceforge.net/p/kaarpux/code/ci/27da6322fd7a442ba89f76c0583d507302b5f71e/>`_)

- UPD: harfbuzz: v 0.9.41
  (Commit `44fbff51 <http://sourceforge.net/p/kaarpux/code/ci/44fbff51a33d070bdfbff35a3bb211fe2e13c6e2/>`_)

- UPD: hicolor-icon-theme: v 0.15
  (Commit `63fe3c92 <http://sourceforge.net/p/kaarpux/code/ci/63fe3c9286b376743621e4302482ba1f31518745/>`_)

- UPD: inetutils: v 1.9.4
  (Commit `711b8b61 <http://sourceforge.net/p/kaarpux/code/ci/711b8b612624e37d687691b305f6ed37c4094777/>`_)

- UPD: kmod: v 21
  (Commit `dc62116e <http://sourceforge.net/p/kaarpux/code/ci/dc62116ef2ef6846da529847cd31a489394fceb9/>`_)

- UPD: libgusb: v 0.2.5
  (Commit `7d841503 <http://sourceforge.net/p/kaarpux/code/ci/7d84150370dc8dadce0d0fa189f4603d8b5e08a3/>`_)

- UPD: libjpeg-turbo: v 1.4.1
  (Commit `ed07fadb <http://sourceforge.net/p/kaarpux/code/ci/ed07fadb183965947d81079b3343f8c4b8b79ab9/>`_)

- UPD: libtirpc: v 0.3.2
  (Commit `86dcd76b <http://sourceforge.net/p/kaarpux/code/ci/86dcd76b43142e00e19f49a2223b8f520351d1d1/>`_)

- UPD: mcelog: v 120
  (Commit `8f3d06f4 <http://sourceforge.net/p/kaarpux/code/ci/8f3d06f4899c1f41d37123bff1909a418615e2be/>`_)

- UPD: libreoffice: v 4.4.3.2
  (Commit `63bb09d1 <http://sourceforge.net/p/kaarpux/code/ci/63bb09d1459b5b8985631f4aa77e853ba2118ca6/>`_)

- UPD: systemd: v 221
  (Commit `45dd9f16 <http://sourceforge.net/p/kaarpux/code/ci/45dd9f16656683b18962c8b9cd5f7b88e39a184b/>`_)

- UPD: jansson: v 2.7
  (Commit `07dd3b34 <http://sourceforge.net/p/kaarpux/code/ci/07dd3b3497ac59db6f78226cbec62ed38e9706b2/>`_)

- UPD: libbase58: v 0.1.4
  (Commit `1889911a <http://sourceforge.net/p/kaarpux/code/ci/1889911ac226b188446ec797f009efa88b9fa5cb/>`_)

- UPD: libblkmaker: v 0.5.0; and new upstream location
  (Commit `5536ead1 <http://sourceforge.net/p/kaarpux/code/ci/5536ead1376a088c7c2cf92d427fa9881bfe0fee/>`_)

- UPD: bitcoin: v 0.10.2
  (Commit `a81729aa <http://sourceforge.net/p/kaarpux/code/ci/a81729aa51eb5c04c4466c79cbf3af2f5f42dae0/>`_)

- UPD: litecoin: v 0.10.2.2
  (Commit `9d862344 <http://sourceforge.net/p/kaarpux/code/ci/9d8623440f6a35f336341df53d25ca9d66ab8c7e/>`_)

- UPD bfgminer: v 5.2.0
  (Commit `452f68fd <http://sourceforge.net/p/kaarpux/code/ci/452f68fd185e51e40e90537f7f6621e43b55c42d/>`_)

- UPD: cpuminer: v 2.4.2
  (Commit `425570e4 <http://sourceforge.net/p/kaarpux/code/ci/425570e4afd5c0fc06a625f2182463e3cce5b9c9/>`_)

- UPD: flash_player_11: v 11.2.202.468
  (Commit `ed726478 <http://sourceforge.net/p/kaarpux/code/ci/ed7264786b73bab58ca3ed95764fea53d184a906/>`_)

- UPD: linux: v 4.0.6
  (Commit `00240746 <http://sourceforge.net/p/kaarpux/code/ci/00240746f9bb615d1c8d39d271021bf439303c6f/>`_)

- UPD: openjdk: v 8u60-b21
  (Commit `a110492b <http://sourceforge.net/p/kaarpux/code/ci/a110492bbfbe8d431c8c888a6eede93fb4de08ff/>`_)

- UPD: gstreamer: v 1.5.2
  (Commit `7a181661 <http://sourceforge.net/p/kaarpux/code/ci/7a181661cc89852496c758c66379f740efc363d5/>`_)

- UPD: evolution-data-server: v 3.16.3
  (Commit `6636c0d8 <http://sourceforge.net/p/kaarpux/code/ci/6636c0d866d511ce743f39ea13fbb4a35fd44473/>`_)

- UPD: evolution: v 3.16.3
  (Commit `c7aae6fa <http://sourceforge.net/p/kaarpux/code/ci/c7aae6fac3337505c3e89dc5512fa804f502e1ab/>`_)

- UPD: sysstat: v 11.1.5
  (Commit `1e0806f9 <http://sourceforge.net/p/kaarpux/code/ci/1e0806f93bf57289bef6fa2a064b9ef4579f83c3/>`_)

- UPD: xorg-server: v 1.17.2
  (Commit `916bd61e <http://sourceforge.net/p/kaarpux/code/ci/916bd61e0059ef67bdcdcf3bd768714963809b21/>`_)

- UPD: curl: v 7.43.0
  (Commit `2cd3a6c3 <http://sourceforge.net/p/kaarpux/code/ci/2cd3a6c3765c14fc82a0b550b709878567a35085/>`_)


Minor Changes
#############

- IMPROVE: linux: add USB3 to config
  (Commit `e50f036e <http://sourceforge.net/p/kaarpux/code/ci/e50f036e85b01ef29830883c96ee3822ad4d658a/>`_)

- IMPROVE: kx_version: allow --phase= to select packages from given phase only
  (Commit `b9077b98 <http://sourceforge.net/p/kaarpux/code/ci/b9077b98d11e8fe071e706e846dd157d851d3823/>`_)

- IMPROVE: gpg_keys: add new keys
  (Commit `84caf9f6 <http://sourceforge.net/p/kaarpux/code/ci/84caf9f6e847f58747cdda90a48e14c1281adb58/>`_)

- IMPROVE: KxBuild: Better upstream version check for Python packages (pypi)
  (Commit `a18a73de <http://sourceforge.net/p/kaarpux/code/ci/a18a73de8c312569afa63f71a1d1add548eb5bdd/>`_)

- IMPROVE: gpg_keys: add new keys
  (Commit `6f492fdc <http://sourceforge.net/p/kaarpux/code/ci/6f492fdca8d6b7a656099843372cd9b0118bd2a0/>`_)

- IMPROVE: master: move ruby+samba later (after new samba dependencies)
  (Commit `052759cd <http://sourceforge.net/p/kaarpux/code/ci/052759cd9636311beca791e724ee1f0129facb28/>`_)

- IMPROVE: master: move libproxy earlier
  (Commit `82faf654 <http://sourceforge.net/p/kaarpux/code/ci/82faf654d1c080300d1b80ff67bf4b532b6310e3/>`_)

- MINOR: nettle: put on hold; GnuTLS does not work with nettle 3.*; only 2.7.1
  (Commit `1ff6939e <http://sourceforge.net/p/kaarpux/code/ci/1ff6939e692409ffef59d2565a059db8b3af4072/>`_)

- IMPROVE: KxBuild: ignore signatures from weak keys
  (Commit `50d42bea <http://sourceforge.net/p/kaarpux/code/ci/50d42bea33fec939ed2b7dad498b14e76a0796f7/>`_)

- IMPROVE: gpg_keys: add new keys
  (Commit `d5c33095 <http://sourceforge.net/p/kaarpux/code/ci/d5c33095d682d221fd2b65320bb63e2d8b78c204/>`_)

- MINOR: openjdk: remove unused patch
  (Commit `208573f0 <http://sourceforge.net/p/kaarpux/code/ci/208573f0419187c0ed93ef4669370b3c1998e879/>`_)

- IMPROVE: KxBuild: separate script to install PAM files
  (Commit `a64cbb79 <http://sourceforge.net/p/kaarpux/code/ci/a64cbb79ce3780297ec89693a2cd2f1eb17f624c/>`_)

- MINOR: dogecoin: temporarily disable dogecoin
  (Commit `c7ef1d48 <http://sourceforge.net/p/kaarpux/code/ci/c7ef1d489f785c03e0bf73c0ef31f13941b66287/>`_)

- DOC: KaarPux: updated CVE info
  (Commit `1c758442 <http://sourceforge.net/p/kaarpux/code/ci/1c758442b415805e3a69f3cd94c50bcb0315789a/>`_,
  `d986f4c3 <http://sourceforge.net/p/kaarpux/code/ci/d986f4c3b7dd70cf5700335a89b71736d472d883/>`_)
