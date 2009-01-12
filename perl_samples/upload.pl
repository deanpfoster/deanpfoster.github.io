#!/usr/bin/perl
{
    use CGI qw(:standard :html3);
    $q = new CGI;
    my $fh = $q->upload("file");
    print $q->header;
    print while <$fh>;
}

