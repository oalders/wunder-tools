#!/bin/sh

# download and update GeoIP data
# this should be run before you install the Geo::IP libs

sudo mkdir -p /usr/share/GeoIP || exit
cd /usr/share/GeoIP || exit
sudo rm GeoLiteCity.dat.gz
sudo wget http://geolite.maxmind.com/download/geoip/database/GeoLiteCity.dat.gz
sudo gunzip GeoLiteCity.dat.gz

sudo wget http://geolite.maxmind.com/download/geoip/database/GeoLiteCountry/GeoIP.dat.gz
sudo rm GeoIP.dat
sudo gunzip GeoIP.dat.gz
