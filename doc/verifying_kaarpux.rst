.. 
   KaarPux: http://kaarpux.kaarposoft.dk
   Copyright (C) 2015: Henrik Kaare Poulsen
   License: http://kaarpux.kaarposoft.dk/license.html

.. _verifying_kaarpux:


=================
Verifying KaarPux
=================


Verifying the Toolchain
#######################

To verify that the ``toolchain`` works::

	KX=/home/kaarpux/kaarpux
	cd ${KX}
	verify/kx_verify_toolchain.sh

The output should end with::

	OK [ make check ] completed successfully

if everything worked out.

``kx_verify_toolchain.sh`` simply verifies:

- That the ``autotools`` are not totally borked.

- That we can build a simple ``C`` library and executable - and execute it.

- That we can build a simple ``C++`` executable (linking to ``STL``) - and execute it.

- That the various ``binutils`` utilities are working on the files generated above.


Verifying the Comman-Line-Interface
###################################

To verify that the ``CLI`` (command-line-interface)
programs are working:
``KX=/home/kaarpux/kaarpux
cd ${KX}
verify/kx_verify_cli.sh``

The output should end with::

	OK: Test completed successfully

if everything worked out.

``kx_verify_cli.sh`` simply verifies,
that the ``CLI`` programs installed in :file:`/bin`
are not totally borked.

Please note, that only a few packages currently have ``kx_verify_cli.sh`` verifications defined.


Verifying GUI programs
######################

To verify that the ``GUI`` (Graphical User Interface)
programs are working::

	KX=/home/kaarpux/kaarpux
	cd ${KX}
	verify/kx_verify_gui.sh

The output should end with::

	OK: Test completed successfully

if everything worked out.

``kx_verify_gui.sh`` simply verifies,
that the installed ``GUI`` programs
can be launched and are not totally borked.

Please note, that only a few packages currently have``kx_verify_gui.sh`` verifications defined.


