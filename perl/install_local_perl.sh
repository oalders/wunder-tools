#!/bin/sh

# Poached from:
# http://oylenshpeegul.vox.com/library/post/perl-5101.html
# http://jjnapiorkowski.vox.com/library/post/first-build-of-5101-and-locallib.html?_c=feed-atom

# after running this script, open ~/.profile on your Mac and add:
# export PATH=~/local/bin:$PATH
# to the last line of the file

# download
wget http://www.cpan.org/modules/by-authors/id/D/DA/DAPM/perl-5.10.1.tar.bz2
tar xjf perl-5.10.1.tar.bz2
cd perl-5.10.1

# configure and install
perl Configure -de -Dprefix=${HOME}/local -Dusethreads
make
make test
make install

# clean up after yourself
cd ..
rm -rf perl-5.10.1
rm perl-5.10.1.tar.bz2
