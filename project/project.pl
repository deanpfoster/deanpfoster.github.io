#!/usr/bin/perl

 

### Now we will print out the HTML document. The print command is 
### quite flexible. This incantation prints everything down to EOF.

use CGI qw(:standard :html3);
$q = new CGI;
my $ssn = $q->param("SSnumber");
$ssn =~ s/[^\w ]//g;
$ssn =~ s/ /_/g;



#$ssn += 0;  # crude trick to convert it to a number

###############  simulate/generate a new dataset #################

use IPC::Open2;
local(*Reader, *Writer);

my $read_file = 'raw_projects/' . int(rand(12)) . '.data';

$pid = open2(\*Reader, \*Writer, "/bin/cat " . $read_file);

#print Writer "set terminal jpeg\n";
#print Writer "plot sin(x)";
#close(Writer);

################# tell the user about the data set ##################

my $easy_name = $ssn.".data";
my $full_name = './tmp/'.$easy_name;


print $q->header(),
    $q->start_html("Here's your data!");


#if($ssn == 0)
#{
#    print "\nOOPS... please use a big number that will be unique to you.\n";
#}
#else
{
    print "<H1>Here's your  <a  href=" . '"' . $full_name . '"' . ">data</a>!</H1>\n";
    if (-e $full_name)
    {
	print "Your data was previously generated.  But you can download it again if you like.<p>\n";
    }
    else
    {
	open(DATA,">".$full_name);
	print DATA while(<Reader>);
	waitpid($pid,0);
	print "We just generated a data set for you. \n";
    }
    print "<p>\nInstructions:\n";
    print '<ol>';
 


    print '<li> Download your data: <a  href="' . $full_name . '">' . $easy_name . '</a>' . "\n";
    print <<EOF; 
    
    <p>
	<ul>
	<li> Under Netscape, right-click and then use "save-link-as".
        <li> Under Opera, right-click and use the "save-target-as".
        <li> Under MSIE, right-click and use the "save-as". 
	</ul>
</p>
    <li> Import it into JMP IN.
    <p>
    <ol type=a>
    <li> use "file/read/import/interactive text import."  
    <li> Click on "tab delimited."  
    <li> Change the column types to be continuous so the
    regression will deal with them correctly.
    </ol>
    </p>
    <li> Be sure to write the exact name you used 
EOF
print "(" . $ssn . ")  to generate your data on your final project.\n<p>\n"
}

print $q->end_html;
