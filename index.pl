#!/usr/bin/perl

use LWP::Simple;
use CGI qw/:standard/;
use strict;

###########################################################################################
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
# #                                                                                       #
# #             D I L B E R T   code                                                      #
# #                                                                                       #
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
###########################################################################################

my $dilbert_mainpage = get('http://www.dilbert.com/fast/');
my $dilbert_img_0000;
($dilbert_img_0000) = ($dilbert_mainpage =~ m:(0000.*\.gif):);

my $dilbert_magic_1 =  img({-src=>'http://dilbert.com/dyn/str_strip/'. $dilbert_img_0000 ,-align=>"right"});
my $dilbert_magic = "<a href = http://www.dilbert.com/>" . $dilbert_magic_1 . "</a>";

# We have now constructed the link we are looking for.  
# dilbert_magic looks like: "<a href = http:...> http://www... </a>"

print header(-expire => "-1d");

open(HOME,"< ./index.html") || die "didn't open";

while(<HOME>)
{
    if(m/statlist/)
    {
	print $dilbert_magic 
    }
    else 
    {
	if(m/randomImg/)
	{
	    my $r = rand();
	    my $done = 0;
            if($r < .4)
	    {   # lemmon hill
		print '<a href="photos/lemmon_hill"> <img src="photos/lemmon_hill/lemmon_hill_suffering_1.jpg" border=0, Align="left"></A>';
		$done = 1;
	    };
	    if(!$done && ($r < .5))
	    {  # weather

		print '<a href="http://forecast.weather.gov/MapClick.php?w0=t&w2=wc&w3=sfcwind&w4=sky&w5=pop&w6=rh&w8=rain&w9=snow&w10=fzg&w11=sleet&AheadHour=47&Submit=Submit&FcstType=graphical&textField1=39.95250&textField2=-75.16570&site=all"><img src="http://images.intellicast.com/WxImages/RadarLoop/shd_None_anim.gif" border=0 Align="left"> </a>';
		$done = 1;
	    };
	    if(!$done && ($r < .8))
	    {   
		print '<a href="photos/kayaking_NC/"> <img src="dean_ocoee_ender-800.jpg" border=0, Align="left"></A>';
		$done = 1;
	    };
	    if(!$done && ($r < .9))
	    {   
		print '<a href="http://www.patspapers.com/blog/item/what_if_everybody_flushed_at_once_Edmonton_water_gold_medal_hockey_game/"> <img src="flush_game.jpg" border=0, Align="left"></A>';
		$done = 1;
	    };
	    if(!$done)
	    {      # SP over 200 years
		print '<a href="http://www.dailykos.com/story/2008/12/2/102214/940/743/668445"><IMG SRC="SP_from_1825.jpg" Align="left" border=0 alt="SP from 1825"></a>';
		$done = 1;
	    };
	}
	else
	{ # default
	    print if !m/HTTP-EQUIV/;
	}
    }
}
   end_html;


#   <IMG SRC="http://maps.weather.com/images/radar/single_site/phlloc_450x284.jpg" VSPACE=2 BORDER=0 ALT="Philadelphia, PA (19104) local radar">
#    img({-src=>'http://128.255.244.60/graphs/' . 'pres00_WTA.gif'}),
#    img({-src=>'http://maps.weather.com/images/maps/aviation/av10_720x486.jpg'}),





# Read the main page of dilbert--find the link to the image and assign it to dilbert_img
# http://umweb2.unitedmedia.com/comics/dilbert/index.html
# http://www.comics.com/comics/dilbert/ab.html');


################################################################################
##########################   before the change   ###############################
#my $dilbert_mainpage = get('http://www.unitedmedia.com/comics/dilbert/index.html');
#my $dilbert_img;
#($dilbert_img) = ($dilbert_mainpage =~ m:/comics/dilbert/archive/images/(dilbert\d*\.gif):);
#my $dilbert_magic_1 =  img({-src=>'http://www.comics.com/comics/dilbert/archive/images/'. $dilbert_img ,-align=>"right"});
#my $dilbert_magic = "<a href = http://www.unitedmedia.com/comics/dilbert/>" . $dilbert_magic_1 . "</a>";
################################################################################
################################################################################


# my ($sec,$min,$hour,$mday,$mon,$year,$wday,$yday,$isdst) = localtime time;          
# my $myyear = ($year+1900);
# my $mydate =  "$myyear-$mon-$mday";
# my $dilbert_img = "http://dilbert.com/dyn/str_strip/$dilbert_img_0000";

