#!/bin/sh

set -e

# Keep track of closing files after writing
inotifywait --event close_write --format '%w' -m ${SQUID_CONF_FILE:-'/etc/squid/squid.conf'} |\
(
while read
do
    echo "Squid configuration was modify, reconfiguring squid..."
    # Reconfigure squid
    exec squid -k reconfigure
done
)