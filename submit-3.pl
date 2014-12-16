#combination with 1 and 2 and (1,2)

use strict;

open IN,"<","test-score.txt" or die;

my $output = "submit-3-out.csv";

open FH,">$output";

my $line;

$line=<IN>;
my %hash1;

my %hash12;

my @arr;
print FH "id,rank\n";

while($line=<IN>)
{
	chomp($line);
	 @arr = split(/\s+/, $line);
	if($arr[0] eq "2")
	{
		$hash1{$arr[1]}=$hash1{$arr[1]} + (0.8954/(0.7394+0.8954))*$arr[2];
		$hash12{$arr[1]} = ($hash12{$arr[1]}+$arr[2])/2;
	}
	elsif($arr[0] eq "1")
	{
		$hash1{$arr[1]}=(0.7394/(0.7394+0.8954))*$arr[2];
		$hash12{$arr[1]} = $arr[2];
	}


}# read in data end

my $rank=0;

foreach my $key(keys %hash1)
{
	$rank = ((0.7394+0.8954)/(0.7394+0.8954+0.8620))*$hash1{$key}+(0.8620/(0.7394+0.8954+0.8620))*$hash12{$key};
	print FH $key.",".$hash1{$key}."\n";
}


close(IN);
close(FH);