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
###############################################################################
# It only is writen once or twice a week.  So something like:
#    wget http://cdn.nearlyfreespeech.net/jandmstatic/strips/<today magic>.png -O jesus_and_mo-maybe.png -q
#    mv jesus_and_mo_maybe.png(L0) jesus_and_mo.png   (Zshell magic)
# put in a cron shell might be nice
############################################################
	my $jesus = `date -d"yesterday" +"%F"`;
	$jesus =~ s/\s+$//; 
	print "\n";
	print '<a href="http://www.jesusandmo.net/"><img src="';
	print "http://cdn.nearlyfreespeech.net/jandmstatic/strips/" . $jesus. ".png";
	print '" border=0, Align="right"></a>';
	print "\n\n";
#	print $dilbert_magic   # doesn't work....
    }
    else 
    {
	if(m/randomImg/)
	{
	    my $r = rand();
	    my $done = 0;
	    my $total = 0;
	    $total += .2;
            if(!$done && $r < $total)
	    {   # lemmon hill
		print '<a href="photos/dean/"> <img src="lemmon_hill.jpg" border=0, Align="left"></A>';
		$done = 1;
	    };
	    $total += .1;
            if(!$done && $r < $total)
	    {   # evolution
	      print '<a href="http://chrisblattman.com/files/2011/08/piro-evolution.jpg"> <img src="evolution.jpg" border=0, Align="left"></A>';
		$done = 1;
	    };

################################################################################################
#	    $total += .1
#           if(!$done && $r < $total)
#	    {   # obama
#		print '<a href="http://www.intrade.com/aav2/trading/tradingHTML.jsp?selConID=743474">
#		    <img src="http://data.intrade.com/graphing/closingChart.gif?contractId=743474&intradeChart=true&transBackground=true&transBackground=true" height="225" width="460"
#		    alt="Price for 2012 Presidential Election Winner (Individual) at intrade.com"
#		    title="Price for 2012 Presidential Election Winner (Individual) at intrade.com" border="0"></a><p>Barack Obama to be win';
#		    $done = 1;
#	    }
################################################################################################

	    $total += .3;
            if(!$done && $r < $total)
	    {   # kayaking
		print '<a href="photos/kayaking_NC/"> <img src="dean_ocoee_ender-800.jpg" border=0, Align="left"></A>';
		$done = 1;
	    };
	    $total += .3;
            if(!$done && $r < $total)
	    {   # patagonia
		print '<a href="photos"> <img src="patagonia.jpg" border=0, Align="left", 
                       height=856, width=568></A>';
		$done = 1;
	    };
#	    $total += .2;
#            if(!$done && $r < $total)
#	    {   # where is Dean?
##		print '<iframe src="http://www.google.com/latitude/apps/badge/api?user=-1137818149277703619&type=iframe&maptype=roadmap" width="850" height="1400" frameborder="0"></iframe>';
#		$done = 1;
#	    };
	    $total += .05;
            if(!$done && $r < $total)
	    {  # weather

		print '<a href="http://forecast.weather.gov/MapClick.php?w0=t&w2=wc&w3=sfcwind&w4=sky&w5=pop&w6=rh&w8=rain&w9=snow&w10=fzg&w11=sleet&AheadHour=47&Submit=Submit&FcstType=graphical&textField1=39.95250&textField2=-75.16570&site=all"><img src="http://images.intellicast.com/WxImages/RadarLoop/shd_None_anim.gif" border=0 Align="left"> </a>';
		$done = 1;
	    };
	    $total += .03;
            if(!$done && $r < $total)
	    {   # Flush!
#	      print '<a href="https://www.oddschecker.com/politics/us-politics/donald-trump-specials/trump-exit-date"
		print '<a href="http://www.patspapers.com/blog/item/what_if_everybody_flushed_at_once_Edmonton_water_gold_medal_hockey_game/"> <img src="flush_game.jpg" border=0, Align="left"></A>';
		$done = 1;
	    };
	    $total += .02;
            if(!$done && $r < $total)
	    {      # SP over 200 years
		print '<a href="http://www.dailykos.com/story/2008/12/2/102214/940/743/668445"><IMG SRC="SP_from_1825.jpg" Align="left" border=0 alt="SP from 1825"></a>';
		$done = 1;
	    };
           if(($total < .9999) || ($total > 1.0001))
	    {
		print "Total probability doesn't sum to one: ",$total,".";
	    }
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

