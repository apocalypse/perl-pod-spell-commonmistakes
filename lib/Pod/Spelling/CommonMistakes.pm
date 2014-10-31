package Pod::Spelling::CommonMistakes;

# ABSTRACT: Adaptor for Pod::Spelling to use CommonMistakes as a checker

use base 'Pod::Spelling'; # Thanks :)

use Pod::Spell::CommonMistakes::WordList qw( _check_common _check_case );

# We override our base...
no warnings 'redefine';

sub _init {
	shift if not ref $_[0];
	my $self = shift;

	# Nothing magical to do :)

	return $self;
}

# Accepts one or more lines of text, returns a list mispelt words.
sub _spell_check_callback {
        my $self = shift;
        my @lines = @_;
        @lines = grep { not $_ } split /\s+/, join( ' ', @lines );
	my $err = _check_common( \@lines );
	$err = { %$err, %{ _check_case( \@lines ) } };

        return keys %$err;
}

1;

=pod

=head1 SYNOPSIS

	die "Don't use this module directly. Please use Pod::Spelling instead.";

=head1 DESCRIPTION

Adaptor for L<Pod::Spelling> as a backend checker.

=cut
