#! /usr/bin/perl  
use strict; 
use warnings; 
use v5.10;

say "Please select the version of perlbrew from the list: ";
my @pb_list = `perlbrew list`;
print "@pb_list\n"; 
