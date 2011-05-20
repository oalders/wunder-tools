#!/bin/sh

# Poached from:
# http://oylenshpeegul.vox.com/library/post/perl-5101.html
# http://jjnapiorkowski.vox.com/library/post/first-build-of-5101-and-locallib.html?_c=feed-atom

# after running this script, open ~/.profile on your Mac and add:
# export PATH=~/local/bin:$PATH
# to the last line of the file

perl='perl-5.14.0'
perl_archive=$perl".tar.gz"

# download
cd /tmp
wget http://search.cpan.org/CPAN/authors/id/J/JE/JESSE/$perl_archive
tar xzf $perl_archive 
cd $perl 

# configure and install
perl Configure -de -Dinc_version_list=none -Dprefix=${HOME}/local -Dusethreads
make && make test && make install && cd .. && rm -rf $perl && rm $perl_archive
