#!/usr/bin/perl

{

####################################################################
#    GET THE DATA TO BE PROCESSED
#
    use CGI qw(:standard :html3);
    $q = new CGI;
    my $fh = $q->upload("file");
    $user_file_name = $q->param('file');

#    open(fh,"data") || die "can't open";  #debug version
####################################################################


    use Time::HiRes qw(gettimeofday tv_interval);
    my $start_time = [ gettimeofday ];



####################################################################
#
#    COPY IT TO A LOCAL COPY
#
    $random = int(rand(9999));
    $prefix = "./tmp/". $user_file_name . "_" . $random . "/";
    mkdir $prefix;
    mkdir $prefix . "log";
    $data = $prefix . "data";
    $model = $prefix . "model";
    open(TMP,">$data") || die "can't open";
    print TMP while <$fh>;
    close(TMP);
#
####################################################################


####################################################################
#
#    SHOVE IT OVER TO C++
#
    use IPC::Open2;
    use IPC::Open3;
    local(*Reader, *Writer,*Error);
#    $pid = open2(\*Reader, \*Writer, "./csv_parser --input-file ".$data." --output-file  ".$model);   
    $pid = open3(\*Writer, \*Reader, \*Error, "./csv_parser --input-file ".$data." --output-file  ".$model);   
    waitpid($pid,0);
    chdir($prefix);
    local(*Reader2, *Writer2, *Error2);
#    $pid2 = open2(\*Reader2, \*Writer2, "../../build_model --input-file model --output-path log/ -r 100");
    $pid2 = open3(\*Writer2, \*Reader2, \*Error2, "../../build_model --input-file model --output-path log/ -r 20000");
#    waitpid($pid2,0);

# add a '-v 1' if you want a indicator function in the first column
#        build_model --input-file model.dat --output-path log/ -r 800 -v 1


####################################################################
#
#  RETURN THE C++ OUTPUT TO THE SYSTEM
    
    print $q->header;
    
    print "<h1>Fitted model as a CSV file</h1>\n";
    print "<a href=\"".$prefix."log/auction.model.txt\">Fitted model</a>";

    print "<h1>CPU TIME</h1>\n";
    my $end_time = [ gettimeofday ];
    my $cpu_time = tv_interval($start_time,$end_time);
    print "CPU TIME: $cpu_time seconds\n";

    print "<h1>Pretty Output</h1>\n";



# Pretty output

    $output = "log/auction.model.pretty_print";
    print "<p><h2>C++ output to file file: $output</h2><p>\n";
    open(TMP,"<$output") || die "can't open";
    while(<TMP>) {print ; print "<br>";};
    close(TMP);

# Echo'ing std::cout back to user

    print "<p><h2>C++ standard output:</h2><p>\n";
    while(<Reader>) {print ; print "<br>";};


# Echo'ing the two input files

#    print "<p><h2>Input from file (".$q->remote_addr()."::$file_name  or local::$data)</h2>\n<p>\n";
#    open(TMP,"<$data") || die "can't open";
#    while(<TMP>) {print ; print "<br>";};
#    close(TMP);


#
####################################################################
}


