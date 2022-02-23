#!/bin/sh

set -e
[[ $DEBUG == true ]] && set -x

prepare_folders() {
	echo "Preparing folders..."
	mkdir -p /etc/squid-cert/  && chown -R squid:squid /etc/squid-cert/
	mkdir -p /var/cache/squid/  && chown -R squid:squid /var/cache/squid/
	mkdir -p /var/log/squid/  && chown -R squid:squid /var/log/squid/
}

initialize_cache() {
	echo "Creating cache folder..."
	squid -z
	sleep 5
}

create_cert() {
	if [ ! -f /etc/squid-cert/private.pem ]; then
		echo "Creating certificate..."
		openssl req -new -newkey rsa:2048 -sha256 -days 3650 -nodes -x509 \
			-extensions v3_ca -keyout /etc/squid-cert/private.pem \
			-out /etc/squid-cert/private.pem \
			-subj "/CN=$CN/O=$O/OU=$OU/C=$C" -utf8 -nameopt multiline,utf8

		openssl x509 -in /etc/squid-cert/private.pem \
			-outform DER -out /etc/squid-cert/CA.der

		openssl x509 -inform DER -in /etc/squid-cert/CA.der \
			-out /etc/squid-cert/CA.pem
	else
		echo "Certificate found..."
	fi
}

clear_certs_db() {
	echo "Clearing generated certificate db..."
	rm -rfv /var/lib/ssl_db/
  # security_file_certgen=$(find /usr -type f -name security_file_certgen)
  # $security_file_certgen -c -s /var/lib/ssl_db -M 4MB
	# chown -R squid:squid /var/lib/ssl_db
}

run() {
	echo "Prepare squid..."
	prepare_folders
	create_cert
	clear_certs_db
	initialize_cache
  # Start squid
  /usr/sbin/squid -NYCd 1 -f /etc/squid/squid.conf
}

run
