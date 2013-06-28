#! /usr/bin/perl  
use strict; 
use warnings;
use v5.10; 
use Cwd;
my $pwd = cwd();
say $pwd;
$pwd =~ s|/home/sbollig|~|;
say $pwd;
my $prompt = 'sbollig@bobodrop:~/perl/perl3/lessons/lesson01$';
say "My prompt before: $prompt";
$prompt =~ s|/perl/perl3|/../p3|;
say "My prompt after: $prompt";
