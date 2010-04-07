# Declare our package
package Pod::Spell::CommonMistakes;
use strict; use warnings;

# Initialize our version
use vars qw( $VERSION );
$VERSION = '0.01';

# Import the modules we need
use Pod::Spell::CommonMistakes::WordList;
use Pod::Spell;
use IO::Scalar;

# auto-export our 2 subs
use base qw( Exporter );
our @EXPORT_OK = qw( check_pod check_pod_case check_pod_all );

sub check_pod_all {
	my $pod = shift;

	# Start our parse run!
	my $words = _parse( $pod );

	# Holds the failures we saw
	my $err = _check_common( $words );
	$err = { %$err, %{ _check_case( $words ) } };
	return $err;
}

sub check_pod {
	my $pod = shift;

	# Start our parse run!
	my $words = _parse( $pod );
	return _check_common( $words );
}

sub check_pod_case {
	my $pod = shift;

	# Start our parse run!
	my $words = _parse( $pod );
	return _check_case( $pod );
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
__END__

=for stopwords AnnoCPAN CPAN CPANTS Kwalitee Lintian openldap RT spellchecker wordlist wordlists

=head1 NAME

Pod::Spell::CommonMistakes - Catches common typos in POD

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

=head1 Methods

=head2 check_pod( $filename )

This function is what you will usually run. It will run the spell checks against the POD in $filename. Warning: you would need to catch any
exceptions thrown from this function!

It returns a hashref of misspelled words and their suggested spelling. If the hash is empty then there is no errors in the POD.

=head2 check_pod_case( $filename )

This function behaves the same as check_pod() but it uses a "strict" wordlist instead. The difference is that this wordlist
will make sure you capitalize common terms properly. One example is: OpenLdap => OpenLDAP.

NOTE: This does NOT run the same checks as check_pod()! If you want to check both the regular and picky wordlists, you would need to use
the check_pod_all() function.

=head2 check_pod_all( $filename )

This function behaves the same as check_pod() but it runs all the extra checks too. Currently it's just the picky wordlist but others might
be added in the future...

=head1 EXPORT

You would need to manually get the function you want.

=head1 SEE ALSO

L<Pod::Spell>

=head1 SUPPORT

You can find documentation for this module with the perldoc command.

	perldoc Pod::Spell::CommonMistakes

=head2 Websites

=over 4

=item * Search CPAN

L<http://search.cpan.org/dist/Pod-Spell-CommonMistakes>

=item * AnnoCPAN: Annotated CPAN documentation

L<http://annocpan.org/dist/Pod-Spell-CommonMistakes>

=item * CPAN Ratings

L<http://cpanratings.perl.org/d/Pod-Spell-CommonMistakes>

=item * CPAN Forum

L<http://cpanforum.com/dist/Pod-Spell-CommonMistakes>

=item * RT: CPAN's Request Tracker

L<http://rt.cpan.org/NoAuth/Bugs.html?Dist=Pod-Spell-CommonMistakes>

=item * CPANTS Kwalitee

L<http://cpants.perl.org/dist/overview/Pod-Spell-CommonMistakes>

=item * CPAN Testers Results

L<http://cpantesters.org/distro/P/Pod-Spell-CommonMistakes.html>

=item * CPAN Testers Matrix

L<http://matrix.cpantesters.org/?dist=Pod-Spell-CommonMistakes>

=item * Git Source Code Repository

L<http://github.com/apocalypse/perl-pod-spell-commonmistakes>

=back

=head2 Bugs

Please report any bugs or feature requests to C<bug-pod-spell-commonmistakes at rt.cpan.org>, or through
the web interface at L<http://rt.cpan.org/NoAuth/ReportBug.html?Queue=Pod-Spell-CommonMistakes>.  I will be
notified, and then you'll automatically be notified of progress on your bug as I make changes.

=head1 AUTHOR

Apocalypse E<lt>apocal@cpan.orgE<gt>

Thanks goes out to the Lintian team for their work!

Props goes out to jawnsy@irc for pointing out a spelling mistake in POE, which prompted me to write this.

=head1 COPYRIGHT AND LICENSE

Copyright 2010 by Apocalypse

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

The full text of the license can be found in the LICENSE file included
with this module.

=cut
