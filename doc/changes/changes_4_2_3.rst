.. 
   KaarPux: http://kaarpux.kaarposoft.dk
   Copyright (C) 2015: Henrik Kaare Poulsen
   License: http://kaarpux.kaarposoft.dk/license.html

.. _changes_4_2_3:


================================
Changes in KaarPux version 4.2.3
================================


:program:`KaarPux` version ``4.2.3`` released on ``2014-apr-09``

- openssl version 1.0.1g: Fixes CVE-2014-0160 (heartbleed)

- Other packages updated

- Build improvements


Packages updated
################

- UPD: openssl: v 1.0.1g; CVE-2014-0160 heartbleed
  (Commit `1bd6cbfd <http://sourceforge.net/p/kaarpux/code/ci/1bd6cbfd357f248c24bd213c4d7a9540c07eb1bc/>`_)

- UPD: flash_player_11: v 11.2.202.350
  (Commit `20576224 <http://sourceforge.net/p/kaarpux/code/ci/2057622444089a1ea8211b08ef69b75f17a7997b/>`_)

- UPD: gnutls: v 3.2.13
  (Commit `67e04ac2 <http://sourceforge.net/p/kaarpux/code/ci/67e04ac25049eafc0f37875b18b4acfa73facebe/>`_)

- UPD: icedtea-web: v 1.5
  (Commit `c1609a43 <http://sourceforge.net/p/kaarpux/code/ci/c1609a43b5c06a16c44026765e48a4152447e5fb/>`_)

- UPD: yaml: v 0.1.6
  (Commit `94339b5b <http://sourceforge.net/p/kaarpux/code/ci/94339b5b174b28e122ed229fb0a71e8da9f2813f/>`_)

- UPD: WebKit: v 2.4.0
  (Commit `2f4c80a9 <http://sourceforge.net/p/kaarpux/code/ci/2f4c80a95eb81baf425da92041e29b3921aaf3f7/>`_)

- UPD: linux: v 3.13.9
  (Commit `0303e6fa <http://sourceforge.net/p/kaarpux/code/ci/0303e6fa38a7a97a7c01ce2998d3d9d464f228c9/>`_)


Bugs fixed
##########

- FIX: KxBuild: remove stray <tab> from master.yaml
  (Commit `cf89597b <http://sourceforge.net/p/kaarpux/code/ci/cf89597bec535f4c129aa8b8692a30b60628f0ab/>`_)


Build improvements
##################

- FIX: KxTools: kx_flist to skip over dependencies introduced by ldconfig
  (Commit `50c97626 <http://sourceforge.net/p/kaarpux/code/ci/50c97626f423f28cad57693eb95b9764fd6bc6b0/>`_)

- IMPROVE: KxTools: kx_flist to process package build times
  (Commit `192a40dd <http://sourceforge.net/p/kaarpux/code/ci/192a40ddf8eea8ff062c162525fe85bf439afe14/>`_)

- IMPROVE: KxTools: kx_dpendencies --parallel improved to not consider ldd dependencies
  (Commit `5db8537c <http://sourceforge.net/p/kaarpux/code/ci/5db8537c34f21481d1ac1c16993d1b35c369f971/>`_)

- IMPROVE: KxBuild: cleaner bootstrap phase
  (Commit `ffd9eb52 <http://sourceforge.net/p/kaarpux/code/ci/ffd9eb528d3a89d49170f6a97bf234735b6cd5f2/>`_)

- IMPROVE: KxBuild: Better parallelism in linux_base
  (Commit `b0d1a416 <http://sourceforge.net/p/kaarpux/code/ci/b0d1a4164506bda2225eea393012828cc569e1c9/>`_)

- FIX: KxBuild: iana-etc is now in linux phase
  (Commit `baaaa00e <http://sourceforge.net/p/kaarpux/code/ci/baaaa00e875c87b4b289895a1e39817a2eb6fcf0/>`_)

- IMPROVE: KxBuild: Better parallelism in opt_desktop
  (Commit `bce9c59f <http://sourceforge.net/p/kaarpux/code/ci/bce9c59fbab42a06ddef357af5112e961f83b9b6/>`_)

- IMPROVE: KxBuild: Better parallelism in opt_coins
  (Commit `8000024c <http://sourceforge.net/p/kaarpux/code/ci/8000024ce1f5d671b1391bebfaf251d395f685e8/>`_)

- FIX: KxBuild: only run kx_opt after all parallel packages or a standalone package
  (Commit `4aa32bec <http://sourceforge.net/p/kaarpux/code/ci/4aa32bec97ee57536d4bc1e005814f9f0cbceb30/>`_)

- DOC: www: updated build durations
  (Commit `bd875b86 <http://sourceforge.net/p/kaarpux/code/ci/bd875b86aff5959f31b413f6d8b7faae046b4fb9/>`_)


Documentation Changes
#####################

- DOC: www: correct title on index page
  (Commit `0fa960a9 <http://sourceforge.net/p/kaarpux/code/ci/0fa960a973edd7d07bf99ef8cc9898e7240b4458/>`_)

- DOC: KaarPux: updated CVE info
  (Commit `854da365 <http://sourceforge.net/p/kaarpux/code/ci/854da365d5082a516a49d651f847c81126b110af/>`_)


