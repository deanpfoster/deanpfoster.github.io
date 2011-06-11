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
            if($r < .3)
	    {   # lemmon hill
		print '<a href="photos/lemmon_hill"> <img src="photos/lemmon_hill/lemmon_hill_suffering_1.jpg" border=0, Align="left"></A>';
		$done = 1;
	    };
	    if(!$done && ($r < .6))
	    {   # kayaking
		print '<a href="photos/kayaking_NC/"> <img src="dean_ocoee_ender-800.jpg" border=0, Align="left"></A>';
		$done = 1;
	    };
	    if(!$done && ($r < .8))
	    {   # patagonia
		print '<a href="photos"> <img src="patagonia.jpg" border=0, Align="left", 
                       height=856, width=568></A>';
		$done = 1;
	    };
	    if(!$done && ($r < .88))
	    {   # patagonia
		print '<iframe width="1000" height="800" frameborder="0" scrolling="no" marginheight="0" marginwidth="0" src="http://maps.google.com/maps?f=d&amp;source=s_d&amp;saddr=1617+Spruce+St,+Philadelphia,+PA+19103&amp;daddr=39.9854159,-75.1965752+to:40.00733,-75.17954+to:40.047486,-75.199907+to:40.0601501,-75.2049772+to:40.088208,-75.183259+to:40.100978,-75.178011+to:40.1087862,-75.1733963+to:40.1227142,-75.1890259+to:40.1237182,-75.2136011+to:40.16023,-75.18878+to:Tennis+Ave+to:40.120286,-75.2470023+to:40.1136472,-75.2609114+to:40.0849931,-75.2837558+to:40.07377,-75.27998+to:1617+Spruce+St,+Philadelphia,+PA+19103&amp;hl=en&amp;geocode=FXSNYQIdHASF-yktZQT8OsbGiTG80IXfpJFNhw%3BFQchYgIdYZeE-ykJ2205n8fGiTFkg5BX5zEd8w%3BFaJ2YgId7NmE-ymHVphnc7jGiTFIKWYWJL-qFQ%3BFX4TYwIdXYqE-yl76RJeqrnGiTGkI1D4UUuIwg%3BFfZEYwIdj3aE-ymRO-VCCbnGiTHrqgT9ZCSfhQ%3BFZCyYwIdZcuE-ymLMkP3I7rGiTHFlhAKK4xgwQ%3BFXLkYwId5d-E-ylHBNheFbrGiTHNqpdisKLyxw%3BFfICZAId7PGE-ykvkDLbaLrGiTFRFhDemFAjhw%3BFVo5ZAId37SE-ymRlLYEWLrGiTEg5yUkkyC4Ow%3BFUY9ZAId31SE-ynxK-82prvGiTHb-YhyH1Mz0Q%3BFebLZAId1LWE-yk__JEF0rrGiTFiJMkmawOI0Q%3BFQ0SZQIdEHSE-w%3BFd4vZAIdZtKD-yn7ESgHiLvGiTGvhdocTjrfkg%3BFe8VZAIdEZyD-ymLZX2ubLzGiTFmIuFS5a8v4w%3BFQGmYwId1UKD-ykhIObkj77GiTG5CO44Y7zFJg%3BFSp6YwIdlFGD-yknNxd96b7GiTGDg1qw3fMhUQ%3BFXSNYQIdHASF-yktZQT8OsbGiTG80IXfpJFNhw&amp;mra=dpe&amp;mrsp=15&amp;sz=14&amp;via=1,2,3,4,5,6,7,8,9,10,12,13,14,15&amp;dirflg=b&amp;sll=40.076758,-75.274286&amp;sspn=0.033035,0.062656&amp;ie=UTF8&amp;ll=40.070715,-74.958344&amp;spn=0.264303,0.762863&amp;z=11&amp;lci=bike"></iframe><br /><small><a href="http://maps.google.com/maps?f=d&amp;source=embed&amp;saddr=1617+Spruce+St,+Philadelphia,+PA+19103&amp;daddr=39.9854159,-75.1965752+to:40.00733,-75.17954+to:40.047486,-75.199907+to:40.0601501,-75.2049772+to:40.088208,-75.183259+to:40.100978,-75.178011+to:40.1087862,-75.1733963+to:40.1227142,-75.1890259+to:40.1237182,-75.2136011+to:40.16023,-75.18878+to:Tennis+Ave+to:40.120286,-75.2470023+to:40.1136472,-75.2609114+to:40.0849931,-75.2837558+to:40.07377,-75.27998+to:1617+Spruce+St,+Philadelphia,+PA+19103&amp;hl=en&amp;geocode=FXSNYQIdHASF-yktZQT8OsbGiTG80IXfpJFNhw%3BFQchYgIdYZeE-ykJ2205n8fGiTFkg5BX5zEd8w%3BFaJ2YgId7NmE-ymHVphnc7jGiTFIKWYWJL-qFQ%3BFX4TYwIdXYqE-yl76RJeqrnGiTGkI1D4UUuIwg%3BFfZEYwIdj3aE-ymRO-VCCbnGiTHrqgT9ZCSfhQ%3BFZCyYwIdZcuE-ymLMkP3I7rGiTHFlhAKK4xgwQ%3BFXLkYwId5d-E-ylHBNheFbrGiTHNqpdisKLyxw%3BFfICZAId7PGE-ykvkDLbaLrGiTFRFhDemFAjhw%3BFVo5ZAId37SE-ymRlLYEWLrGiTEg5yUkkyC4Ow%3BFUY9ZAId31SE-ynxK-82prvGiTHb-YhyH1Mz0Q%3BFebLZAId1LWE-yk__JEF0rrGiTFiJMkmawOI0Q%3BFQ0SZQIdEHSE-w%3BFd4vZAIdZtKD-yn7ESgHiLvGiTGvhdocTjrfkg%3BFe8VZAIdEZyD-ymLZX2ubLzGiTFmIuFS5a8v4w%3BFQGmYwId1UKD-ykhIObkj77GiTG5CO44Y7zFJg%3BFSp6YwIdlFGD-yknNxd96b7GiTGDg1qw3fMhUQ%3BFXSNYQIdHASF-yktZQT8OsbGiTG80IXfpJFNhw&amp;mra=dpe&amp;mrsp=15&amp;sz=14&amp;via=1,2,3,4,5,6,7,8,9,10,12,13,14,15&amp;dirflg=b&amp;sll=40.076758,-75.274286&amp;sspn=0.033035,0.062656&amp;ie=UTF8&amp;ll=40.070715,-74.958344&amp;spn=0.264303,0.762863&amp;z=11&amp;lci=bike" style="color:#0000FF;text-align:left">View Larger Map</a></small>';
		$done = 1;
	    };
	    if(!$done && ($r < .92))
	    {  # weather

		print '<a href="http://forecast.weather.gov/MapClick.php?w0=t&w2=wc&w3=sfcwind&w4=sky&w5=pop&w6=rh&w8=rain&w9=snow&w10=fzg&w11=sleet&AheadHour=47&Submit=Submit&FcstType=graphical&textField1=39.95250&textField2=-75.16570&site=all"><img src="http://images.intellicast.com/WxImages/RadarLoop/shd_None_anim.gif" border=0 Align="left"> </a>';
		$done = 1;
	    };
	    if(!$done && ($r < .95))
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

