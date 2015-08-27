#!/usr/bin/perl

use strict;
use warnings;

while (<>) {
  if (/\/organism="(.+)"/) {
    print lc"$1\n";
  }
}
