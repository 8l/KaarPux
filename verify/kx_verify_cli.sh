#!/bin/sh
#
# KaarPux: http://kaarpux.kaarposoft.dk
#

set -o nounset
set -o errexit

#test $(id -u) -eq 0 || { echo "Script [$0] must be run as root"; exit 1; }
test $(id -u) -ne 0 || { echo "Script [$0] must NOT be run as root"; exit 1; }

cd $(dirname "$0")/verify_cli

if runtest --srcdir . --tool tests "$@"; then
echo ""
echo "OK: Test completed successfully"
else
RC=$?
echo ""
echo "*** Test FAILED ***"
exit $RC
fi
