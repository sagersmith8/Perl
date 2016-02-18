
($sum, $result) = (0,0);
$listlen = <STDIN>;
if ( ($listlen >0) && ($listlen < 100)) {
 for ($counter = 0;  $counter < $listlen; $counter++) {
    $intlist[$counter] = <STDIN>;
    $sum = $sum + $intlist[$counter];
  }
 $average = $sum / $listlen;
 print "Average of these $listlen values is $average \n";
}
