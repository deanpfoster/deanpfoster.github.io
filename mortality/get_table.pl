#!/usr/bin/perl

# get_table.pl

sub get_table
{
    local($gender) = @_;
    
    local(@qmale,@qfemale,@words);

    open(life_table, "./life.table");

    if(eof(life_table))
    {
	print "table is empty";
    }



    local($line);
    $line = <life_table>;  # eat the comment line
    $line = <life_table>;  #eat header line

    while (! eof(life_table)) 
    {
	$line = <life_table>;  # first real line of 
	@words = split(' ', $line);
	$qmale[$words[0]] = $words[1];
	$qfemale[$words[0]] = $words[2];
    };

    if($gender eq "male")
    {
	return @qmale;
    }
    elsif($gender eq "female")
    {
	return @qfemale;
    }
    else
    {
	print "Oops. what is the gender after all? ", $gender;
    };
};

1



