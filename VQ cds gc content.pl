$/=">";
open(IN,"F:\\VQ.cds.fa");
open(OUT,">F:\\VQ.cds.gc.txt");
while ($line=<IN>) {
	chomp $line; 
	@t=split(/\n/,$line,2);
	$name=$t[0];
	$t[1]=~s/\n//g;
	$seq=$t[1];
	$length=length $seq;
	$GC=$seq=~s/G|C//ig;
	$rate=int(100*$GC/$length) if($GC && $length);
	print OUT "$name\t$rate\n" if($name && $seq);
}
close IN;
close OUT;
