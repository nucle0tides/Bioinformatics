#!/usr/bin/perl

use strict;
use warnings;



#initialize count and seq as 0 and an empty string 
my ($count, $seq) = ( 0, "");

my $line_width = 70;
# this subroutine prints $seq out, broken into $line_width pieces
sub print_seq {
 for (my $i=0; $i<length($seq); $i+=$line_width) {
 print substr($seq, $i, $line_width), "\n"; # output FASTA lines
 }
}

while (<>) {
  if (/^>/) {
    if (length($seq)) {
      print_seq();
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
  }
}
print_seq();
print STDERR "there are $count input sequences\n";


