#!/bin/sh

# install/update GeoIP libs and data

cd /tmp
rm -rf /tmp/GeoIP*
wget http://geolite.maxmind.com/download/geoip/api/c/GeoIP.tar.gz
tar xzvf GeoIP.tar.gz
mv GeoIP-* GeoIP
cd GeoIP
./configure && make && make check && make install

mkdir -p /usr/share/GeoIP
cd /usr/share/GeoIP
rm GeoLiteCity.dat.gz
wget http://geolite.maxmind.com/download/geoip/database/GeoLiteCity.dat.gz
gunzip GeoLiteCity.dat.gz

cpan Geo::IP

