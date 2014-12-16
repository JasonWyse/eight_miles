#use the second terms score to submit

use strict;

open IN,"<","test-score.txt" or die;

my $output = "submit-1-out.csv";

open FH,">$output";

my $line;

$line=<IN>;
my %hash1;

my %hash2;
my @arr;
print FH "id,rank\n";

while($line=<IN>)
{
	chomp($line);
	 @arr = split(/\s+/, $line);
	if($arr[0] eq "2")
	{
		print FH $arr[1].",".$arr[2]."\n";
	}

}# read in data end

close(IN);
close(FH);