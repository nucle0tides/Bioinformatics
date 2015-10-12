#!/usr/bin/perl

use strict;
use warnings;

my ($count, $seq) = ( 0, "");
while (<>) {
  if (/^>/) {
    if (length($seq)) {
      print "$seq\n";
    }
    print;
    $count++;
    $seq = "";
  } else {
    chomp;
    $seq = $seq . $_;
  }
}
print STDERR "there are $count input sequences\n";
