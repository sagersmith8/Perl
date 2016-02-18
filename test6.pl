print "enter your name ";
chomp($name=<STDIN>);
print "enter your age ";
chomp($age=<STDIN>);
open(OUTPUT, ">data");
print OUTPUT "Your name is $name\n";
print OUTPUT "Your age is $age";

