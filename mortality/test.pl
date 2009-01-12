#!/usr/bin/perl

require "get_table.pl";
require "base_rate_profile.pl";
require "modified_life_table.pl";
require "expected_years_left.pl";
require "quantile_left.pl";

MAIN:
{
    print "deans years left: ",&expected_years_left(&modified_life_table(&sample_profile()));
    old_testing();
};

sub old_testing
{
    print "\n\n\n*******************   OLD TESTING STUFF ************\n\n";

    print "\n\n\n-------- testing reading life tables -----------\n\n";
    @males = &get_table("male");
    @females = &get_table("female");
    print $males[0],"\t",$females[0],"\n";
    print $males[1],"\t",$females[1],"\n";
    print $males[2],"\t",$females[2],"\n";
    print $males[3],"\t",$females[3],"\n";


    {
	print "\n\n\n-------- the base rate profile -----------\n\n";
	local(%base) = &base_rate_profile();
	local($key);
	foreach $key (keys (%base))
	{
	    print $key,"\t",$base{$key},"\n";
	};
    };

    {
	print "\n\n\n-------- the sample profile (aka dean) -----------\n\n";
	local(%base) = &sample_profile();
	local($key);
	foreach $key (keys (%base))
	{
	    print $key,"\t",$base{$key},"\n";
	};
    };

    print "\n\n\n-------- modifying a life table for the sample -----------\n\n";
    local(%profile) = &sample_profile();
    local(@new_table) = modified_life_table(%profile);
    print $new_table[0],"\n";
    print $new_table[1],"\n";
    print $new_table[2],"\n";

 $age = 5; print "A ",$age, " year old male has ",&expected_years_left($age,@males)," left\n";
 $age = 35; print "A ",$age, " year old male has ",&expected_years_left($age,@males)," left\n";
 $age = 85; print "A ",$age, " year old male has ",&expected_years_left($age,@males)," left\n";

 $age = 5; print "A ",$age, " year old male has ",&quantile_left(.5,$age,@males)," left\n";
 $age = 35; print "A ",$age, " year old male has ",&quantile_left(.5,$age,@males)," left\n";
 $age = 85; print "A ",$age, " year old male has ",&quantile_left(.5,$age,@males)," left\n";
 $age = 85; print "A ",$age, " year old:75% ",&quantile_left(.75,$age,@males)," left\n";
 $age = 85; print "A ",$age, " year old:90% ",&quantile_left(.90,$age,@males)," left\n";
 $age = 85; print "A ",$age, " year old:95% ",&quantile_left(.95,$age,@males)," left\n";
 $age = 85; print "A ",$age, " year old:96% ",&quantile_left(.96,$age,@males)," left\n";
 $age = 85; print "A ",$age, " year old:97% ",&quantile_left(.97,$age,@males)," left\n";
};
1






