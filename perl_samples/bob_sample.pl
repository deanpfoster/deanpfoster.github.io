#!/usr/bin/perl

{

####################################################################33
#    GET THE DATA TO BE PROCESSED
#
    use CGI qw(:standard :html3);
    $q = new CGI;
    my $fh = $q->upload("file");
    $user_file_name = $q->param('file');

#    open(fh,"data") || die "can't open";  #debug version
####################################################################33


####################################################################33
#
#    COPY IT TO A LOCAL COPY
#
    $random = int(rand(999));
    $data = "./tmp/". $user_file_name . "_" . $random . ".data";
    $output = "./tmp/" . $user_file_name . "_" . $random . ".output";
    open(TMP,">$data") || die "can't open";
    print TMP while <$fh>;
    close(TMP);
#
####################################################################33


####################################################################33
#
#    SHOVE IT OVER TO C++
#
    use IPC::Open2;
    local(*Reader, *Writer);
    $pid = open2(\*Reader, \*Writer, "./bob_sample ".$data." ".$output);   
    waitpid($pid,0);

####################################################################33
#
#  RETURN THE C++ OUTPUT TO THE SYSTEM
    
    print $q->header;
    
    print "<h1>Output</h1>\n";


#  Echo'ing file names that were read in

    $file_name = $q->param('file');
    $names_name = $q->param('names');
    print "Files uploaded:<br> " . $file_name . "<br>" . $names_name . "<br>";


# Echo'ing std::cout back to user

    print "<p><h2>C++ standard output:</h2><p>\n";
    while(<Reader>) {print ; print "<br>";};

# Echo'ing the file that was read

    print "<p><h2>C++ output to file file: $output</h2><p>\n";
    open(TMP,"<$output") || die "can't open";
    while(<TMP>) {print ; print "<br>";};
    close(TMP);

# Echo'ing the two input files

    print "<p><h2>Input from file (".$q->remote_addr()."::$file_name  or local::$data)</h2>\n<p>\n";
    open(TMP,"<$data") || die "can't open";
    while(<TMP>) {print ; print "<br>";};
    close(TMP);


    print "<p><h2>Names input file: $names_file</h2>\n<p>\n";
    my $names_file = $q->upload("names");
    while(<$names_file>) {print ; print "<br>";};

#
####################################################################33
}


