# default_values.pl




%sample_profile = ('smoking', 0,
		    'exercise', 0,
		    'marital_status', "married",
		    'race', "white",
		    'gender', "female",
		    'driving', 0);

sub printProfile
{
    local(%profile) = @_;
    foreach $key (sort keys (%profile)) 
    {     
	$value = $profile{$key};
	print " $key,  $value <br> \n";
    };
};
# print  out the (key,value) pairs of the profile (sort to get nice order)


1
