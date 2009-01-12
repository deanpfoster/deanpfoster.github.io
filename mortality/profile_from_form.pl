# profile_from_form.pl

sub profile_from_form
{
    local(%profile);
    # READ IN ALL THE VARIABLES SET BY THE FORM
    &ReadParse(*input);
    %profile = %input;

    ######################################################################
    # Setting up stuff we didn't ask about yet

    %base_rate = &base_rate_profile();
    $profile{'dealing_drugs'} = $base_rate{'dealing_drugs'};
    $profile{'live_in_city'} =  $base_rate{'live_in_city'};

    ######################################################################
    # now we have to convert all these nice words into numbers

    if($profile{'race'} eq "black")
    {
	$profile{'is_black'} = 1;
    }
    else
    {
	$profile{'is_black'} = 0;
    };


    ######################################################################
    if($profile{'gender'} eq "male")
    {
	# males aren't effected by being/not being a married female
	$profile{'is_married_female'} = $base_rate{'is_married_female'};
	$profile{'is_married_male'} = $profile{'married'};
    }
    else
    {
	$profile{'is_married_male'} =  $base_rate{'is_married_male'};
	$profile{'is_married_female'} = $profile{'married'};
    };

    ######################################################################
    if(($profile{'gender'} ne "male") && ($profile{'gender'} ne "female"))
    {
	print "no gender read from form.";
    };

    return %profile;
}


1
