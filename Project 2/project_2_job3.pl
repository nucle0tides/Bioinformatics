#!/usr/bin/perl

use strict;
use warnings;

#initialize count and seq as 0 and an empty string 
my ($count, $seq) = ( 0, "");
while (<>) {
  if (/^>/) {
    if (length($seq)) {
      print "$seq\n";
    }
    print;
    #reset sequence sequence 
    $seq = "";
    #update count
    $count++;
    
  } 

  else {
    #remove trailing newline character
    chomp;
    $seq = $seq . $_;
    print"$seq\n"
  }
}
print STDERR "there are $count input sequences\n";
