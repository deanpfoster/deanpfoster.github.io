# save_state.pl


sub save_state

{
    local(%profile) = @_;

    local($key);
    foreach $key (keys (%profile))
    {
	print '<INPUT TYPE="hidden" NAME="',$key,'" VALUE="',$profile{$key},'">',"\n";
    };
};

1

