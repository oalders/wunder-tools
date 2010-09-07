#!/bin/sh

# Poached from:
# http://oylenshpeegul.vox.com/library/post/perl-5101.html
# http://jjnapiorkowski.vox.com/library/post/first-build-of-5101-and-locallib.html?_c=feed-atom

# after running this script, open ~/.profile on your Mac and add:
# export PATH=~/local/bin:$PATH
# to the last line of the file

perl='perl-5.12.2'
perl_archive=$perl".tar.gz"

# download
wget http://search.cpan.org/CPAN/authors/id/J/JE/JESSE/$perl_archive
tar xjf $perl_archive 
cd $perl 

# configure and install
perl Configure -de -Dprefix=${HOME}/local -Dusethreads
make && make test && make install && cd .. && rm -rf $perl && rm $perl_archive
