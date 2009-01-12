$text = "foo,5,";

if($text =~ m/([^,]*),([^,]*),([^,]*)/)
{
    $foo[0] = $1;
    $foo[1] = $2;
    $foo[2] = $3;
}
print $#foo." items read\n";
foreach(@foo)
{
    print ":".$_."\n";
}

$easy = "foo,5,silly,";

print $0,$1,$2,"\n";

if($easy =~ m/^(([^,]*),)+$/)
{
    print "matched.\n";
    $bar[0] = $0;
    print 0,$0;
    $bar[1] = $1;
    print 1,$1;
    $bar[2] = $2;
    print 2,$2;
    $bar[3] = $3;
    print 3,$3;
    $bar[3] = $4;
    print 4,$4;

}
print "------------\n";
foreach(@bar)
{
    print ":".$_."\n";
}



print "douible word test\n";
$string = "testing bar bar bar";
$string =~ m/((.{2,}).*\2)/;
{
    print $2.":";
    print $1;
    print "\n";
    print $`.$@.$';;
}


