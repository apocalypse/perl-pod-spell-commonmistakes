#!/usr/bin/perl
use strict; use warnings;

use Pod::Spell::CommonMistakes qw( check_pod );

my $file = $ARGV[0] || 'lib/Pod/Spell/CommonMistakes.pm';
my $result = check_pod( $file );
if ( keys %$result == 0 ) {
	print "File passed tests!\n";
} else {
	print "File failed tests!\n";
	foreach my $k ( keys %$result ) {
		print " Found: '$k' - Possible spelling: '$result->{$k}'?\n";
	}
}
