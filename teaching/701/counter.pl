#!/usr/bin/perl -w

$file = $ARGV[0];  #'sample.counter';  # must be readable/writable by your webserver's user

open (FILE, "+>>" . $file) or die "cannot open $file for reading and appending: $!";
flock(FILE, 2) or die "cannot lock $file exclusively: $!";

seek FILE, 0, 0;

my @file_contents = <FILE>;

truncate FILE, 0;

my $counterVar;

 if ($file_contents[0] =~ /^(\d+)$/)
{
    $counterVar = $1;  # $1 is captured by the ()'s in the regular expression
}
 else
{
    $counterVar = 'COUNTER ERROR';  # the regular expression didn't match
}

$counterVar++;  # auto-increment the same variable with 1
                 # note: with this code, if counterVar is NOT an incrementable number, $counterVar will be set to 1.
                 # that's not necessarily a bad thing.

print FILE $counterVar;
close (FILE);

print STDOUT "Hits =  " . $counterVar . ".";


