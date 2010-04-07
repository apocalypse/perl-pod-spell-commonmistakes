# Build.PL
use strict; use warnings;
use Module::Build;

my $build = Module::Build->new(
	# look up Module::Build::API for the info!
	'dynamic_config'	=> 0,
	'module_name'		=> 'Pod::Spell::CommonMistakes',
	'license'		=> 'perl',

	'dist_abstract'		=> 'Catches common typos in POD',
	'dist_author'		=> 'Apocalypse <APOCAL@cpan.org>',

	'create_packlist'	=> 1,
	'create_makefile_pl'	=> 'traditional',
	'create_readme'		=> 1,
	'create_license'	=> 1,
	'sign'			=> 0,

	'test_files'		=> 't/*.t',

	'requires'		=> {
		# We need Pod::Spell for the processing
		'Pod::Spell'			=> '1.01',
		'IO::Scalar'			=> '2.110',

		# we need a recent perl
		'perl'				=> '5.008',
	},

	# include the standard stuff in META.yml
	'meta_merge'	=> {
		'resources'	=> {
			'license'	=> 'http://dev.perl.org/licenses/',
			'homepage'	=> 'http://search.cpan.org/dist/Pod-Spell-CommonMistakes',
			'bugtracker'	=> 'http://rt.cpan.org/NoAuth/Bugs.html?Dist=Pod-Spell-CommonMistakes',
			'repository'	=> 'http://github.com/apocalypse/perl-pod-spell-commonmistakes',
		},
	},
);

# all done!
$build->create_build_script;
