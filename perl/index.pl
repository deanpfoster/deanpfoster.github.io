#!/usr/bin/perl

# This script (c) 1999 Philip Fibiger - pnf1@cornell.edu
# it can be freely distributed, as long as this comment
# remains intact
# version 1.2

use LWP::Simple;
use CGI qw/:standard/;
use strict;

# Read the main page of dilbert--find the link to the image and assign it to dilbert_img
# http://umweb2.unitedmedia.com/comics/dilbert/index.html
# http://www.comics.com/comics/dilbert/ab.html');

my $dilbert_mainpage = get('http://www.unitedmedia.com/comics/dilbert/index.html');
my $dilbert_img;
($dilbert_img) = ($dilbert_mainpage =~ m:/comics/dilbert/archive/images/(dilbert\d*\.gif):);
my $dilbert_magic_1 =  img({-src=>'http://www.comics.com/comics/dilbert/archive/images/'. $dilbert_img ,-align=>"right"});
my $dilbert_magic = "<a href = http://www.unitedmedia.com/comics/dilbert/>" . $dilbert_magic_1 . "</a>";

# dilbert_magic looks like: "<a href = http:...> http://www... </a>"

print header(-expire => "-1d");

open(HOME,"< /home/foster/public_html/index.html") || die "didn't open";

while(<HOME>)
{
    print if !m/statlist/ && !m/HTTP-EQUIV/;
    print $dilbert_magic if m/statlist/;
}
   end_html;


#   <IMG SRC="http://maps.weather.com/images/radar/single_site/phlloc_450x284.jpg" VSPACE=2 BORDER=0 ALT="Philadelphia, PA (19104) local radar">
#    img({-src=>'http://128.255.244.60/graphs/' . 'pres00_WTA.gif'}),
#    img({-src=>'http://maps.weather.com/images/maps/aviation/av10_720x486.jpg'}),

