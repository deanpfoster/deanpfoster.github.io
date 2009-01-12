# modified_life_table.pl

require "additive_hazards.pl";
require "proportional_hazards.pl";
require "get_table.pl";


sub modified_life_table
{
    local(%profile) = @_;

    if(($profile{'gender'} ne "male") && ($profile{'gender'} ne "female"))
    {
	print "no gender passed into modified_life_table.  :(\n";
    };

    @life = get_table($profile{'gender'});

    # get hazards
    local($proportional) = proportional_hazards(%profile);
    local($additive)     = additive_hazards(%profile);
    local($base_additive)= additive_hazards(&base_rate_profile());

    local(@modified_life) = @life;
    local($i);
    for ($i=1; $i<=$#modified_life; $i++) 
    { 
	local($yearly_rate) = $life[$i];
	local($yearly_proportional) = $yearly_rate - $base_additive;
	if($yearly_proportional < 0)
	{
	    # this is a problem for say 10 year old girls (who live forever anyway)
#	    print "negative hazard rate for ",$i," year olds: ",$life[$i], " - ",$base_additive,"\n";
	    $yearly_proportional = 0;
	};
	local($base_additive_truncated) = $yearly_rate - $yearly_proportional;
	if(1 - $yearly_proportional > 1)
	{
	    print "oops... error in modified_life_table code.\n";
	};


	local($new_rate) = $additive + $base_additive_truncated + 
	                   (1 - (1 - $yearly_proportional)**(1+$proportional));

        # make sure probs are realistic
	if($new_rate > 1)
	{
	    $new_rate = 1;
	}; 
	if($new_rate < 0)
	{
	    $new_rate = 0;
	}; 
	$modified_life[$i] = $new_rate;
    };
    return @modified_life;
};
1
