#!/usr/bin/perl

use strict;
use warnings;

while (<>) {
  if (/\/organism="(.+)"/) {
    print "$1\n";
  }
}
