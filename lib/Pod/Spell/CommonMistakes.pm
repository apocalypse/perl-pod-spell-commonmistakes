package Pod::Spell::CommonMistakes;

# ABSTRACT: Catches common typos in POD

# Import the modules we need
use Pod::Spell::CommonMistakes::WordList qw( _check_case _check_common );
use Pod::Spell 1.01;
use IO::Scalar 2.110;

# auto-export our 2 subs
use base qw( Exporter );
our @EXPORT_OK = qw( check_pod check_pod_case check_pod_all );

=method check_pod( $filename )

This function is what you will usually run. It will run the spell checks against the POD in $filename. Warning: you would need to catch any
exceptions thrown from this function!

It returns a hashref of misspelled words and their suggested spelling. If the hash is empty then there is no errors in the POD.

=cut

sub check_pod {
	my $pod = shift;

	# Start our parse run!
	my $words = _parse( $pod );
	return _check_common( $words );
}

=method check_pod_case( $filename )

This function behaves the same as L</check_pod( $filename )> but it uses a "case" wordlist instead. The difference is that this wordlist
will make sure you capitalize common terms properly. One example is: OpenLdap => OpenLDAP.

NOTE: This does NOT run the same checks as L</check_pod( $filename )>! You would need to use the L</check_pod_all( $filename )> function.

=cut

sub check_pod_case {
	my $pod = shift;

	# Start our parse run!
	my $words = _parse( $pod );
	return _check_case( $words );
}

=method check_pod_all( $filename )

This function behaves the same as L</check_pod( $filename )> but it runs all the extra checks too. Currently it's just the case wordlist
but others might be added in the future...

=cut

sub check_pod_all {
	my $pod = shift;

	# Start our parse run!
	my $words = _parse( $pod );

	# Holds the failures we saw
	my $err = _check_common( $words );
	$err = { %$err, %{ _check_case( $words ) } };
	return $err;
}

sub _parse {
	my $pod = shift;

	# TODO if pod is a file, load it - if it's a scalar or a FH or...?

	# Parse the POD!
	my $parser = Pod::Spell->new;
	my $output = '';
	my $out_fh = IO::Scalar->new( \$output );
	$parser->parse_from_file( $pod, $out_fh );

	# Did we see POD in the file?
	if ( length $output ) {
		my @words = split( /\s+/, $output );
		return \@words;
	} else {
		# Ah no POD, we simply return an empty list
		return [];
	}
}

1;

=pod

=for stopwords OpenLDAP OpenLdap spellchecker wordlist wordlists Lintian

=head1 SYNOPSIS

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

=head1 DESCRIPTION

This module looks for any typos in your POD. It differs from L<Pod::Spell> or L<Test::Spelling> because it uses a custom wordlist and doesn't
use the system spellchecker. The idea for this came from the L<http://wiki.debian.org/Teams/Lintian> code in Debian, thanks!

To use this, just pass it a filename that has POD in it and you'll get a hashref back. If the hashref is empty that means the checker found
no misspelled words. If it contains keys, then the keys are the bad words and the values are the suggested spelling.

=head1 EXPORT

You would need to manually get the function you want.

=head1 SEE ALSO
Pod::Spell
Test::Pod::Spelling::CommonMistakes

=head1 ACKNOWLEDGEMENTS

Props goes out to jawnsy@irc for pointing out a spelling mistake in POE, which prompted me to write this.

B<THANKS> goes out to the Debian Lintian code, as it was a great starting place! L<http://wiki.debian.org/Teams/Lintian>

=cut
