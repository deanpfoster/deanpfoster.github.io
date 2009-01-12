#!/usr/bin/perl

{
    use CGI qw(:standard :html3);
    $q = new CGI;
    my $fh = $q->upload("file");

    use IPC::Open2;
    local(*Reader, *Writer);
    $pid = open2(\*Reader, \*Writer, "gnuplot");

    # send information to gnuplot
    print Writer "set terminal png\n";
#    print Writer "plot sin(1/x)";
    print Writer "plot '-'";
#    print Writer while <$fh>;
    print "3 4";
    close(Writer);
    # get results from gnu plot
    open(GIF,">./tmp.png");
    print GIF while(<Reader>);
    waitpid($pid,0);

    print $q->header;
    print "Hello!<p>";
    print '<IMG SRC="./tmp.png">';
}



