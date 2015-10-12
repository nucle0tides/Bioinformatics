#!/usr/bin/perl

# Your University ID: 802547746
# Your Name: Gabby Ortman

use strict;
use warnings;

# print the global settings strings copied from primer3_input.txt
# print << END;
# P3_FILE_FLAG=0
# ...
# PRIMER_FIRST_BASE_INDEX=0
# END

my ($gene, $left, $right, $seq) = ( "", 0, 0, "");

sub output_to_primer3 {
  print $gene; 
  print $seq;
  if !define($left); 
      $left = 0; 
      $right = length($seq); 

  my $len = $right - $left; 
  print; 
  print; 
  # determine if $left and $right should be set if not read from input
  # determine the length of the region for primer design using $left and $right
  # format output for the current gene to primer3 according to the spec
  # print the output!
}

my @parts; 
my @fields; 
my $count = 0;
while (<>) {
  chomp;
  if (/^>/) {
    output_to_primer3 if $seq;
    @parts = split(""); 
    $left = $parts[1]; 
    $right = $parts[2]; 

    @fields = split(\|\,$parts[0]); 
    # get the header line into three parts: name, left and right (latter two optional)
    # further split the name into fields; pick the gene name field only
    $seq = "";
    chomp; 
    $count++
  } 
  else {
    $seq .= $_;
  }
}
output_to_primer3 if $seq;
print STDERR "$count genes loaded for qPCR primer design\n";
