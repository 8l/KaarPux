for F in *.rst; do

H="${F%%.rst}"

ed -s $F <<EOF
0a
.. 
   KaarPux: http://kaarpux.kaarposoft.dk
   Copyright (C) 2015: Henrik Kaare Poulsen
   License: http://kaarpux.kaarposoft.dk/license.html

.. _$H:
.
w
EOF

done

