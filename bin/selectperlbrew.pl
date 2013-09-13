#! /usr/bin/perl  
use strict; 
use warnings; 
use v5.10;
#se Regexp::Debugger;
say "Please select the version of perlbrew from the list: ";
my @pb_list = `perlbrew list`;
my $num = 0;
for my $version ( values @pb_list ) {
    chomp $version;
    $num++;
    $version = $1 if $version =~ /perl-(\d\.\d\d\.\d).?/;
    print "$num\. $version\n";
}
