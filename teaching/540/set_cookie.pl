#!/usr/bin/perl

### The modules we will use here.

use CGI qw(:standard :html3);
$q = new CGI;
my @values = $q->param("value");
my $my_cookie = $q->cookie(-name => "cook", -value => "first try", -path => "/");


foreach(@values)
{
    $string += $_;
}

print $q->header(-type => "text/html", -cookie => [$string]),
    $q->start_html(),
    "setting cookie values";


foreach(@values)
{
    print "<p>", $_;
}
print $q->end_html;



