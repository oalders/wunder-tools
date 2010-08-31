#!/bin/sh

cd /tmp
wget http://downloads.sourceforge.net/project/graphicsmagick/graphicsmagick/1.3.12/GraphicsMagick-1.3.12.tar.gz?use_mirror=voxel
gunzip GraphicsMagick-1.3.12.tar.gz
tar xzf GraphicsMagick-1.3.12.tar
cd GraphicsMagick-1.3.12/
./configure --prefix=/usr --enable-shared
make
make install
cd PerlMagick/
perl Makefile.PL
make
make test
make install
