#!/bin/bash
set -euo pipefail
IFS=$'\n\t'

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"
CONFIG="${1:-$SCRIPT_DIR/config/without-authentication.conf}"

echo "starting squid with config ${CONFIG}"

CONFIG=$(realpath "${CONFIG}")

docker run --rm -d \
    -v "${CONFIG}:/etc/squid/squid.conf:ro" \
    -v "${SCRIPT_DIR}/config/passwd:/etc/squid/passwd:ro" \
    --name squid \
    -p 3128:3128 \
    sameersbn/squid:3.5.27-2

trap "docker rm -f squid" EXIT
docker exec -it squid tail -f /var/log/squid/access.log