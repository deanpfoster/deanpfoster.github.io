sub max
{
    my $max = shift(@_);
    for my $item(@_)
    {
	$max = $item if $max < $item;
    }
    return $max;
}

print "max:",max(2,3,5,3,2),"\n";
print "max:",max(),"\n";

sub rmax
{
    if($#_ == 0)
    {
	return @_;
    }
    else
    {
	my $max = shift(@_);
	my $rest_max =  max @_;
	$max = $rest_max if $max < $rest_max;
	return $max;
    }
}

print "rmax:",rmax(2,3,5,3,2),"\n";
print "rmax:",rmax(2),"\n";


sub factorial
{
#   my    $value = $_[0];
    $value = $_[0];
    if($value == 0)
    {
	return 1;
    }
    else
    {
	return $value * factorial($value - 1);
    }
}
print factorial(0),"\n";
print factorial(6),"\n";

sub quick_sort_recusion
{
    if($#_ <= 1)
    {
	return;
    }
    else
    {
	my $split = $_[0];
	foreach($foo in @_)
	{
	    if $foo < $split
		push small;
	    else
		push large
	}
	return quick_sort(small),quick_sort(large);
    }
}
