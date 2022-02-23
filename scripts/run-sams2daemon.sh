#!/bin/sh

set -e
[[ $DEBUG == true ]] && set -x

# Environment variable:
# CN  - Common name of the certificate
# O   - Organization of the certificate ownerOrganization of the certificate owner
# OU  - Organization unit of the certificate ownerOrganization unit of the certificate owner
# C   - Two letter code of the country
# DB_SERVER
# DB_NAME
# DB_USER
# DB_PASSWORD

SAMS2_OPTIONS=(
  "DB_ENGINE:${DB_ENGINE:-"MySQL"}" # PostgreSQL, unixODBC
  "DB_SERVER:${DB_SERVER:-'localhost'}"
  "SAMS_DB:${DB_NAME:-'sams2db'}"
  "DB_USER:${DB_USER:-'sams2'}"
  "DB_PASSWORD:${DB_PASSWORD:-'sams2'}"
)

setting_sams_conf() {
  echo "Configure sams.conf..."
  for option in "${SAMS2_OPTIONS[@]}" ; do
      option_KEY=${option%%:*}
      option_VALUE=${option#*:}
      sed -i --regexp-extended s/^${option_KEY}=.+$/${option_KEY}=${option_VALUE}/g ${SAMS2_CONF:-'/usr/local/etc/sams2.conf'}
  done
}

run() (
  setting_sams_conf
  # Start sams2daemon
  /usr/local/bin/sams2daemon --no-fork --verbose --debug=3 --logger=console --config=/usr/local/etc/sams2.conf
)

run
