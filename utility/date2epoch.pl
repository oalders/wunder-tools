#!/usr/bin/perl

use Modern::Perl;
use DateTime::Format::MySQL;

die "Usage: perl date2epoch YYYY-MM-DD" if !@ARGV;

my $dt = DateTime::Format::MySQL->parse_date( shift @ARGV );
$dt->set_time_zone('America/Toronto');
say $dt->epoch;
