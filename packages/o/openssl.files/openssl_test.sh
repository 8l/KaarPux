# /bin/sh

set -o nounset
set -o errexit

echo "Generating certificate"
openssl req   -x509 -nodes -days 365 -subj '/C=DK/L=Copenhagen/CN=127.0.0.1' -newkey rsa:1024 -keyout mycert.pem -out mycert.pem

echo "Verifying certificate"
openssl verify mycert.pem

echo "Starting server"
openssl s_server -cert mycert.pem -www > openssl_s_server.txt 2>&1 &
PID=$!
sleep 1

trap 'kill -9 $PID' 0

echo "Testing server"
openssl s_time -time 2 -connect 127.0.0.1:4433 -www /
