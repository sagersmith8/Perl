
sub totals
{
 my($sum) =0;
 foreach $item (@_)
 {
  $sum += $item;
 }
 $sum;
}

print "Enter a list of values: ";
$_ = <STDIN>;
@data = split;
print "sum of @data is ", totals(@data), "\n"; 

