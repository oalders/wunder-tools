#!/usr/bin/perl

=head1 SYNOPSIS

Convert arbitrary number of bytes into something that makes sense to a human

=cut

use Modern::Perl;
use Number::Bytes::Human qw(format_bytes);

my $bytes = shift @ARGV;

if ( !$bytes ) {
    say "Number in bytes?";

    my $bytes = <STDIN>;
    chomp $bytes;
}

say format_bytes( $bytes );

