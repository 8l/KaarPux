.. 
   KaarPux: http://kaarpux.kaarposoft.dk
   Copyright (C) 2015: Henrik Kaare Poulsen
   License: http://kaarpux.kaarposoft.dk/license.html

.. _changes_2_1_0:


================================
Changes in KaarPux version 2.1.0
================================


:program:`KaarPux` version ``2.1.0`` released on ``2012-08-30``

Security, Firefox 15, iptables, and more...


Security Updates
################

- UPD: nss: v 3.13.6
  (Commit `b3536216 <http://sourceforge.net/p/kaarpux/code/ci/b35362168c4e67e23d88ebb4b822e5635c277697/>`_)

- UPD: certdata: v 1.82.2.2
  (Commit `ca425468 <http://sourceforge.net/p/kaarpux/code/ci/ca42546884967a86385e0ea5356313de22755e1b/>`_)

- UPD: xulrunner firefox: v 15.0
  (Commit `463e1f4a <http://sourceforge.net/p/kaarpux/code/ci/463e1f4a32dce114364985bbb7eb67e854344c9e/>`_)

- UPD: thunderbird: v 15.0
  (Commit `797c9723 <http://sourceforge.net/p/kaarpux/code/ci/797c9723207d97204c7edd3de2681bf2b3fcb4c1/>`_)

- UPD: linux: v 3.5.2
  (Commit `b6950f4a <http://sourceforge.net/p/kaarpux/code/ci/b6950f4a3bd5b1e03a56f7fbd72b76d71a00644a/>`_,
  `eff6dd43 <http://sourceforge.net/p/kaarpux/code/ci/eff6dd4341756de49fa61a8e0047741691bc4b22/>`_,
  `def97df1 <http://sourceforge.net/p/kaarpux/code/ci/def97df1672fd24305fc8ed8440c02f369ab41f5/>`_)


iptables improvements
#####################

Add ulogd for logging iptables packets in userspace
===================================================

- ADD: ulogd \*: logging iptables packets in userspace
  (Commit `30042631 <http://sourceforge.net/p/kaarpux/code/ci/3004263146c1236e2ae994d1302626489f1624ad/>`_)

- FIX: build: move libpcap before ulogd
  (Commit `500f0e35 <http://sourceforge.net/p/kaarpux/code/ci/500f0e352610570a504c159d41c2c0e384cc1e83/>`_)

- FIX: iptables: mkdir '/etc/systemd/system/network.target.wants/'
  (Commit `aa0c5b0e <http://sourceforge.net/p/kaarpux/code/ci/aa0c5b0e3e3aceb34b558d57062bf5c1998f2d99/>`_)

Add ``ulogd`` and prerequisites:

- ``libnfnetlink``

- ``libmnl``

- ``libnetfilter_acct``

- ``libnetfilter_conntrack``

- ``libnetfilter_log``

Configure ``iptables`` to forward DROPped packets to ``ulogd``.

Configure ``ulogd`` to start at boot and dump the dropped packets
into :file:`/var/log/iptables_drop.pcap`
in ``pcap`` format.

Now we can analyze dropped packets using tcpdump, wireshark, or similar.


Add iptables connection tracking
================================

- IMPROVE: iptables: improved iptables configuration
  Commit `313a6249 <http://sourceforge.net/p/kaarpux/code/ci/313a6249b7bb1b5bcff4c36ba73d753d405df752/>`_

- IMPROVE: linux: config for netfilter connection tracking
  Commit `b6fddddf <http://sourceforge.net/p/kaarpux/code/ci/b6fddddf9a05d4f966c5841ed45136eb304ed006/>`_

- IMPROVE: iptables: default to remove all chains in all tables
  (Commit `c7641e05 <http://sourceforge.net/p/kaarpux/code/ci/c7641e05b2c578ee4459ea433e31f0c2b43b0eb6/>`_)

- MINOR: iptables: remove ftp RELATED, now that we have EXPECTED
  (Commit `2bf528c0 <http://sourceforge.net/p/kaarpux/code/ci/2bf528c055b6f8a25169563df7a6812d32fcbcb8/>`_)

- IMPROVE: iptables: handle NetBIOS NameService
  (Commit `1870536b <http://sourceforge.net/p/kaarpux/code/ci/1870536b7469bbeccdc740babe923f0641616d8d/>`_)

``iptables`` is deprecating automatic assignment of connection tracking helpers.
Instead, we now manually configure connection tracking by using the ``conntrack`` module.
See `Secure use of Connection Tracking Helpers <https://home.regit.org/netfilter-en/secure-use-of-helpers/>`_
for more information.

Configure the kernel for use of ``conntrack``.

Disable automatic assignment of connection tracking helpers and use
:command:`-m conntrack` instead of :command:`-m state`.

Manually assign helper for outgoing ``FTP`` and ``NetBIOS`` NameService.

Also correct ``DHCP`` rules to cover all interfaces,
silently drop ``FTP`` and ``NetBIOS`` (unless originated from us),
rate-limit incoming SSH connections,
rate-limit logging of dropped packets.


Other Changes
#############

- UPD: wireshark: v 1.8.2
  (Commit `651ed78c <http://sourceforge.net/p/kaarpux/code/ci/651ed78c86fcbc00e453ff1fa734ebd6c55ca5d3/>`_)

- UPD: NetworkManager: v 0.9.6.0
  (Commit `ea302ec0 <http://sourceforge.net/p/kaarpux/code/ci/ea302ec0f029896d50404ae65b08987e5219398d/>`_)

- IMPROVE: NetworkManager: --libexecdir=/usr/lib/NetworkManager
  (Commit `29f91935 <http://sourceforge.net/p/kaarpux/code/ci/29f919359e134e3044d352309342972289fd98d0/>`_)

- FIX: bluez: install conf files and systemd service
  (Commit `a3ddb364 <http://sourceforge.net/p/kaarpux/code/ci/a3ddb36447a71453760847a9b5af10ca564aac10/>`_)

- IMPROVE: certdata: documentation and version check
  (Commit `37172e53 <http://sourceforge.net/p/kaarpux/code/ci/37172e5368f72d753dfbe14836058eac6a98889c/>`_)

- IMPROVE: linux: make /run tmpfs 30% of available memory
  (Commit `28ea1fed <http://sourceforge.net/p/kaarpux/code/ci/28ea1feda3f329d037ad06ee93d6db5c7e50799f/>`_)

- MINOR: make_package_scripts: add possibility to disable automatic tests
  (Commit `58f75781 <http://sourceforge.net/p/kaarpux/code/ci/58f7578157a047e71f2e56e12af79d954fbd52f0/>`_)

- FIX: make_package_scripts: do not disable automatic tests by default
  (Commit `6bcf148f <http://sourceforge.net/p/kaarpux/code/ci/6bcf148f3587ef10510bd2a4bbe33bd15aab9b9b/>`_)

- MINOR: group: add kaarpux to 'adm' group
  (Commit `eaa8adca <http://sourceforge.net/p/kaarpux/code/ci/eaa8adcaea837d66a47c0a418fabbf41e99f3aad/>`_)

- IMPROVE: systemd: do not try to start services we do not want
  (Commit `735fb591 <http://sourceforge.net/p/kaarpux/code/ci/735fb591ed917e6532b4fbae695a4822dacfdb61/>`_)

- Several minor documentation updates.


Upgrade instructions
####################

The security fixes can be applied to a:program:`KaarPux` version ``2.0.0`` system
by re-installing the packages in this recommended sequence:

- ``linux``

- ``nss``

- ``certdata``

- ``xulrunner``

- ``firefox``

- ``thunderbird``

The remaining fixes can be applied to a:program:`KaarPux` version ``2.0.0`` system
by (re-)installing the packages in this recommended sequence:

- ``libnfnetlink``

- ``libmnl``

- ``libnetfilter_acct``

- ``libnetfilter_conntrack``

- ``libnetfilter_log``

- ``ulogd``

- ``iptables``

- ``systemd``

- ``bluez``

- ``NetworkManager``

- ``wireshark``


