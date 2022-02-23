FROM centos:7

RUN yum -y update && \
    yum install --setopt=tsflags=nodocs -y git epel-release wget

RUN yum install --setopt=tsflags=nodocs -y \
    nginx \
    GeoIP autoconf automake gcc-c++ glib2-devel libcurl-devel libstdc++-devel libtool make \
    mariadb-devel \
    pcre-devel \
    unixODBC-devel \
    openldap-devel \
    postgresql-devel \
    php php-fpm php-common php-devel php-gd php-ldap php-mbstring php-mysql php-odbc php-pear php-snmp php-soap php-xml php-xmlrpc \
    libcap-devel libtool-ltdl-devel libxml2-devel \
    perl sudo \
    supervisor \
    inotify-tools

RUN yum clean all

# Compiling Squid
RUN mkdir -p /var/lib/squid && \
    useradd --user-group --home-dir /var/lib/squid --shell /sbin/nologin --comment 'Squid cache proxy' squid && \
    chown -R squid:squid /var/lib/squid && \
    mkdir -p /var/lib/ssl_db && chown -R squid:squid /var/lib/squid

RUN mkdir -p /opt/squid && \
    wget -c http://www.squid-cache.org/Versions/v5/squid-5.4.1.tar.gz -O - | tar -xz -C /opt/squid

WORKDIR /opt/squid/squid-5.4.1

RUN ./configure \
  --with-default-user=squid \
	--enable-dlmalloc \
	--enable-async-io \
	# --enable-icmp \
	--enable-delay-pools \
	--enable-snmp \
	--enable-linux-netfilter \
  --enable-arp-acl \
  --disable-inlined \
  --disable-optimizations \
  --disable-wccp \
  --disable-wccp2 \
  --disable-htcp \
  --disable-translation \
  --disable-auto-locale \
	--with-large-files \
	--enable-ssl-crtd \
	--with-openssl \
	--prefix=/usr \
  --with-logdir=/var/log/squid/ \
  --with-pidfile=/var/run/squid.pid \
	--includedir=/usr/include \
	--datadir=/usr/share \
	--bindir=/usr/sbin \
	--libexecdir=/usr/lib/squid \
	--localstatedir=/var \
	--sysconfdir=/etc/squid && \
	make && \
  make install

WORKDIR /

RUN rm -fr /opt/squid

# Compiling Sams2
COPY ./src/sams2/ /opt/sams2

# RUN git clone https://github.com/PavelVinogradov/sams2.git /opt/sams2

RUN mkdir -p /usr/local/share/sams2/data

WORKDIR /opt/sams2

RUN make -f Makefile.cvs && \
    sh ./configure && \
    make && \
    make install

WORKDIR /

RUN rm -fr /opt/sams2

COPY scripts/run-squid.sh /usr/local/bin/run-squid.sh
COPY scripts/squid_auto_reconf.sh /usr/local/bin/squid_auto_reconf.sh
COPY scripts/run-sams2daemon.sh /usr/local/bin/run-sams2daemon.sh
COPY conf/php.conf /etc/php-fpm.d/www.conf
COPY conf/nginx.conf /etc/nginx/nginx.conf
COPY conf/squid.conf /etc/squid/squid.conf
COPY conf/sams2.conf /usr/local/etc/sams2.conf
COPY conf/supervisord.conf /etc/supervisord.conf

RUN chmod +x /usr/local/bin/run-squid.sh
RUN chmod +x /usr/local/bin/squid_auto_reconf.sh
RUN chmod +x /usr/local/bin/run-sams2daemon.sh

EXPOSE 3128
EXPOSE 4128
EXPOSE 80

ENTRYPOINT ["/usr/bin/supervisord", "-c", "/etc/supervisord.conf"]