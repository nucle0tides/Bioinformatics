#!/usr/bin/perl

# Your University ID: xxx-xxx-xxxx
# Your Name: XXX XXXXX

use strict;
use warnings;
use Getopt::Long;

my $usage = << 'USAGE';
Usage: $0 [-left|right|product] primer3_output.txt
  -left: extract left primers only
  -right: extract right primers only
  -product: extract amplicon sequences only
Only one option should be given; if no option is given, output both primers
USAGE

my ($output_left_primers, $output_right_primers, $output_products) = ( 0, 0, 0 );

# read in optional command line parameters
die $usage unless GetOptions("left" => \$output_left_primers, "right" => \$output_right_primers,
			     "product" => \$output_products); # last one is optional!
die $usage unless @ARGV>0;

# if amplicon output is implemented, you need to change the conditions here
# to encompass the condition that $output_products is also being set
unless ($output_left_primers || $output_right_primers) {
  $output_left_primers = $output_right_primers = 1;
}

my ($gene, $seq, $count, $selected) = ("", "", 0, 0);
my @left_primers;
my @right_primers;

# the following three are needed only when amplicon output is implemented
my @left_coords;
my @right_coords;
my @amplicons;

while (<>) {
  chomp;
  if (/^SEQUENCE_ID=(\S+)/) {
    # remember gene name and clear all storages for the new gene
  } elsif (/^SEQUENCE_TEMPLATE=(\w+)$/) {
    # save sequence (only needed if amplicon output is implemented)
  } elsif (/^PRIMER_PAIR_NUM_RETURNED=(\d+)$/) {
    # save $selected primer pairs for looping condition below
  } elsif (/^PRIMER_LEFT_(\d+)_SEQUENCE=(\w+)$/) {
    # save left primer
  } elsif (/^PRIMER_RIGHT_(\d+)_SEQUENCE=(\w+)$/) {
    # save right primer
  } elsif (/^PRIMER_LEFT_(\d+)=(\d+),(\d+)$/) {
    # save left coordinate of left primer (only needed if amplicon output is implemented)
  } elsif (/^PRIMER_RIGHT_(\d+)=(\d+),(\d+)$/) {
    # save right coordinate or right primer (only needed if amplicon output is implemented)
  } elsif (/^PRIMER_PAIR_(\d+)_PRODUCT_SIZE=(\d+)$/) {
    # take out amplicon from sequence (only needed if amplicon output is implemented)
  } elsif (/^=$/) { # time to output all primer pairs for this gene
    for (my $i=0; $i<$selected; $i++) {
      if ($output_left_primers) {
	# output the left primers
      }
      if ($output_right_primers) {
	# output the right primers
      }
      if ($output_products) {
	# output the amplicon sequences if implemented
      }
    }
  }
}
print STDERR "$count target genes read\n";
