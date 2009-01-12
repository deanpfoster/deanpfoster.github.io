# balance.pl

require "interactions.pl";

sub balance
{
    local($key,$new_value,%profile) = @_;
    local($age) = $profile{'age'};
    local(%walking) = %profile;
    local(%change) = %profile;
    $walking{'exercise'} += 7 * .333;  # 7 days of 1 mile each
    $change{$key} = $new_value;
    %change = &interactions(%change);

    local($no_change) = expected_years_left($age,&modified_life_table(%profile));
    local($walk_effect) = expected_years_left($age,&modified_life_table(%walking));
    local($key_effect) = expected_years_left($age,&modified_life_table(%change));

    return ($key_effect - $no_change)/($walk_effect - $no_change);
};
1
