######################################### 	
#    CSCI 305 - Programming Lab #1		
#										
#  < Sage Smith >			
#  < sagersmith8@gmail.com >
#  < Sam Shissler >
#  < samshissler@gmail.com >			
#										
#########################################

# Replace the string value of the following variable with your names.

my $name = "Sam Shissler";
my $partner = "Sage Smith";
print "CSCI 305 Lab 1 submitted by $name and $partner.\n\n";

# Checks for the argument, fail if none given
if($#ARGV != 0) {
    print STDERR "You must specify the file name as the argument.\n";
    exit 4;
}

# Opens the file and assign it to handle INFILE
open(INFILE, $ARGV[0]) or die "Cannot open $ARGV[0]: $!.\n";


# YOUR VARIABLE DEFINITIONS HERE...

# This loops through each line of the file
$numEnglish = 0;
$numForeign = 0;
$numTitles = 0;
%titles = ();
$love = 0;

while($line = <INFILE>) {

	# This prints each line. You will not want to keep this line.

	# YOUR CODE BELOW.
    $numTitles++;
    if($line =~ /.+<SEP>.+<SEP>.+<SEP>(.+)/g){
	$title = $1;
	$title =~ s/\[.*//g;
	$title =~ s/\(.*//g;
	$title =~ s/\{.*//g;
	$title =~ s/\\.*//g;
	$title =~ s/\-.*//g;
	$title =~ s/:.*//g;
	$title =~ s/\".*//g;
	$title =~ s/`.*//g;
	$title =~ s/\+.*//g;
	$title =~ s/=.*//g;
	$title =~ s/\*.*//g;
	$title =~ s/´.*//g;
	$title =~ s/feat\..*//g;
	$title =~ s/_.*//g;
	$title =~ s/[^'\s\w[:^ascii:]]//g;
	$title = lc($title);

	if($title =~ m/[^[:ascii:]]/){
	    $numForeign++;
	   # print "Non-English: $title\n";
	}else{
	    $numEnglish++;
	    @words = split(" ",$title);
	    for my $i (1 .. $#words){
		if(exists $hash{$words[$i-1]}{$words[$i]}){
		    $hash{$words[$i-1]}{$words[$i]}++;
		}else{
		    $hash{$words[$i-1]}{$words[$i]}=1;
		}
	    }
	}	
    }
    
}

# Close the file handle
close INFILE; 

# At this point (hopefully) you will have finished processing the song 
# title file and have populated your data structure of bigram counts.
print "File parsed. Bigram model built.\n\n";


# User control loop
print "Enter a word [Enter 'q' to quit]:\n\n";
$input = <STDIN>;
chomp($input);
$current_string = "";	

while ($input ne "q"){
    $count = 0;
    $current_string = $input;
    $temp = $input;
    $follow = "";

    while(($follow = mcw($temp)) ne "NULL" and 20 > $count++){
	$current_string = "$current_string $follow";
	$temp = $follow;
    }
    
    print "$current_string\n\n";
    $input = <STDIN>;
    chomp($input);
}

sub unique_words{
    if(!exists $hash{@_[0]}){
	return 0;
    }

    @array=keys($hash{@_[0]});
    $size=$#array+1;
    return $size;
}

sub mcw{
    if(!exists $hash{@_[0]}){
	return "NULL";
    }

    $mcw_key = "";
    foreach my $key (keys $hash{@_[0]}){
	if($key ne "a" and $key ne "an" and $key ne "and" and $key ne "by" and $key ne "for" and $key ne "from" and $key ne "in" and $key ne "of" and $key ne "on" and $key ne "or" and $key ne "out" and $key ne "the" and $key ne "to" and $key ne "with" and index($current_string, $key) == -1){
	    if($hash{@_[0]}{$key} > $hash{@_[0]}{$mcw_key}){
		$mcw_key = $key; 
	    }elsif($hash{@_[0]}{$key} == $hash{@_[0]}{$mcw_key}){
		if(rand() >= .5){
		    $mcw_key = $key;
		}
	    }
	}
    }
    return "$mcw_key";
}
