#additive_hazards.pl

sub additive_hazards
{
    local(%profile) = @_;

    # Additive hazards are primarilly accidents/hand guns/etc (things that are age invariant)

    local(%hazards);
    
    $hazards{'is_black'} = .0;        # a guess (should be about 5 years)
                                        # this is split between additive and proportional

    $hazards{'driving_no_seatbelt'  } = .000023; # (per 1000 miles per year)
    $hazards{'driving_with_seatbelt'} = .000014; #  about 1.4/100M miles


    $hazards{'live_in_city'} = .0;    # guess (due to handguns)
    $hazards{'dealing_drugs'} = .0;     # guess (occupational hazards) should decrease with age?

    local($total) = 0;

    local($key);
    foreach $key (keys (%hazards))
    {     
	$total += $hazards{$key} * $profile{$key};
    };

    return $total;
};

1
