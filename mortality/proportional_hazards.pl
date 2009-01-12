#proportional_hazards.pl

# These hazards are primarilly health risks.  The idea is that
# all we know about them is their effect, NOT when the have their
# effect.  So for example, smoking will be taken to speed up death
# for all ages.  It might say double the death rate.  This means a 90
# year old smoker will almost surely die this year (or soon).  This
# isn't necessarilly correct, but we don't know any better method.

# (Contrast thiw with driving where we know the risk rates.)

# Unfortunately, proportional hazard models aren't in any nice units.
# So the meaning of .01 isn't easy to interpret.  What it means is that
# in a year where typically there should be .8 living through the year,
# there will be instead .8^1.01 living through the year.  So these rates
# effect "old" people much more than young people.

require "base_rate_profile.pl";

sub proportional_hazards
{
    local(%profile) = @_;

    local(%hazards);
    local($years) = .087;  # add to decrease life by 1 year

    $hazards{'is_married_male'} = - 3 * $years; 
    $hazards{'is_married_female'} = + 5* $years; # coming out larger than expected???

    $hazards{'is_black'} = 3 * $years;  # (should be about 5 years)
                                        # this is split with additive 

    $hazards{'exercise'} = -.5 * $years;         # (hours/week of exercise) 
    $hazards{'smoking'} = .3 * $years;           # per cigarette
    $hazards{'radon'} = .015;                    # for being above EPA point
    $hazards{'radon_and_smoking'} = .1 * $years; # say a 30% increase?
# routine prostate check reduces death rate (on average) by 1/4000 


    local(%base_rate) = &base_rate_profile();

    local($key);
    local($total) = 0;
    foreach $key (keys (%hazards))
    {     
	$total += $hazards{$key} * ($profile{$key} - $base_rates{$key});
    };
    return $total;

};

1
