.. 
   KaarPux: http://kaarpux.kaarposoft.dk
   Copyright (C) 2015: Henrik Kaare Poulsen
   License: http://kaarpux.kaarposoft.dk/license.html

.. _changes_3_2_2:


================================
Changes in KaarPux version 3.2.2
================================


:program:`KaarPux` version ``3.2.2`` released on ``2012-dec-01``


Packages updated
################

- UPD: pulseaudio: v 2.99.2
  (Commit `09bfc040 <http://sourceforge.net/p/kaarpux/code/ci/09bfc04030e2546e11928aa54d5ddb296f2830c1/>`_)

- UPD: thunderbird: v 17.0
  (Commit `8d724a4e <http://sourceforge.net/p/kaarpux/code/ci/8d724a4efa70abfdae0a4ae9e23b9ee5058a6264/>`_)

- UPD: provider_for_google_calendar: v 0.18
  (Commit `4881c742 <http://sourceforge.net/p/kaarpux/code/ci/4881c74279c3a1d39fea78b3ce1e08d082dd488e/>`_)

- UPD: xulrunner: v 17.0.1
  (Commit `9d9cc9e8 <http://sourceforge.net/p/kaarpux/code/ci/9d9cc9e8a924381b9ac733552f6d488cb052e5c0/>`_)

- UPD: firefox: v 17.0.1
  (Commit `61a5e105 <http://sourceforge.net/p/kaarpux/code/ci/61a5e105d1e8c577366aecdb3fd56cf03eb042f4/>`_)

- UPD: adblockplus: v 2.2.1
  (Commit `8814fc4f <http://sourceforge.net/p/kaarpux/code/ci/8814fc4f48ee5cd9ed708bfd5b6bcbf7a05ccb48/>`_)

- UPD: flash_player_11: v 11.2.202.251
  (Commit `dd2d9eb0 <http://sourceforge.net/p/kaarpux/code/ci/dd2d9eb02ff03c4aaf61f9f01689a67a449befec/>`_)

- UPD: icedtea-web: v 1.3.1
  (Commit `77ec6f85 <http://sourceforge.net/p/kaarpux/code/ci/77ec6f855d53cec22f4df7c1427d0912cf9da649/>`_)

- UPD: noscript: v 2.6.2
  (Commit `768eba35 <http://sourceforge.net/p/kaarpux/code/ci/768eba35f1318fab3e47746a5748a67732621692/>`_)


Bugs fixed
##########

- FIX: pulseaudio: install /etc/asound.conf to make ALSA use pulseaudio
  (Commit `df330235 <http://sourceforge.net/p/kaarpux/code/ci/df33023596f8ef79e29162e43507ef2232136ee8/>`_)

- FIX: pulseaudio alsa-plugins: move alsa-plugins after pulseaudio to get pulse plugin for alsa
  (Commit `9f8b104a <http://sourceforge.net/p/kaarpux/code/ci/9f8b104a54a621abe8a150fb4885875f1e7217c8/>`_)


Packages added
##############

- ADD: kx_ldd: Tool to recursively list ELF library dependencies
  (Commit `ecc789a7 <http://sourceforge.net/p/kaarpux/code/ci/ecc789a73149f5b3c6314f9b0ca9c6983fa51125/>`_)


Minor Changes
#############

- IMPROVE: libcanberra: do not build alsa, oss, gstreamer backends (we rely on pulseaudio)
  (Commit `32426f54 <http://sourceforge.net/p/kaarpux/code/ci/32426f54c0027b7e0ff4b1b4ef60c38068f85ae4/>`_)


