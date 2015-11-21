.. 
   KaarPux: http://kaarpux.kaarposoft.dk
   Copyright (C) 2015: Henrik Kaare Poulsen
   License: http://kaarpux.kaarposoft.dk/license.html

.. _changes_4_9_2:


================================
Changes in KaarPux version 4.9.2
================================

:program:`KaarPux` version ``4.9.2`` released on ``2015-aug-09``

- Toolchain and other basic packages updated

- GNOME packages updated

- Linux 4.1.4

- Firefox 39.0.3

- Other packages updated


Toolchain and other basic packages updated
##########################################

- UPD: binutils: v 2.25.1
  (Commit `d242a461 <http://sourceforge.net/p/kaarpux/code/ci/d242a4610230c2efd3eda38f7624cc9aea529236/>`_)

- UPD: coreutils: v 8.24
  (Commit `860b212b <http://sourceforge.net/p/kaarpux/code/ci/860b212b5bad2e64b0af444610563454b8456fd1/>`_)

- UPD: elfutils: v 0.163
  (Commit `3fc396e2 <http://sourceforge.net/p/kaarpux/code/ci/3fc396e2b772f59f6063c6ed3bc9d4d01e82d8ab/>`_)

- UPD: man-pages: v 4.01
  (Commit `ff8b5ae7 <http://sourceforge.net/p/kaarpux/code/ci/ff8b5ae7411c310e06697ad7dd553e11038141ce/>`_)

- UPD: efivar: v 0.21
  (Commit `4d6b0697 <http://sourceforge.net/p/kaarpux/code/ci/4d6b06973f451aa901c0c71d97c68da7c2efb521/>`_)

- UPD: elfutils: v 0.163
  (Commit `1980be37 <http://sourceforge.net/p/kaarpux/code/ci/1980be377b7037918e56464aac4682e8d7c6f24a/>`_)

- UPD: dhcpcd: v 6.9.1
  (Commit `5b4aefb8 <http://sourceforge.net/p/kaarpux/code/ci/5b4aefb81e5748fb7f81b8bc3fa85f0a8dec6b86/>`_)

- UPD: iproute2: v 4.1.1
  (Commit `c2aa694f <http://sourceforge.net/p/kaarpux/code/ci/c2aa694f613d7b55f032feabf3f50922ac6090e3/>`_)

- UPD: glibc: v 2.22
  (Commit `bddb2382 <http://sourceforge.net/p/kaarpux/code/ci/bddb2382f9ac33d0fad2ddb258b0b53688eb62a2/>`_)

- UPD: libtirpc: v 0.3.2
  (Commit `5558020f <http://sourceforge.net/p/kaarpux/code/ci/5558020f191c36aeb6cfca3730691b0059982448/>`_)

- FIX: libtirpc: Restore some old API functions that were taken out
  (Commit `2efcdbf1 <http://sourceforge.net/p/kaarpux/code/ci/2efcdbf1bb55756f76d76c17e9d8e3d1e4c5c6eb/>`_)

- UPD: llvm: v 3.6.2
  (Commit `473b829d <http://sourceforge.net/p/kaarpux/code/ci/473b829d209bb0ce7f78cd57f5e52aa883424f87/>`_)

- UPD: gcc: v 5.2.0
  (Commit `e089939e <http://sourceforge.net/p/kaarpux/code/ci/e089939ec8b30960b68f6295669e07492e58e1fa/>`_)


GNOME packages updated
######################

- UPD: gtk+: v 3.16.6
  (Commit `a18f9d29 <http://sourceforge.net/p/kaarpux/code/ci/a18f9d29902e51a9432ec7839188031dff17261d/>`_)

- UPD: epiphany: v 3.16.3
  (Commit `d07b2160 <http://sourceforge.net/p/kaarpux/code/ci/d07b2160afcf2752088aa453a97a4382b29a3604/>`_)

- UPD: evolution-data-server v 3.16.4
  (Commit `a32742f5 <http://sourceforge.net/p/kaarpux/code/ci/a32742f5983080f43b1fd4c6063fc127b10b4e66/>`_)

- UPD: evolution: v 3.16.4
  (Commit `06abbff8 <http://sourceforge.net/p/kaarpux/code/ci/06abbff8280854a0dd7cd7b5a7a1c3b325e8159f/>`_)

- UPD: file-roller: v 3.16.3
  (Commit `bf25b7e8 <http://sourceforge.net/p/kaarpux/code/ci/bf25b7e8a362bd86c1aa5aefed82a66e8b8e126c/>`_)

- UPD: gdm: v 3.16.2
  (Commit `a86e81ce <http://sourceforge.net/p/kaarpux/code/ci/a86e81cee32ac5a5a60881227d095443db0ab579/>`_)

- UPD: gnome-control-center: v 3.16.3
  (Commit `82f5e30e <http://sourceforge.net/p/kaarpux/code/ci/82f5e30e3eff141302c588e6ad5ddb72bc23332e/>`_)

- UPD: gnome-settings-daemon: v 3.16.3
  (Commit `47ac1022 <http://sourceforge.net/p/kaarpux/code/ci/47ac10223bc0bf5dad6538681cb0664f046ffcb0/>`_)

- UPD: gnome-shell: v 3.16.3
  (Commit `692a20f8 <http://sourceforge.net/p/kaarpux/code/ci/692a20f80172b60f27001a5142f9dba699141c5a/>`_)

- UPD: gnome-shell-extensions: v 3.16.2
  (Commit `61b8c40c <http://sourceforge.net/p/kaarpux/code/ci/61b8c40c6faf7a382e0cb8f3277006d399932c2f/>`_)

- UPD: mutter: v 3.16.3
  (Commit `17d30b70 <http://sourceforge.net/p/kaarpux/code/ci/17d30b70b3a87d6263fbd7bab5b71b30ca8eb734/>`_)

- UPD: totem: v 3.16.2
  (Commit `1984b88a <http://sourceforge.net/p/kaarpux/code/ci/1984b88a6544dea538f242b4a0eccd0fdd9c2a51/>`_)

- UPD: zenity: v 3.16.3
  (Commit `f2fb57a0 <http://sourceforge.net/p/kaarpux/code/ci/f2fb57a0fe8c9f631709e9745444541db203c777/>`_)

- UPD: NetworkManager: v 1.0.4
  (Commit `1e31228f <http://sourceforge.net/p/kaarpux/code/ci/1e31228ffa8d86c16150c2e9c6de15ed94323be7/>`_)

- UPD: network-manager-applet: v 1.0.4
  (Commit `de40266c <http://sourceforge.net/p/kaarpux/code/ci/de40266c32adab75378f6120bbc37083445301e0/>`_)

- UPD: WebKit2: v 2.8.4
  (Commit `f69a067c <http://sourceforge.net/p/kaarpux/code/ci/f69a067cd13d00110c3397226ee31deb5bcc6a15/>`_)


Linux 4.1.4
###########

- UPD: linux: v 4.1.4
  (Commit `16f3025b <http://sourceforge.net/p/kaarpux/code/ci/16f3025bc2d28fba6f8a8a2e6fd23aa9eac3f68d/>`_)

- UPD: linux-firmware: v 20150715
  (Commit `2ef90c56 <http://sourceforge.net/p/kaarpux/code/ci/2ef90c56c46a8c7c5eb1044ccc440edbfaefbdd2/>`_)


Firefox 39.0.3
##############

- UPD: firefox: v 39.0.3
  (Commit `46d1b878 <http://sourceforge.net/p/kaarpux/code/ci/46d1b87855b0929862f91efd1570cf1bd546cb07/>`_)

- UPD: privacybadgerfirefox: v 1.0.0
  (Commit `f2f5489b <http://sourceforge.net/p/kaarpux/code/ci/f2f5489b1c133a5de201af425783fbe0c1217b66/>`_,
  `73706b76 <http://sourceforge.net/p/kaarpux/code/ci/73706b7611f2177704df2970cc64bc8e361dd0eb/>`_)

- FIX: privacybadgerfirefox: use correct .xpi filename for unzip on install
  (Commit `97291930 <http://sourceforge.net/p/kaarpux/code/ci/972919307416f33d35d78439c3eee9431f165051/>`_)


Other packages updated
######################

- UPD: libpng: v 1.6.18
  (Commit `2c9b8d84 <http://sourceforge.net/p/kaarpux/code/ci/2c9b8d8438017adecd43ce9b2e4b1ec4d2da0b68/>`_)

- UPD: libtiff: v 4.0.4
  (Commit `ca12f530 <http://sourceforge.net/p/kaarpux/code/ci/ca12f530c5cf5c151c3bff4f0524450152ddc75d/>`_)

- UPD: lzip: v 1.17
  (Commit `813073cb <http://sourceforge.net/p/kaarpux/code/ci/813073cb4531598ddca6768fe2b7cbec1b4b6e04/>`_)

- UPD: MesaLib: v 10.6.3
  (Commit `2d6aa535 <http://sourceforge.net/p/kaarpux/code/ci/2d6aa5351988447d99dc7e0e68d94119ef5f691c/>`_)

- IMPROVE: MesaLib: better configure options
  (Commit `86362858 <http://sourceforge.net/p/kaarpux/code/ci/863628583825d50f53c89a8631ac92ee7c01eb20/>`_)

- FIX: mesa-demos: disable egl, as it uses deprecated and removed MesaLib EGL features
  (Commit `9befa5b3 <http://sourceforge.net/p/kaarpux/code/ci/9befa5b362e71e3988e06fce5bde192488ce6c61/>`_)

- UPD: clutter-gst3: v 3.0.8
  (Commit `b3e444f0 <http://sourceforge.net/p/kaarpux/code/ci/b3e444f0216c585d93f991a29a9bd40f5f9df9d5/>`_)

- UPD: poppler: v 0.34.0
  (Commit `57b5dcf6 <http://sourceforge.net/p/kaarpux/code/ci/57b5dcf6c0cddabdf909f266cb0593b255a983df/>`_)

- FIX: cups-filters: patch to work against poppler 0.34.0
  (Commit `c654f066 <http://sourceforge.net/p/kaarpux/code/ci/c654f066bcf448c7cb7f0d5400613308b1018728/>`_)

- UPD: spice-protocol: v 0.12.9
  (Commit `875f0c8e <http://sourceforge.net/p/kaarpux/code/ci/875f0c8ef5a46fecba2bd97774002758edac012b/>`_)

- UPD: spice-gtk: v 0.29
  (Commit `1e7c8a1b <http://sourceforge.net/p/kaarpux/code/ci/1e7c8a1bb4ef63657e8f38f017b57cbd698160e4/>`_)

- UPD: openjdk: v 8u60-b24
  (Commit `56f177eb <http://sourceforge.net/p/kaarpux/code/ci/56f177ebaf98f0e126cb8ede86738a972da20310/>`_)


Documentation Changes
#####################

- DOC: KaarPux: updated CVE info
  (Commit `683cdee6 <http://sourceforge.net/p/kaarpux/code/ci/683cdee6ef85673a31c21636b8c73d2d9b6f2f86/>`_)
