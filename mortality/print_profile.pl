# print_profile.pl


sub print_profile

{
    local(%profile) = @_;

    print "<p>\n";
    print "<TABLE>\n";

    local($key);
    foreach $key (keys (%profile))
    {
	print "<TR><TD>",$key,"</TD><TD>",$profile{$key},"</TD></TR>\n";
    };

    print "</TABLE>\n";
    print "</p>\n";
};

1
