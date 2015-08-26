#!/usr/bin/perl

use strict;
use warnings;

print $ENV{"LOGNAME"}, " executed $0 on ", scalar localtime, "\n";
