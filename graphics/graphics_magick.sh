#!/bin/sh

cd /tmp
wget http://downloads.sourceforge.net/project/graphicsmagick/graphicsmagick/1.3.9/GraphicsMagick-1.3.9.tar.gz?use_mirror=voxel
gunzip GraphicsMagick-1.3.9.tar.gz
tar xvf GraphicsMagick-1.3.9.tar
cd GraphicsMagick-1.3.9/
./configure --with-perl=yes --prefix=/usr
make
make install
cd PerlMagick/
perl Makefile.PL
make
make test
make install
