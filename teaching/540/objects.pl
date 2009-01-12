sub type_id{
    my $glob = shift;
    print 'type is: ' , *{$glob}{PACKAGE}, "\n";
    print 'name is: ' , *{$glob}{NAME}, "\n";
}

sub foo::print{
    print 'printing a foo',"\n";
}

sub bar::print{
    print 'printing a bar',"\n";
}

sub foosubclass::print
{
    print 'printing a foosubclass',"\n";
}

sub bar::new
{
    bless {},"bar";
}

require "my_obj.pm";

$foo::bar = 7;
$ref = \*foo::bar;
type_id(*foo::bar);
type_id($ref);
$bar = 8;
type_id(*bar);

$ref2 =new bar::;
bless($ref,"foo");
$ref -> print;
$ref2 -> print;
{
package foosubclass;
@ISA = "foo";

$subobj = 10;
$ref3 = \*subobj;
bless($ref3,"foosubclass");
$ref3 -> print;
}
{
@barsubclass::ISA = "bar";

$subobj = 10;
$ref3 = \*subobj;
bless($ref3,"barsubclass");
$ref3 -> print;
}
{
$ref3 = my_obj->new;
$ref3 -> print;
}
