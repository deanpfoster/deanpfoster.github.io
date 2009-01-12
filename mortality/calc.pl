#!/usr/bin/perl

#STILL TO BE ADDED
# reasonableness checks on ages and all inputs
# find more accurate numbers (e.g. for race, base rates)
#remove dots by items
#add left handed
#add exercise plans
# seat belts - halve risk from driving
# add asperin, wine, fat, calories

require "find_life_expectancy.pl";      # all the work!

# _________________________________________________________
#  FIND EFFECT OF EACH HEALTH CHOICE

$base_life_expectancy = $life_expectancy;   

foreach $key (keys (%original_profile)) 
{                   # loop over items in profile
    if ($key ne 'age') 
    {
	%profile = %original_profile;
	$profile{$key} = $default_profile{$key};            # change each item to its default
	do  "find_life_expectancy.pl";  
	$delta_expectancy{$key} = $life_expectancy - $base_life_expectancy;   # calculate difference in life expectancy
    };
};
%profile = %original_profile;






