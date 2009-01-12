# LaTeX2HTML 96.1 (Feb 5, 1996)
# Associate sections original text with physical files.

$key = q/section_info/;
${$key} = '' unless (${$key}); 
$done{""} = 1;
$key = q/0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0/;
${$key} = '0%:%class07.html%:%Class 7 Stat 540 Spring 1999' unless (${$key}); 
$done{"class07.html"} = 1;
$key = q/0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0/;
${$key} = '3%:%node1.html%:%Discussion of the last homework' unless (${$key}); 
$done{"node1.html"} = 1;
$key = q/0 0 0 2 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0/;
${$key} = '3%:%node2.html%:%An algorithm for the nets' unless (${$key}); 
$done{"node2.html"} = 1;

1;

