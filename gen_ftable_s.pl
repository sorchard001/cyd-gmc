#!/usr/bin/perl -wT

use Getopt::Long;

my $cpu_freq = 14318180 / 16;
my $mixer_cyc = 71;

my $mbase = 69;   # A4
my $mfreq = 440;

Getopt::Long::Configure("bundling", "auto_help");

GetOptions("cycles|c=i" => \$mixer_cyc,
		"base|b=i", \$mbase,
		"base-freq|f=i", \$mfreq);

my @note_names = ( "c", "cs", "d", "ds", "e", "f", "fs", "g", "gs", "a", "as", "b" );
my @note_map = ( );

my $fscale = 65536 * $mixer_cyc / $cpu_freq;
my $fadjust = "1b / (1 + (1b >= \$8000))";

for my $m (64..127,0..63) {
	my $freq = (2 ** (($m - $mbase) / 12)) * $mfreq;
	my $f = $fscale * $freq;
	if ($m >= 12 && $f < 0x8000) {
		my $o = int(($m - 12) / 12);
		my $ni = $m % 12;
		my $name = "$note_names[$ni]$o";
		#push @note_map, [ $name, $m|0x80 ];
		printf "fs_$name\tequ\t%u\n", int($f+0.5);
		print "\tfdb\tfs_$name\n";
	} else {
		while ($f >= 0x8000) {
			$f /= 2;
		}
		printf "\tfdb\t%u\n", int($f+0.5);
	}
}
#print "\n";

#for (@note_map) {
#	print "$_->[0]\tequ\t$_->[1]\n";
#}

__END__

=head1 gen_ftable.pl

gen_ftable.pl - Generate a frequency lookup table for CyD

=head1 SYNOPSIS

gen_ftable.pl [OPTION]...

 Options:
  -c, --cycles C       mixer loop takes C cycles [71]
  -b, --base N         note base [69]
  -f, --base-freq HZ   frequency at note base [440]

=cut
