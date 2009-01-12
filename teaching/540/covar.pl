#!/usr/bin/perl


use CGI qw(:standard :html3);

print header();

print start_html(-title   => "Covariate collector",
                 -author  => 'waterman@compstat.wharton.upenn.edu',
                 -bgcolor =>"silver");

print "<CENTER><H1> Covariate Catcher</H1></CENTER>\n";

print "<B>Every statistician needs their covariates.</B><BR>\n";
 

print start_form();

print "Name: ", textfield(-name    => 'Name',
                -default   => 'John Doe',
                -size      => 40,
                -maxlength => 60);
print br;

print "Gender: ", radio_group(-name=>'Gender',
                                -values=>['Male','Female'],
                                -default=>'Male');

print br;

print "Area: ", popup_menu(-name   => 'Location',
                 -values => ['North','South','East','West'],
                 -default=> 'West');

print br;

print "Hobbies: ", scrolling_list(-name=>'Hobbies',
                                -values=>['Swimming',
                                          'Tennis',
                                          'Chess',
                                          'Horse riding',
                                          'Fishing',
                                          'Sailing'],
                                -default=>['Swimming','Sailing'],
                                -size=>3,
                                -multiple=>'true');

print br;

print "Favorite classes: ", checkbox_group(-name   => 'Class',
                    -values => ['Statistics', 'Marketing', 'Geometry'],
                    -default => 'Statistics');

print br;

print "Comments?", textarea(-name    =>  'Comments', 
                            -default =>  'Great job!', 
                            -rows    =>  3, 
                            -columns =>  40); 

print br;


print hr;

print submit(-label => 'Submit covariates',
             -name => 'submit');

print reset(-name => 'Reset this form');

print end_form();

if( param())
{
    print "Here is what you said about yourself";
    print "<UL>\n";
    print "<LI> Name: ", param('Name'); 

    print "<LI> Gender: ", param('Gender');

    print "<LI> Area: ", param('Location');

    print "<LI> Hobbies: ", param('Hobbies');

    print "<LI> Favorite classes: ", param('Class');

    print "<LI> Your comments: ", param('Comments');

    print "</UL>";
}


print end_html();

# $| = 1; ### This flushes the output buffers. Look at the output without it.



open DATABASE, ">>database.txt";
select DATABASE;
print param('Name'),"\t", param('Gender'), "\t", param('Location'), "\n";
close DATABASE;


