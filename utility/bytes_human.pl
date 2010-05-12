#!/usr/bin/perl

=head1 SYNOPSIS

Convert arbitrary number of bytes into something that makes sense to a human

=cut

use strict;
use warnings;

use Number::Bytes::Human qw(format_bytes);

print "Number in bytes?\n";

my $bytes = <STDIN>;
chomp $bytes;

print format_bytes( $bytes ), "\n";

