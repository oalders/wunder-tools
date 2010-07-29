#!/bin/sh

# install/update GeoIP C and Perl libs 

cd /tmp
rm -rf /tmp/GeoIP*
wget http://geolite.maxmind.com/download/geoip/api/c/GeoIP.tar.gz
tar xzvf GeoIP.tar.gz
mv GeoIP-* GeoIP
cd GeoIP
./configure && make && make check && make install

cpanm Geo::IP
cpanm Geo::IP::PurePerl
