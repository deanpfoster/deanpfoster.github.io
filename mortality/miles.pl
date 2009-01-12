# miles.pl

sub miles
{
    local($value) = @_;
    
    if($value < 0)
    {
	print "Oops, we don't like negative numbers.<p>\n";
    };

    if($value > .5)
    {
	$value = int($value*10)/10;
	if($value == 1)
	{
	    return "one mile";
	};
	return "",$value," miles";
    };
    # OK, it isn't too far, so lets try yards
    $value = 1760*$value;
    if($value > 300)
    {
	$value = int($value/100)*100;
	return $value," yards";
    };
    if($value > 30)
    {
	$value = int($value/10)*10;
	return $value," yards";
    };
    
    #Ok, how about doing it in feet
    $value = 3 * $value;
    if($value > 30)
    {
	$value = int($value/10)*10;
	return $value," feet";
    };
    if($value > 3)
    {
	$value = int($value);
	return $value," feet";
    };

    #Wow, it isn't very far at all!  Lets switch to inches
    $value = 12 * $value;
    if($value > 3)
    {
	$value = int($value);
	return $value," inches";
    };
    if($value > 0.0)
    {
	$value = int($value*10)/10;
	if($value = 1)
	{
	    return "one inch";
	};
	return $value,"inches";
    };

    #no convienent units to use...
    
};
1
