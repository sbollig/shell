#! /usr/bin/perl  
use strict; 
use warnings; 
use v5.10;

say "Please select the version of perlbrew from the list: ";
my @pb_list = `perlbrew list`;
my $num = 0;
for my $version ( values @pb_list ) {
    chomp $version;
    $num++;
    $version = $1 if $version =~ /^\s+(perl-.+)/;
    print "$num\. $version\n" if $version =~ /perl-/;
}
