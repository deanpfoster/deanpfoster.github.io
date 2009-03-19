#!/usr/bin/perl

{
    use CGI qw(:standard :html3);
    $q = new CGI;

####################################################################
#
#  RETURN THE C++ OUTPUT TO THE SYSTEM
    
    print $q->header;
    $output = "log/auction.model.pretty_print";
    open(TMP,"<$output") || die "can't open";

    if ( !<TMP> )
    {
	print "<META HTTP-EQUIV=\"Refresh\" CONTENT=\"1; URL=http:./refresh.pl\">";
	print "You output is not ready yet";
	print "Lots of output will appear below when the run is complete.";
    }
    
    print "<h1>DONE!</h1>\n";

    print "<h2><a href=\"".$prefix."log/auction.model.txt\">Fitted model</a></h2>";

    use Cwd;
    $current_dir = &Cwd::cwd();
    $current_dir =~ s\/home/foster/public_html\~foster\;
    print "<h2>All output is in <a \"href=http://gosset.wharton.upenn.edu/".$current_dir.">this directory</a>.</h2><p>\n";
    print "<p>Note: you can bookmark / email the above link.  It will stay for a long time.\n";
    print "<h1>Raw output</h1>\n";

# Pretty output

    print "<h1>The regression output</h1>\n";
    print "<p><h2>C++ output to file file: $output</h2><p>\n";
    while(<TMP>) {print ; print "<br>";};
    close(TMP);

    print "<h1>Log of run</h1>\n";
    $pretty_output = "latest_pretty";
    open(TMP1,"<$pretty_output") || die "can't open";
    while(<TMP1>) {print ; print "<br>";};
    close(TMP1);

}


