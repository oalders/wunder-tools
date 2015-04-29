#!/usr/bin/env perl

use strict;
use warnings;

use lib '../lib';

use ZoneFile;

ZoneFile->new_with_options->run;
