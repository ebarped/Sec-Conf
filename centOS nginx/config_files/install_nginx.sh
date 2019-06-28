#!/bin/bash
yum install wget gcc make automake autoconf libtool pcre pcre-devel libxml2 libxml2-devel curl curl-devel httpd-devel openssl-devel zlib-devel git -y
wget http://nginx.org/download/nginx-1.17.1.tar.gz
wget https://www.modsecurity.org/tarball/2.9.3/modsecurity-2.9.3.tar.gz
tar xvzf nginx-1.17.1.tar.gz
tar xvzf modsecurity-2.9.3.tar.gz
cd modsecurity-2.9.3
./configure --enable-standalone-module
make
cd ..
cd nginx-1.17.1
./configure \
--user=nginx \
--group=nginx \
--sbin-path=/usr/sbin/nginx \
--conf-path=/etc/nginx/nginx.conf \
--pid-path=/var/run/nginx.pid \
--lock-path=/var/run/nginx.lock \
--error-log-path=/var/log/nginx/error.log \
--http-log-path=/var/log/nginx/access.log \
--add-module=../modsecurity-2.9.3/nginx/modsecurity \
--with-http_ssl_module --with-http_v2_module --with-http_stub_status_module
make
make install > /dev/null
cd ..
mkdir /etc/nginx/modsec
cp /modsecurity-2.9.3/unicode.mapping /etc/nginx/modsec/unicode.mapping
cd /etc/nginx/modsec
git clone https://github.com/SpiderLabs/owasp-modsecurity-crs.git
mv owasp-modsecurity-crs/crs-setup.conf.example /etc/nginx/modsec/owasp-modsecurity-crs/crs-setup.conf
cd /
rm -rf nginx-1.17.1.tar.gz
rm -rf nginx-1.17.1
rm -rf modsecurity-2.9.3.tar.gz
rm -rf modsecurity-2.9.3

