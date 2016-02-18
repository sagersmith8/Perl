
print "Enter a file name: ";
chomp($filename = <STDIN>);
open(INPUT, "$filename");
$num = 1;
while ($line = <INPUT>)
{
  print"$num\t $line";
  $num = $num +1;
}
