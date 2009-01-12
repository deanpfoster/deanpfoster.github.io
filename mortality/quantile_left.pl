#quantile_left.pl

sub quantile_left
{
    local($quant,$age,@life_table) = @_;
    local($i) = $age;
    local($fraction_alive) = 1;
    # assumes that you die with 100% prob at end of life table
    while($fraction_alive >= $quant)
    {
	$fraction_alive *= 1 - $life_table[$i];
	$i++;
    }
    local($last_fraction) = $fraction_alive / (1 - $life_table[$i]);
    local($interpolate) = ($quant - $fraction_alive)/($last_fraction - $fraction_alive);
    $interpolate = int(100*$interpolate)/100;
    return $i - $interpolate - $age;
};
1

