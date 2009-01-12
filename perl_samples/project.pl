#!/usr/bin/perl

 

### Now we will print out the HTML document. The print command is 
### quite flexible. This incantation prints everything down to EOF.

use CGI qw(:standard :html3);
$q = new CGI;
my $ssn = $q->param("SSnumber");

$ssn += 0;  # crude trick to convert it to a number

###############  simulate/generate a new dataset #################

use IPC::Open2;
local(*Reader, *Writer);

$pid = open2(\*Reader, \*Writer, "/bin/cat data.txt");

#print Writer "set terminal jpeg\n";
#print Writer "plot sin(x)";
#close(Writer);

################# tell the user about the data set ##################

my $easy_name = $ssn.".data";
my $full_name = './tmp/'.$easy_name;

print $q->header(),
    $q->start_html("Here's your data!");

print "<H1>Here's your data!</H1>";

if (-e $full_name)
{
    print 'Your data was previously generated.<p>  Here it is again: ';
}
else
{
    open(DATA,">".$full_name);
    print DATA while(<Reader>);
    waitpid($pid,0);
    print 'Data set generated just for you: ';
}

print '<a  href="' . $full_name . '">' . $easy_name . '</a>';

print $q->end_html;
