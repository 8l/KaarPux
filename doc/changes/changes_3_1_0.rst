.. 
   KaarPux: http://kaarpux.kaarposoft.dk
   Copyright (C) 2015: Henrik Kaare Poulsen
   License: http://kaarpux.kaarposoft.dk/license.html

.. _changes_3_1_0:


================================
Changes in KaarPux version 3.1.0
================================

:program:`KaarPux` version ``3.1.0`` released on ``2012-sep-26``

Bugs fixed, packages updated, packages added, and more.


Bugs Fixed
##########

- FIX: /etc/profile: install with execute permission
  (Commit `34752782 <http://sourceforge.net/p/kaarpux/code/ci/3475278205a4face9fdff5096ff5e71438720aed/>`_)

- FIX: kx_ver_wiz.pl: use List::Util and Time::Hires (just as kx_version.pl)
  (Commit `af9ab0fd <http://sourceforge.net/p/kaarpux/code/ci/af9ab0fd1c2bcd1d472b7524e6fbff1047b63561/>`_)

- FIX: KxBuild: move py2cairo before pygobject
  (Commit `7b052bfd <http://sourceforge.net/p/kaarpux/code/ci/7b052bfddb6d6de7e93702075cb72eb21e6f2d5b/>`_)

- FIX: gdm: aboslute path for ExecStart in .service file
  (Commit `7de77a3b <http://sourceforge.net/p/kaarpux/code/ci/7de77a3b3412303c31d7e3796c1be6aa27a3c0c5/>`_)

- FIX: bash: do not set PS1 prompt for non-interactive shells
  (Commit `d7b18ec5 <http://sourceforge.net/p/kaarpux/code/ci/d7b18ec5704c19f1b8ec2c31a5848a0faba41859/>`_)


Packages Updated
################

- UPD: valgrind: v 3.8.0
  (Commit `5c7c585c <http://sourceforge.net/p/kaarpux/code/ci/5c7c585cef5304808da2da0d505f324fbd71cdb6/>`_)

- UPD: graphite2 libexttextcat libvisio libwps mdds mythes raptor2 rasqal SampleICC
  (Commit `2a05ac52 <http://sourceforge.net/p/kaarpux/code/ci/2a05ac521ecf106fd979fee9a76313f06c1c0f5a/>`_)

- UPD: libreoffice: v 3.6.2.1
  (Commit `0efba2bf <http://sourceforge.net/p/kaarpux/code/ci/0efba2bf2de0b8ea0232a55cdc8b7042bb0b788b/>`_)

- UPD: thunderbird: v 15.0.1
  (Commit `2f410f2d <http://sourceforge.net/p/kaarpux/code/ci/2f410f2d62e87150bc0d37d677895e0722be121d/>`_)

- UPD: ghostery: v 2.8.3
  (Commit `618a9dc2 <http://sourceforge.net/p/kaarpux/code/ci/618a9dc29445db754796ddf1965f48b1edf4adb8/>`_)

- UPD: noscript: v 2.5.6
  (Commit `0c6e41a5 <http://sourceforge.net/p/kaarpux/code/ci/0c6e41a552a068747f3378b117dc94d7c539061a/>`_)


Packages Added
##############

- ADD: ntp: Network Time Protocol
  (Commit `0c8b2066 <http://sourceforge.net/p/kaarpux/code/ci/0c8b206658f08fa420bb89bca6dfd34e8ba04086/>`_,
  `190273d3 <http://sourceforge.net/p/kaarpux/code/ci/190273d3794eaa305c9bf3382fb581feb8cc7d1b/>`_,
  `889fe26a <http://sourceforge.net/p/kaarpux/code/ci/889fe26a16cd92433f9455da02b9b41b2168079b/>`_)

- ADD: pm-utils
  (Commit `e87cf32c <http://sourceforge.net/p/kaarpux/code/ci/e87cf32cf799fbdfc558e032b9957d63e7607290/>`_)

- ADD: bash-completion: use Debian bash-completion; do not roll our own
  (Commit `6a071486 <http://sourceforge.net/p/kaarpux/code/ci/6a071486dbe8794c86a101984797bd276d2f4ab3/>`_,
  `1956bb31 <http://sourceforge.net/p/kaarpux/code/ci/1956bb31d4de712200a35141b722e3b8d6fc6618/>`_)

- ADD: pygobject33 pycairo: GObject for Python3
  (Commit `ed553285 <http://sourceforge.net/p/kaarpux/code/ci/ed553285a2060d6261445896652b66dd81440696/>`_)

- ADD: hunspell-en_US cppunit libcmis clucene libcdr lpsolve: prerequisites for LibreOffice
  (Commit `66e349be <http://sourceforge.net/p/kaarpux/code/ci/66e349be0257ca1c81575c5638c261c059033013/>`_)

- ADD: hunspell-en_US.yaml
  (Commit `9e98655f <http://sourceforge.net/p/kaarpux/code/ci/9e98655fbc3030d327d9436238c98b2a2998e032/>`_)


Other Changes
#############

- Improved version checks

- Documentation updates

- Many other minor improvements
