
while ($line = <STDIN>, $line ne "quit\n")
{
 chomp($line);
 print "$line matches tele\n" if ($line =~ /tele/ );
 print "$line matches MSU at front\n" if ( $line =~ /^MsU/ );
 print "$line matches MSU at end\n" if ( $line =~ /MsU$/ );
 print "$line matches MSU at end\n" if ( $line =~ /MsU$/i );
 print "$line matches A**Z\n" if ( $line =~ /A[0-9][a-z]Z/ );
 print "$line matches integer\n" if ( $line =~ /^[+-]?\d+$/ );
 print "$line matches a longest string\n" if ( $line =~ /[0-9].*[a-z]/ );
 print "area code for $1 is $2 \n" if ( $line =~ /((\d\d\d)-\d\d\d-\d\d\d\d)\D/ );
}

