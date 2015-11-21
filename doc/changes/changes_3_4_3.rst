.. 
   KaarPux: http://kaarpux.kaarposoft.dk
   Copyright (C) 2015: Henrik Kaare Poulsen
   License: http://kaarpux.kaarposoft.dk/license.html

.. _changes_3_4_3:


================================
Changes in KaarPux version 3.4.3
================================


:program:`KaarPux` version ``3.4.3`` released on ``2013-jan-16``

- Java security update

- Python updates

- Bugs fixed, dhcpcd updated, and other minor changes


Java security update
####################

- UPD: icedtea: v 2.3.4
  (Commit `7148d6b0 <http://sourceforge.net/p/kaarpux/code/ci/7148d6b0ff2f291ad5d33d9c6bae644497d7746a/>`_)
  Fixes `CVE-2012-3174 <www.cve.mitre.org/cgi-bin/cvename.cgi?name=2012-3174>`_ and `CVE-2013-0422 <www.cve.mitre.org/cgi-bin/cvename.cgi?name=2012-0422>`_.
  See `GNU/Andrew’s Blog: IcedTea 2.1.4, 2.2.4 & 2.3.4 Released! <http://blog.fuseyism.com/index.php/2013/01/15/security-icedtea-2-1-4-2-2-4-2-3-4-released/>`_


Bugs fixed
##########

- FIX: KxBuild: kx_opt: first create directories, THEN links
  (Commit `83da82fa <http://sourceforge.net/p/kaarpux/code/ci/83da82fad0af6c759eb88e0236171285f4a783e3/>`_)

- FIX: parted: move after device-mapper
  (Commit `401ca20e <http://sourceforge.net/p/kaarpux/code/ci/401ca20e148c7e91c2e15b42108648df97049f0d/>`_)


Python updates
##############

- UPD: Python: v 3.3.0
  (Commit `8d60045e <http://sourceforge.net/p/kaarpux/code/ci/8d60045e13150852ee1f19ed0dad971137b79b5d/>`_)

- REMOVE: pygobject2 pygtk
  (Commit `afdf0e97 <http://sourceforge.net/p/kaarpux/code/ci/afdf0e977c257c84df09615f02b8aff00fe39891/>`_)

- IMPROVE: gimp: remove python support (todo: add python3 when gimp is ready)
  (Commit `718568f2 <http://sourceforge.net/p/kaarpux/code/ci/718568f2dc1ff82112d72ee4eac78437fc44c19e/>`_)

- IMPROVE: KxBuild: tag 'python3' for packages
  (Commit `33c38e9a <http://sourceforge.net/p/kaarpux/code/ci/33c38e9a130328eafdd1441be499a1785cb07c93/>`_)

- IMPROVE: gnome-tweak-tool: use the new 'python3' tag
  (Commit `11540966 <http://sourceforge.net/p/kaarpux/code/ci/11540966d90d690bf26f2dbc3887d169b9d8a284/>`_)

- IMPROVE: gedit glade: use python3
  (Commit `3655af2e <http://sourceforge.net/p/kaarpux/code/ci/3655af2e52b334bb36b45a94d034eb833c49bc9d/>`_)

- IMPROVE: dbus-python: use python3
  (Commit `cd337f88 <http://sourceforge.net/p/kaarpux/code/ci/cd337f88da75d8383a123ac4c1162eb9f61aa015/>`_)

- IMPROVE: libpeas: use python3
  (Commit `f3e1342a <http://sourceforge.net/p/kaarpux/code/ci/f3e1342a1a72a94ee219e42977cb9dfe368b1d5a/>`_)


Packages updated
################

- UPD: dhcpcd: v 5.6.6
  (Commit `d8ec7c40 <http://sourceforge.net/p/kaarpux/code/ci/d8ec7c405fbf0f4508723440c5d8ba4e947ce006/>`_)


Minor Changes
#############

- IMPROVE: KxBuild: allow longer time before waiting for install lock times out
  (Commit `35c362c8 <http://sourceforge.net/p/kaarpux/code/ci/35c362c80bd52c38bbfca1b0e50b862cb70039ac/>`_)

- IMPROVE: cups-filters: make install re-entrant
  (Commit `457af0fa <http://sourceforge.net/p/kaarpux/code/ci/457af0facbfd16bbcd7562c24970c6fc5b535187/>`_)


