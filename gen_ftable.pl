#!/usr/bin/perl -wT

use Getopt::Long;

my $mbase = 69;   # A4
my $mfreq = 440;

Getopt::Long::Configure("bundling", "auto_help");

GetOptions("base|b=i", \$mbase,
		"base-freq|f=i", \$mfreq);

my @note_names = ( "c", "cs", "d", "ds", "e", "f", "fs", "g", "gs", "a", "as", "b" );
my @note_map = ( );

my $gmcscale = 4000000 / 2;

for my $m (64..127,0..63) {
	my $freq = (2 ** (($m - $mbase) / 12)) * $mfreq;
	my $regval = $gmcscale / $freq;
	while ($regval >= 16383.5) {
		$regval *= 0.5;
	}
	if ($m >= 12) {
		my $o = int(($m - 12) / 12);
		my $ni = $m % 12;
		my $name = "$note_names[$ni]$o";
		push @note_map, [ $name, $m|0x80 ];
		printf "f_$name\tequ\t%u\n", $regval + 0.5;
		print "\tfdb\tf_$name\n";
	} else {
		printf "\tfdb\t%u\n", $regval + 0.5;
	}
}
print "\n";

for (@note_map) {
	print "$_->[0]\tequ\t$_->[1]\n";
}

__END__

=head1 gen_ftable.pl

gen_ftable.pl - Generate a GMC frequency lookup table for CyD

=head1 SYNOPSIS

gen_ftable.pl [OPTION]...

 Options:
  -b, --base N         note base [69]
  -f, --base-freq HZ   frequency at note base [440]

=cut
