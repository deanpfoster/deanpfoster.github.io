package my_obj;

sub new
{
    my $self = {};
    bless $self, "my_obj";
    return $self;
}

sub my_obj::print{
    print 'printing a my_obj',"\n";
}


1;
