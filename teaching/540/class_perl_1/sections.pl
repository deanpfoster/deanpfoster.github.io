# LaTeX2HTML 96.1 (Feb 5, 1996)
# Associate sections original text with physical files.

$key = q/section_info/;
${$key} = '' unless (${$key}); 
$done{""} = 1;
$key = q/0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0/;
${$key} = '0%:%class02.html%:%No Title' unless (${$key}); 
$done{"class02.html"} = 1;
$key = q/0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0/;
${$key} = '4%:%node1.html%:%Operations on scalars' unless (${$key}); 
$done{"node1.html"} = 1;
$key = q/0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0/;
${$key} = '3%:%node3.html%:%Control structures' unless (${$key}); 
$done{"node3.html"} = 1;
$key = q/0 0 0 0 2 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0/;
${$key} = '4%:%node2.html%:%Pulling scalars out of lists and hashes' unless (${$key}); 
$done{"node2.html"} = 1;
$key = q/0 0 0 1 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0/;
${$key} = '4%:%node4.html%:%The <TT>for</TT> and <TT>if</TT> statements' unless (${$key}); 
$done{"node4.html"} = 1;
$key = q/0 0 0 2 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0/;
${$key} = '3%:%node6.html%:%Subroutines' unless (${$key}); 
$done{"node6.html"} = 1;
$key = q/0 0 0 1 2 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0/;
${$key} = '4%:%node5.html%:%The <TT>foreach</TT>  statements' unless (${$key}); 
$done{"node5.html"} = 1;

1;

