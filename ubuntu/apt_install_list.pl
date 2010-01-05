#!/usr/bin/perl

use strict;
use warnings;

=head1 SYNOPSIS

Creates 2 shell scripts in the directory the script is called from:

apt_install.sh
apt_install_one_line.sh

Both scripts list all pkgs currently installed on the machine, but the
second script attempts to install all the pkgs at once.

=cut

use Perl6::Junction qw( any );

`dpkg -l > installed.packages`;

my @pkgs = undef;
my @ignore = (
);

open(FILE, "installed.packages");
    LINE:
    while (<FILE>) {
        next LINE unless /^ii  /;

        my $line = $_;
        chomp $line;
        $line =~ s/^ii  //;
        $line =~ s/\s.*//g;

        next LINE if ( any( @ignore ) eq $line );

        push @pkgs, $line;
    }
close(FILE);

open (INSTALL, ">apt_install.sh");
    foreach my $pkg ( @pkgs ) {
        print INSTALL "apt-get -y install $pkg\n" if $pkg;
    }
close (INSTALL);

my $pkgs = join " ", @pkgs;
open (INSTALL, ">apt_install_one_line.sh");
    print INSTALL "apt-get -y install $pkgs\n" if $pkgs;
close (INSTALL);

print scalar @pkgs . " pkgs found\n";

rm installed.packages;

