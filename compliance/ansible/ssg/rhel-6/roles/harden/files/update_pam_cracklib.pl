#!/usr/bin/perl -pi

if ( /pam_cracklib.so/ ) {
	my $line = $_;
	chomp $line;
	foreach $item ( ('dcredit=-1','ucredit=-1','ocredit=-1','lcredit=-1','difok=4') ) {
		if ( not /$item/ ) {
			$line = "$line $item";
		}
	}
	$_ = $line."\n";
}

