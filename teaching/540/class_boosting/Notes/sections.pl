# LaTeX2HTML 96.1 (Feb 5, 1996)
# Associate sections original text with physical files.

$key = q/section_info/;
${$key} = '' unless (${$key}); 
$done{""} = 1;
$key = q/0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0/;
${$key} = '0%:%class08.html%:%Class 8 Stat 540 Spring 1999' unless (${$key}); 
$done{"class08.html"} = 1;
$key = q/0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0/;
${$key} = '3%:%node1.html%:%Optimization in S-Plus and R' unless (${$key}); 
$done{"node1.html"} = 1;
$key = q/0 0 0 2 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0/;
${$key} = '3%:%node2.html%:%Where to find additional code' unless (${$key}); 
$done{"node2.html"} = 1;
$key = q/0 0 0 3 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0/;
${$key} = '3%:%node3.html%:%A look at Boosting' unless (${$key}); 
$done{"node3.html"} = 1;

1;

