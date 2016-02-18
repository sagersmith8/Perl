#foreach $item (a..z, A..Z)
#{
#   print "$item";
#}

print "Enter a string: ";
chomp($string = <STDIN>);
print "Enter a repeat factor: ";
chomp($thismany = <STDIN>);
$result = $string x $thismany;
print "($string) repeated ($thismany) times is ($result)\n";

while ($lins = <STDIN>, $lins ne "quit\n")
{
 chomp($lins);
 $tot1 = $tot1 . $lins . "NN";
}
print length($tot1), "\n";
print "$tot1\n";

