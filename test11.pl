$x=open(FILE, "myfile");
if ($x==1)
{
print "success, do sth\n";
}
else
{
print "SYSTEM ERROR IS -> $!\n";
die "program terminated\n";
}
