# interactions.pl

sub interactions
{
    local(%profile) = @_;

    ######################################################################

    $profile{'driving_no_seatbelt'}   = (1 - $profile{'seat_belt'}) * $profile{'driving'};
    $profile{'driving_with_seatbelt'} =      $profile{'seat_belt'}  * $profile{'driving'};

    ######################################################################

    $profile{'radon_and_smoking'} = $profile{'radon'} * $profile{'smoking'};

    return %profile;
};
1
