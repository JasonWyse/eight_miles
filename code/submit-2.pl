use strict;

open IN,"<","test-score.txt" or die;

my $output = "submit-2-out.csv";

open FH,">$output";

my $line;

$line=<IN>;
my %hash1;

my @arr;
print FH "id,rank\n";

while($line=<IN>)
{
	chomp($line);
	 @arr = split(/\s+/, $line);
	if($arr[0] eq "2")
	{
		$hash1{$arr[1]}=$hash1{$arr[1]} + (0.8954/(0.7394+0.8954))*$arr[2];
	}
	elsif($arr[0] eq "1")
	{
		$hash1{$arr[1]}=(0.7394/(0.7394+0.8954))*$arr[2];
	}

}# read in data end

foreach my $key(keys %hash1)
{
	print FH $key.",".$hash1{$key}."\n";
}


close(IN);
close(FH);