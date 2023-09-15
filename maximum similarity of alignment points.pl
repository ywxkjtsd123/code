$/=">";
open(IN,"F:\\out.fa");
open(OUT,">F:\\result.txt");
while($line=<IN>){
	chomp;
	@a=split(/\n/,$line,2);
	$name=$a[0];
	$a[1]=~s/\n//g;
	$seq=$a[1];
	@b=split(//,$seq);
	$length=@b;
	for ($i=0;$i<$length;$i++) {
		if($b[$i]=~/[A-Z]/i){
			$m="L".$i;
			$$i{$b[$i]}++;
			$$m{$b[$i]}=($$i{$b[$i]})/2469;
		}
	}
}
for ($i=0;$i<$length;$i++) {
	$m="L".$i;
	foreach $key (keys %$m) {
		if ($$m{$key}) {
			print OUT "$$m{$key}\t";
		}
	}
	print OUT "\n";
}
close IN;
close OUT;


$/="\n";
open(IN1,"F:\\result.txt");
open(OUT1,">F:\\result-1.txt");
while($line=<IN1>){
	chomp;
	$max=0;
	$key=0;
	@t=split(/\t/,$line);
	foreach $key (@t) {
		if($key>$max){$max=$key}
	}
	print OUT1 "$max\n";
}
close IN1;
close OUT1;