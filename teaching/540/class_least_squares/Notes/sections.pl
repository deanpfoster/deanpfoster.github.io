# LaTeX2HTML 96.1 (Feb 5, 1996)
# Associate sections original text with physical files.

$key = q/section_info/;
${$key} = '' unless (${$key}); 
$done{""} = 1;
$key = q/0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0/;
${$key} = '0%:%class04.html%:%Class 4 Stat 540 Spring 1999' unless (${$key}); 
$done{"class04.html"} = 1;
$key = q/0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0/;
${$key} = '3%:%node1.html%:%Solving least squares equations - the QR decomposition.' unless (${$key}); 
$done{"node1.html"} = 1;

1;

