#!/usr/bin/perl

use strict;
use warnings;

while (<>) {
  if (/\/product="(.+)"/) {
    print "$1\n";
  }
}
