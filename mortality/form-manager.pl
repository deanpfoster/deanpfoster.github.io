#!/usr/bin/perl

require "cgi-lib.pl";
require "print_footer.pl";
require "modified_life_table.pl";
require "expected_years_left.pl";
require "profile_from_form.pl";
require "print_profile.pl";
require "quantile_left.pl";
require "save_state.pl";
require "interactions.pl";

MAIN:
{
    # PRINT THE HEADER
    print &PrintHeader;
    print "<BODY bgcolor=\"\#FFEFDB\">";
    print &HtmlTop("Life expectancy results");

    local(%profile) = &profile_from_form();
    %profile = &interactions(%profile);

    local($age) = $profile{'age'};

    local(@life) = &modified_life_table(%profile);
    local($expected_life) += $age + &expected_years_left($age,@life);
    $expected_life = int($expected_life*2)/2;

    local($lower_quarter) = int(($age + quantile_left(.75,$age,@life))*2)/2;
    local($upper_quarter) = int(($age + quantile_left(.25,$age,@life))*2)/2;

    print '<p>You are expected to live to ',$expected_life,' years old.</p>',"\n";

    print '<p>50 percent of the time you will die between ',$lower_quarter,
          ' and ',$upper_quarter,' years of age.</p>',"\n";


    print '<FORM ACTION="analyze.pl" Method="get">';
    &save_state(%profile);
    print '<INPUT TYPE="submit" VALUE="Analyze health risks"></FORM>';

    &printfooter;
}
