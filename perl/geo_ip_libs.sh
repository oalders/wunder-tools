#!/bin/sh

# install/update GeoIP C and Perl libs 

sudo apt-get install zlib1g-dev

mkdir -p /tmp/$USER
rm -rf /tmp/$USER/GeoIP*
cd /tmp/$USER

wget http://geolite.maxmind.com/download/geoip/api/c/GeoIP.tar.gz
tar xzvf GeoIP.tar.gz
mv GeoIP-* GeoIP
cd GeoIP
./configure && make && make check && sudo make install

cpanm Geo::IP
cpanm Geo::IP::PurePerl
