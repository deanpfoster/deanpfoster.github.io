
#
#  Unix sorter!
#
sub
sorter
{
    ################################################
    # Grab the array of stuff passed in.  No error checking possible since we allow anything
    my @unsorted = @_;

    ################################################
    #   Setup the unix pipes and stuff
    use IPC::Open2;
    local(*Reader, *Writer);
    $pid = open2(\*Reader, \*Writer, "sort");

    ################################################
    #   print out information to unix sort
    for(my $index = 0; $index <= $#unsorted;++$index)
    {
	print Writer $unsorted[$index],"\n";
    }
    close(Writer);

    ################################################
    #   read information from unix sort
    $index = 0;
    my @result;
    while(my $value = <Reader>)
    {
	chop $value;
	$result[$index] = $value;
	++$index;
    }

    ################################################
    #   be polite and wait for job to completely finish
    waitpid($pid,0);
    return @result;
}

my @sorted = sorter('c','b','a');

print "@sorted ","\n";  # print out: a b c

