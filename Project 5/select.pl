#!/usr/bin/perl

use strict;
use warnings;
use Getopt::Long;

my $usage = "Usage: select.pl -names 'list of sequence names in quotes' file1 file2 ...";

# read in command line parameters
my $names;
die $usage unless GetOptions("names=s" => \$names);
die $usage unless $names;
die $usage unless @ARGV;

my $flag = 0;
while (<>) {
  if (/^>(\w+)/) {
    if (index($names, $1)>=0) {
      $flag = 1;
      print;
    } else {
      $flag = 0;
    }
  } elsif ($flag) {
    print;
  }
}
