#expected_years_left.pl


sub expected_years_left
{
    local($current_age,@life_table) = @_;
    $curent_age = int $current_age;
    local($i) = $current_age;
    local($fraction_alive) = 1;
    local($total) = 0;
    # assumes that you die with 100% prob at end of life table
    foreach $i ($current_age .. $#life_table)
    {
	$total = $total + $fraction_alive;
	$fraction_alive = $fraction_alive * (1 - $life_table[$i]);
    };
    $total = int($total*100)/100;
    return $total - .5;  # correction for dieing 1/2 way through the year on average
};

1

