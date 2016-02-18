
sub header
{
print "inside sub: before change: $message\n";
$message = " A new message";
print "inside sub: after change: $message\n";
}
$message = " The original message";
print "message: befor sub: $message\n";
header();
print "message: after sub: $message\n";
