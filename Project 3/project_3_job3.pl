#!/usr/bin/perl

use strict;
use warnings;

my %table; 
while (<>) {
  if (/\/product="(.+)"/) {
    $table{lc $1}++;
  }
}

print STDERR scalar keys %table, " unique items found\n"; 

# my $count=0;
# for (values %table) {
#  $count += $_;
# }

# print STDERR "$count total items seen.\n";

for my $key (keys %table)
{ 
    print "$key\t $table{$key} times\n"
}