$/=">";
open(IN,"F:\\VQ.aa.fa");
open(OUT,">F:\\VQ.aa.length.txt");
while($line=<IN>){
	chomp $line; 
	@a=split(/\n/,$line,2);
	$name=$a[0];
	$name=~s/\s+//;
	$a[1]=~s/\n//g;
	$seq=$a[1];
	$length=length$seq;
	if ($length <= 300) {
		$b++;
	}
	if ($length <= 400) {
		$c++;
	}
	if ($length <= 500) {
		$d++;
	}
	if ($length <= 600) {
		$e++;
	}
	$total++;
	print OUT "$name\t$length\n";
}
$rate1=100 * sprintf "%0.2f",($b/$total);
$rate2=100 * sprintf "%0.2f",($c/$total);
$rate3=100 * sprintf "%0.2f",($d/$total);
$rate4=100 * sprintf "%0.2f",($e/$total);
print OUT "length < 300 rate is $rate1%\nlength < 400 rate is $rate2%\nlength < 500 rate is $rate3%\nlength < 600 rate is $rate4%\n";