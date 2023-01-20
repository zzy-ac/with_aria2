#!/bin/bash
cd /root/.aria2

./tracker.sh

chown -R ${PUID}:${PGID} /opt/alist/

umask ${UMASK}

exec su-exec ${PUID}:${PGID} nohup aria2c --enable-rpc --rpc-allow-origin-all > /dev/null 2>&1 &

exec su-exec ${PUID}:${PGID} /opt/alist/alist server --no-prefix&bore local 6800 --to bore.pub