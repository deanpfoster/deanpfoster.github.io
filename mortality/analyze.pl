#!/usr/bin/perl

# analyze.pl

require "cgi-lib.pl";
require "print_footer.pl";
require "modified_life_table.pl";
require "expected_years_left.pl";
require "profile_from_form.pl";
require "print_profile.pl";
require "quantile_left.pl";
require "save_state.pl";
require "balance.pl";
require "miles.pl";

MAIN:
{
    # PRINT THE HEADER
    print &PrintHeader;
    print "<Title> Analyze health risks </title>";
    print "<BODY bgcolor=\"\#FFEFDB\">";
    print &HtmlTop("<A href= \"walk_a_mile_times_square.html\">
<IMG align = center src = \"walk_a_mile_times_square_cropped.jpeg\"
                   height = 164 width = 453 alt=\"I'd walk a mile for a camel.\"></a>
                   Would you?");

    print "<p> In 1921 RJR inaugurated the slogan \n";
    print '"',"I'd Walk a Mile for a Camel.",'"',"\n";
    print '(From the <A HREF="http://www.worldchat.com/public/geaston/history.html">';
    print "Tobacco timeline</A>.) \n";
    print "We believe they exaggerated.  \n";
    print "In order to balance the damage done by one cigarette, you only have \n";
    print "to walk about 1/4 of a mile.  Unfortunately, that is a quarter mile for\n";
    print "each and every cigarette!\n";
    print "<p>";
    print "Of course it is impossible to balance one health risk with another \n";
    print "health benefit.  But this page tries to do that anyway.\n";
    print "The basic idea is to estimate how much longer one will live/die\n";
    print "based on some behavior and trade that off with other behaviors.\n";
    print "Following RJR's tradition of 75+ years, we will use walking a\n";
    print "mile as our basic currency.</p>\n";

    %profile = &profile_from_form();

    local($age) = $profile{'age'};

    local(@life) = &modified_life_table(%profile);
    local($expected_life) += $age + &expected_years_left($age,@life);
    $expected_life = int($expected_life*100)/100;

    print "<hr>\n";

    print "<p>Your personal balancing act:</p>\n";
    print "<ul>\n";

    # SMOKING
    if($profile{'smoking'} != 0)
    {
	local($distance) = &balance('smoking',0,%profile);
	print "<li>To make up for your smoking you have to walk ";
	print &miles($distance)," per day.\n";
    };

    # Radon
    if($profile{'radon'} != 0)
    {
	local($distance) = &balance('radon',0,%profile);
	if($profile{'radon'} == 1)
	{
	    print "<li>Removing the Radon from your home would be equivalent to walking ";
	    print &miles($distance)," per day.\n";
	}
	else
	{
	    print "<li>Making sure your home doesn't contain Radon would be equivalent to walking ";
	    print &miles($distance)," per day.\n";
	};
    };

    # DRIVING
    if($profile{'driving'} != 0)
    {
	local($driving) = &balance('driving',0,%profile);
	local($always) = &balance('seat_belt',1,%profile);
	print "<li>To make up for your driving habits you have to walk ";
	print &miles($driving)," per day.\n";
	if($always != 0)
	{
	    print "<br>If you were to always wear a seatbelt you would only have to walk \n";
	    print &miles($driving - $always)," per day.\n";
	};
    };

    # MARRAGE
    if($profile{'gender'} eq "male")
    {
	print "<li>\n";
	if($profile{'married'} != 1)
	{
	    local($delta) = &balance('is_married_male',1,%profile);
	    print "To make up for not being married, you should walk \n";
	    print &miles($delta)," per day.<br>\n";
	};
	if($profile{'married'} != 0)
	{
	    local($delta) = &balance('is_married_male',0,%profile);
	    print "Not being single gains you \n";
	    print &miles(-$delta)," per day.<br>\n";
	};
    }
    else
    {
	print "<li>\n";
	if($profile{'married'} != 1)
	{
	    local($delta) = &balance('is_married_male',1,%profile);
	    print "Not being married gains you \n";
	    print &miles($delta)," per day.<br>\n";
	};
	if($profile{'married'} != 0)
	{
	    local($delta) = &balance('is_married_male',0,%profile);
	    print "To make up for not being single, you should walk \n";
	    print &miles(-$delta)," per day.<br>\n";
	};
    };

    #OTHER RISKS


    print "</ul>\n";

    print '<FORM ACTION="details.html" Method="get">';
    print '<INPUT TYPE="submit" VALUE="Further details"></FORM>';

    &printfooter();

    print '<p> <hr> </p> <p> <hr> </p> <p><hr> </p>';
#    print 'DEBUGGING INFORMATION ON VARIABLES PASSED IN</p>';

#    &print_profile(%profile);
}
