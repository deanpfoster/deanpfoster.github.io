# LaTeX2HTML 96.1 (Feb 5, 1996)
# Associate sections original text with physical files.

$key = q/section_info/;
${$key} = '' unless (${$key}); 
$done{""} = 1;
$key = q/0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0/;
${$key} = '0%:%class01.html%:%No Title' unless (${$key}); 
$done{"class01.html"} = 1;
$key = q/0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0/;
${$key} = '3%:%node1.html%:%Writing a page for display on the WEB.' unless (${$key}); 
$done{"node1.html"} = 1;
$key = q/0 0 0 2 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0/;
${$key} = '3%:%node2.html%:%Serving up a WEB page.' unless (${$key}); 
$done{"node2.html"} = 1;
$key = q/0 0 0 3 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0/;
${$key} = '3%:%node3.html%:%Interacting with the page' unless (${$key}); 
$done{"node3.html"} = 1;
$key = q/0 0 0 4 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0/;
${$key} = '3%:%node4.html%:%CGI' unless (${$key}); 
$done{"node4.html"} = 1;
$key = q/0 0 0 5 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0/;
${$key} = '3%:%node5.html%:%Perl' unless (${$key}); 
$done{"node5.html"} = 1;

1;

