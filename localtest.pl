
$x=10;
$y=20;

sub first
{
print "inside first: $x, $y\n";
print 'create local vars: $x and $y', "\n";
local($x,$y)=(100,200);
print "after creating local vars: $x, $y\n";
print "call second\n";
second();
print "return from second: $x, $y\n";
}

sub second
{
print "inside second: $x, $y\n";
print "adding 1 inside second\n";
$x++;
$y++;
third();
}

sub third
{
print "inside third: $x, $y\n";
print "adding 1 inside third\n";
$x++;
$y++;
}

print "before function calls: $x, $y\n";
first();
print "after function calls: $x, $y\n";
