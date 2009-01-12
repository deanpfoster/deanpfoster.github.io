# LaTeX2HTML 96.1 (Feb 5, 1996)
# Associate sections original text with physical files.

$key = q/section_info/;
${$key} = '' unless (${$key}); 
$done{""} = 1;
$key = q/0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0/;
${$key} = '0%:%class03.html%:%Class 3 Stat 540 Spring 1999' unless (${$key}); 
$done{"class03.html"} = 1;
$key = q/0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0/;
${$key} = '3%:%node1.html%:%Random number generators' unless (${$key}); 
$done{"node1.html"} = 1;
$key = q/0 0 0 2 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0/;
${$key} = '3%:%node2.html%:%Reading from, and writing to files' unless (${$key}); 
$done{"node2.html"} = 1;
$key = q/0 0 0 3 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0/;
${$key} = '3%:%node3.html%:%Saving state' unless (${$key}); 
$done{"node3.html"} = 1;
$key = q/0 0 0 4 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0/;
${$key} = '3%:%node4.html%:%Using <TT>mod CGI</TT>' unless (${$key}); 
$done{"node4.html"} = 1;
$key = q/0 0 0 5 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0/;
${$key} = '3%:%node5.html%:%Mastermind program' unless (${$key}); 
$done{"node5.html"} = 1;

1;

