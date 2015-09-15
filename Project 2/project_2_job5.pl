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

my ($left, $right) = (0, 0); 
sub quality_seq { 
  if (/^>\w+ 0 0 0 (\d+) (\d+)/) { # match a header line?
 ($left, $right) = ($1, $2); # yes, save the coordinates
 print substr($seq, $left, $right), "\n"; 
}
}

while (<>) {
  if (/^>/) {
    if (length($seq)) {
      quality_seq();
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
    quality_seq();
  }
}

print STDERR "there are $count input sequences\n";


