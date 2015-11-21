# /bin/sh

set -o nounset
set -o errexit

echo "Testing orc"
DIR=$(mktemp -d)
cd $DIR

echo "Converting orc to c"
cat > example1orc.orc <<EOF
.function audio_add_s16
.dest 2 d1 short
.source 2 s1 short
.source 2 s2 short
addssw d1, s1, s2
EOF
/bin/orcc --implementation -o example1orc.c example1orc.orc
/bin/orcc --header         -o example1orc.h example1orc.orc

cat > example1.c <<EOF
#include <stdio.h>
#include "example1orc.h"
#define N 10
short a[N];
short b[N];
short c[N];
int
main (int argc, char *argv[])
{
  int i;
  for(i=0;i<N;i++){
    a[i] = 100*i;
    b[i] = 32000;
  }
  audio_add_s16 (c, a, b, N);
  for(i=0;i<N;i++){
    printf("%d: %d %d -> %d\n", i, a[i], b[i], c[i]);
  }
  return 0;
}
EOF

echo "Compiling"
OPTIONS=$(pkg-config --cflags --libs orc-0.4)
gcc -g -O2 $OPTIONS -o example1 example1orc.c example1.c

echo "Executing"
./example1 > out.txt

echo "Checking output"
cat > ref.txt <<EOF
0: 0 32000 -> 32000
1: 100 32000 -> 32100
2: 200 32000 -> 32200
3: 300 32000 -> 32300
4: 400 32000 -> 32400
5: 500 32000 -> 32500
6: 600 32000 -> 32600
7: 700 32000 -> 32700
8: 800 32000 -> 32767
9: 900 32000 -> 32767
EOF
diff ref.txt out.txt

cd
rm -rf $DIR
echo "Testing orc: OK"
