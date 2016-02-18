
$test = "Java is inferior";
substr($test, 8, 5) = "super";
print "$test\n";
substr($test, 0, 4) = "Perl";
print "$test\n";
substr($test, 0, 0) = "my mine: ";
print "$test\n";

print "Enter a string: ";
$string = <STDIN>;
print "LOWER CASE: ", lc($string);
print "FIRST CHAR: ", lcfirst($string), "\n";
print "UPPER CASE: ", uc($string);
print "FIRST CHAR: ", ucfirst($string), "\n";
