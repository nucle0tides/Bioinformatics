#!/usr/bin/perl

use strict;
use warnings;

while (<>) {
  if (/\/product="(.+)"/) {
    print lc"$1\n";
  }
}
