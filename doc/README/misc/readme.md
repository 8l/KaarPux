**KaarPux**
===========

**[KaarPux](http://kaarpux.kaarposoft.dk/)** is a complete Linux Distribution, where everything is build from upstream source code. 


**misc**
========

This directory contains *miscellaneous* files.


**kconfig-linux-XXX**
========

Extract of upstream linux kernel source needed for running Kconfig

Created with:

    wget http://www.kernel.org/pub/linux/kernel/v3.x/linux-3.18.9.tar.xz
    tar xf linux-3.18.9.tar.xz 
    mv linux-3.18.9 kconfig-linux-3.18.9
    tar czf kconfig-linux-3.18.9.tar.gz kconfig-linux-3.18.9/arch/x86/Makefile  kconfig-linux-3.18.9/Makefile kconfig-linux-3.18.9/Kbuild kconfig-linux-3.18.9/scripts/Kbuild.include kconfig-linux-3.18.9/scripts/Makefile* kconfig-linux-3.18.9/scripts/basic kconfig-linux-3.18.9/scripts/kconfig/


