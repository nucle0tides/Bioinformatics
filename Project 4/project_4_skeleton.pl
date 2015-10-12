#!/usr/bin/perl

# Your University ID: xxx-xxx-xxxx
# Your Name: XXX XXXXX

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
  # determine if $left and $right should be set if not read from input
  # determine the length of the region for primer design using $left and $right
  # format output for the current gene to primer3 according to the spec
  # print the output!
}

my $count = 0;
while (<>) {
  chomp;
  if (/^>/) {
    output_to_primer3 if $seq;
    # get the header line into three parts: name, left and right (latter two optional)
    # further split the name into fields; pick the gene name field only
    $seq = "";
    $count++
  } else {
    $seq .= $_;
  }
}
output_to_primer3 if $seq;
print STDERR "$count genes loaded for qPCR primer design\n";
