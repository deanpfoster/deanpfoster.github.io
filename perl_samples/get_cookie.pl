#!/usr/bin/perl

### The modules we will use here.

use CGI qw(:standard :html3);
$q = new CGI;
my $values = $q->cookie("cook");

print $q->header(),
    $q->start_html(),
    "retrieved cookie values:<P>|",
    $values,
    "|",
    $q->end_html;



