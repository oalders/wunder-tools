#!/bin/sh

# download and update GeoIP data
# this should be run before you install the Geo::IP libs

mkdir -p /usr/share/GeoIP
cd /usr/share/GeoIP
rm GeoLiteCity.dat.gz
wget http://geolite.maxmind.com/download/geoip/database/GeoLiteCity.dat.gz
gunzip GeoLiteCity.dat.gz

wget http://geolite.maxmind.com/download/geoip/database/GeoLiteCountry/GeoIP.dat.gz
rm GeoIP.dat
gunzip GeoIP.dat.gz
rm GeoIP.dat.gz

