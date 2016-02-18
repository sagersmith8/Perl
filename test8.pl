
print "Enter a file name: ";
chomp($filename = <STDIN>);
open(INPUT, "$filename");
print "Enter a line I should display: ";
$num = <STDIN>;
$i = 0;
while ($i < $num)
{
  $i = $i +1;
  $line = <INPUT>;
#  print "$i \t $line";
}
  print "$i \t $line";
