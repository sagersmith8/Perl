while (1)
{
   print "Enter an expression (or end to exit): ";
   chomp($exp = <STDIN>);
   if ($exp eq "end")
   {
      exit(0);
   }
   print eval($exp), "\n";
}
