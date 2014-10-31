use strict;
use warnings;

use Test::More;

BEGIN {
	eval { require Pod::Spelling };
	if ($@){
		plan skip_all => 'requires Pod::Spelling' ; 
	}
}

BEGIN {
	use_ok('Pod::Spelling::CommonMistakes');
}

# First, we test without allow_words
ok((-e 't/good.pod'), 'Got file');
my $o = Pod::Spelling::CommonMistakes->new;
my @r = $o->check_file( 't/good.pod' );
			
is(  @r, 1, 'Expected errors' );
is( $r[0], 'Goddard', 'Known unknown word');

# Now, we test again setting it!
$o = Pod::Spelling::CommonMistakes->new(
	allow_words => 'Goddard'
);

@r = $o->check_file( 't/good.pod' );
is(  @r, 0, 'No errors for allow_words/STRING');

done_testing();
