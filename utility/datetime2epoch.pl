#!/usr/bin/perl

use Modern::Perl;
use DateTime::Format::MySQL;

die "Usage: perl datetime2epoch YYYY-MM-DD HH:MM:SS" if scalar @ARGV != 2;

my $dt = DateTime::Format::MySQL->parse_datetime( join " ", @ARGV );
$dt->set_time_zone('America/Toronto');
say $dt->epoch;
