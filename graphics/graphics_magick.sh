#!/bin/sh

sudo apt-get install libjpeg62 libjpeg62-dev libpng12-0 libpng12-dev

mkdir -p /tmp/$USER
cd /tmp/$USER

wget http://downloads.sourceforge.net/project/graphicsmagick/graphicsmagick/1.3.12/GraphicsMagick-1.3.12.tar.gz?use_mirror=voxel -O GraphicsMagick-1.3.12.tar.gz
tar xzf GraphicsMagick-1.3.12.tar.gz
cd GraphicsMagick-1.3.12/
./configure --prefix=/usr --enable-shared
make
sudo make install
cd PerlMagick/
perl Makefile.PL PREFIX=~/perl5
make
make test
make install
