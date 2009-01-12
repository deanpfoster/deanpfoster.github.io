#!/usr/bin/perl

### Absolutely vital to put full path names to all files and commands.


### The modules we will use here.

use CGI qw(:standard :html3);
use LWP::UserAgent;


$q = new CGI;

### This is the url for the data we are going to fetch.
### In general, this will be provided as an input to the interface page.

$url = "./data.txt";

### This sequence of commands  is enough to collect the data.
### We will spend more time on LWP later.

$agent = new LWP::UserAgent;
$agent->agent("Mozilla/4.02"); ### Clingon cloaking device.
$agent->timeout(30);
$request = new HTTP::Request('GET', $url);
$response = $agent->request($request);


### These commands will take teh collected data and save to a file.

open DATA, ">./data.txt";
select DATA;
print $response->content;
close DATA;
select STDOUT;



### Here we run R (full path names needed, nobody knows nothing).

#system("/usr/local/bin/R --vanilla < /home/waterman/public_html/cgi-bin/nets.q > /home/waterman/public_html/cgi-bin/garbage.txt");
#system("ls");

### Going to return some HTML now.

print $q->header;

open OUTPUT, "out.txt";
while(<OUTPUT>){
    print;
}

close OUTPUT;


print "Returned OK";
