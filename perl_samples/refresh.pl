#!/usr/bin/perl

{
    use CGI qw(:standard :html3);
    $q = new CGI;

####################################################################
#
#  RETURN THE C++ OUTPUT TO THE SYSTEM
    
    print $q->header;

#     print "<html>\n";
#     print "<head>\n";
#     print "<script src=\"canvastext.js\"></script>\n";
#     print  " <script src=\"gnuplot_common.js\"></script>\n";
#     print "</head>\n";
#     print "<body onload=\"progress_plot();\">\n";
#     print "<script src=\"progress_plot.js\"></script>\n";
#     print "<canvas id=\"progress_plot\" width=600 height=400>\n";
#     print "<div id=\"err_msg\">No support for HTML 5 canvas element</div>\n";
#     print "</canvas>\n";

    use Cwd;
    $current_dir = &Cwd::cwd();
    $output = "log/model.html";
    if(-e $output)
    {
	open(TMP,"<$output") || die "can't open";
    }
    else
    {
	print "<META HTTP-EQUIV=\"Refresh\" CONTENT=\"1; URL=http:./refresh.pl\">";
	print "You output is not ready yet";
	print "Lots of output will appear below when the run is complete.";
    }
    
    print "<h1>DONE!</h1>\n";

    print "<h2><a href=\"log/model_data.csv\">data table from fitted model</a></h2>";
    print "<h2><a href=\"log/progress.csv\">log of run</a></h2>";

    use Cwd;
    $current_dir = &Cwd::cwd();
    $current_dir =~ s\/home/foster/public_html\~foster\;
    print "<h2>All output is in <a \"href=http://gosset.wharton.upenn.edu/".$current_dir.">this directory</a>.</h2><p>\n";
    print "<p>If our code does something weird, send us the above link and we can investigate it.\n";
    print "<p>Note: you can bookmark / email the above link.  It will stay for a long time.\n";



    print "<IMG SRC=\"progress_plot.gif\">";
    print "<h1>Summary of fit</h1>\n";

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


