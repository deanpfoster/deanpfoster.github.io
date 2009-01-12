#!/usr/bin/perl


sub base_rate_profile
{
    local(%base_rate);

    %base_rates =  ('smoking', 3,
		    'exercise', .5,
		    'is_married',.7,     # this shouldn't be used
		    'is_married_male',.7,
		    'is_married_female',.7,

		    'is_black',.1,
		    'driving', 10,       # this shouldn't actually be used
		    'driving_no_seatbelt',4, # seatbelt rate is 61%
		    'driving_with_seatbelt',6,
		    'dealing_drugs',0,    # should be closer to .01 ?
		    'live_in_city',.2,
		    'radon',.06,
		    'radon_and_smoking',.06*3
		    );

    return %base_rates;
};
sub sample_profile
{
    local(%rate);

    %rates =  ('smoking', 0,
	       'age', 38,
	       'gender','male',
	       'exercise', 5,
	       'driving', 0,
	       'driving_no_seatbelt',0,
	       'driving_with_seatbelt',0,
	       'is_married', 0,
	       'is_married_male',0,
	       'is_married_female',0,
	       'is_black',0,
	       'dealing_drugs',0,
	       'live_in_city',1);

    return %rates;
};
1
