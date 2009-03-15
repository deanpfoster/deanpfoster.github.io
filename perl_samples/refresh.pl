#!/usr/bin/perl

{
    use CGI qw(:standard :html3);
    $q = new CGI;

####################################################################
#
#  RETURN THE C++ OUTPUT TO THE SYSTEM
    
    print $q->header;
    print "<META HTTP-EQUIV=\"Refresh\" CONTENT=\"1; URL=http:./refresh.pl\">";
    
    print "<h1>Fitted model as a CSV file</h1>\n";
    print "<a href=\"".$prefix."log/auction.model.txt\">Fitted model</a>";
    print "<P>NOTE: You may have to wait for the file to be generated.  Output should show up below when it is ready.";

    use Cwd;
    $current_dir = &Cwd::cwd();

    print "<p>Current Directory: \n".$current_dir . "<p>\n";


    print "<h1>Pretty Output</h1>\n";
    $pretty_output = "latest_pretty";
    open(TMP1,"<$pretty_output") || die "can't open";
    while(<TMP1>) {print ; print "<br>";};
    close(TMP1);


# Pretty output

    $output = "log/auction.model.pretty_print";
    print "<p><h2>C++ output to file file: $output</h2><p>\n";
    open(TMP,"<$output") || die "can't open";
    while(<TMP>) {print ; print "<br>";};
    close(TMP);
}


