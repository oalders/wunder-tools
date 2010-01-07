#!/bin/sh

# installs a local copy of the (hopefully) latest development
# version of Perl 5

# after running this script, you'll need to add the new Perl 
# directory to your PATH.  
#
# For example, if you've installed this on your MAC, 
# open ~/.profile on your Mac and add:
#
# export PATH=~/devperl/bin:$PATH
# to the last line of the file

# to use this version, you'll need to refer to Perl by its version
# number
# eg: 
# perl5.11.3 --version

perl='perl-5.11.3'
perl_archive=$perl".tar.bz2"

echo "downloading $perl_archive\n";

# download
wget http://search.cpan.org/CPAN/authors/id/J/JE/JESSE/$perl_archive
tar xjf $perl_archive
cd $perl

# configure and install
perl Configure -de -Dprefix=${HOME}/devperl -Dusethreads -Dusedevel
make
make test
make install

# clean up after yourself
cd ..
rm -rf $perl
rm $perl_archive
