#!/usr/bin/perl

use strict;
use warnings;



#initialize count and seq as 0 and an empty string 
my ($count, $seq, $left, $right) = ( 0, "", 0, 0);

my $line_width = 70;
# this subroutine prints $seq out, broken into $line_width pieces
sub print_seq {
  for (my $i=0; $i<length($seq); $i+=$line_width) {
  print substr($seq, $i, $line_width), "\n"; # output FASTA lines
 }
}

while (<>) {
  #if the line you're on is the header 
  if (/^>\w+ 0 0 0 (\d+) (\d+)/) {
    ($left, $right) = ($1, $2);
    if (length($seq)) { #length is 0 
      $seq = substr($seq, $left, $right - $left + 1); 
      #print "$seq\n"
      print_seq(); #does nothing on header
      #prints sequence of gene after second pass 
    }
    print; #prints header 

    #reset sequence sequence 
    $seq = "";

    #update count
    $count++; 
  } 

  #if line is not a header line
  else {
    #remove trailing newline character
    chomp;
    #add line of sequence 
    $seq = $seq . $_;
  }
}

$seq = substr($seq, $left, $right - $left + 1); 
#print "$seq\n"; 
print_seq();
print STDERR "there are $count input sequences\n";


