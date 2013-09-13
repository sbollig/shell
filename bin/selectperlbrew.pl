#! /usr/bin/perl  
use strict; 
use warnings; 
use v5.10;

say "Please select the version of perlbrew from the list: ";
my @pb_list = `perlbrew list`;
#rint "@pb_list\n"; 
for my $version ( values @pb_list ) {
    print $version if $version =~ /perl-/;
}
