#!/usr/bin/perl -n

if ( /pam_cracklib.so/ ) {
	foreach $item ( ('dcredit=-1','ucredit=-1','ocredit=-1','lcredit=-1','difok=4') ) {
		/$item/ or exit 1;
	}
}

