# Declare our package
package Pod::Spell::CommonMistakes::WordList;
use strict; use warnings;

# Initialize our version
use vars qw( $VERSION );
$VERSION = '0.01';

# auto-export our 2 subs
use base qw( Exporter );
our @EXPORT = qw( _check_case _check_common );

# This is a simple data module
# The data is taken from Lintian in the Debian git repo, thanks!
# http://wiki.debian.org/Teams/Lintian
# git://git.debian.org/git/lintian/lintian.git

# TODO Figure out an autoimporter?
# apoc@blackhole:~/othergit/lintian/data/spelling$ cat corrections-case | perl -e 'while ( <STDIN> ) { next if $_ =~ /^#/; if ( $_ =~ /^(.+)\|\|(.+)$/ ) { print " \"$1\" => \"$2\",\n" } }'

# CASE LIST

#apoc@blackhole:~/othergit/lintian/data/spelling$ cat corrections-case
# Picky corrections, applied before lowercasing the word.  These are only
# applied to things known to be entirely English text, such as package
# descriptions, and should not be applied to files that may contain
# configuration fragments or more informal files such as debian/copyright.
#
# The format of each line is:
# mistake||correction

my %case = (
 "apache" => "Apache",
 "api" => "API",
 "Api" => "API",
 "D-BUS" => "D-Bus",
 "d-bus" => "D-Bus",
 "dbus" => "D-Bus",
 "debian" => "Debian",
 "Debian-Edu" => "Debian Edu",
 "debian-edu" => "Debian Edu",
 "english" => "English",
 "french" => "French",
 "EMacs" => "Emacs",
 "Gconf" => "GConf",
 "gconf" => "GConf",
 "german" => "German",
 "Gnome" => "GNOME",
 "gnome" => "GNOME",
 "Gnome-VFS" => "GnomeVFS",
 "Gnome-Vfs" => "GnomeVFS",
 "GnomeVfs" => "GnomeVFS",
 "gnome-vfs" => "GnomeVFS",
 "gnomevfs" => "GnomeVFS",
 "gnu" => "GNU",
 "Gnu" => "GNU",
 "Gobject" => "GObject",
 "gobject" => "GObject",
 "Gstreamer" => "GStreamer",
 "gstreamer" => "GStreamer",
 "GTK" => "GTK+",
 "gtk+" => "GTK+",
 "Http" => "HTTP",
 "kde" => "KDE",
 "meta-package" => "metapackage",
 "MYSQL" => "MySQL",
 "Mysql" => "MySQL",
 "mysql" => "MySQL",
 "linux" => "Linux",
 "Latex" => "LaTeX",
 "latex" => "LaTeX",
 "OCAML" => "OCaml",
 "Ocaml" => "OCaml",
 "ocaml" => "OCaml",
 "OpenLdap" => "OpenLDAP",
 "Openldap" => "OpenLDAP",
 "openldap" => "OpenLDAP",
 "Postgresql" => "PostgreSQL",
 "postgresql" => "PostgreSQL",
 "python" => "Python",
 "russian" => "Russian",
 "SkoleLinux" => "Skolelinux",
 "skolelinux" => "Skolelinux",
 "SLang" => "S-Lang",
 "S-lang" => "S-Lang",
 "s-lang" => "S-Lang",
 "spanish" => "Spanish",
 "subversion" => "Subversion",
 "TCL" => "Tcl",
 "tcl" => "Tcl",
 "TEX" => "TeX",
 "Tex" => "TeX",
 "TeTeX" => "teTeX",
 "Tetex" => "teTeX",
 "tetex" => "teTeX",
 "TeXLive" => "TeX Live",
 "TeX-Live" => "TeX Live",
 "TeXlive" => "TeX Live",
 "TeX-live" => "TeX Live",
 "texlive" => "TeX Live",
 "tex-live" => "TeX Live",
 "TK" => "Tk",
 "tk" => "Tk",
 "Xemacs" => "XEmacs",
 "XEMacs" => "XEmacs",
 "XFCE" => "Xfce",
 "XFce" => "Xfce",
 "xfce" => "Xfce",
);

sub _check_case {
	my $words = shift;

	# Holds the failures we saw
	my %err;

	foreach my $w ( @$words ) {
		if ( exists $case{ $w } ) {
			$err{ $w } = $case{ $w };
		}
	}

	return \%err;
}

# COMMON LIST

#apoc@blackhole:~/othergit/lintian/data/spelling$ cat corrections
# All spelling errors that have been observed "in the wild" in package
# descriptions are added here, on the grounds that if they occurred once they
# are more likely to occur again.
#
# Misspellings of "compatibility", "separate", and "similar" are particularly
# common.
#
# Be careful with corrections that involve punctuation, since the check is a
# bit rough with punctuation.  For example, I had to delete the correction of
# "builtin" to "built-in".
#
# The format of each line is:
# mistake||correction
#
# Note that corrections involving multiple word mistakes or case errors
# should be included in the appropriate data file, rather than here.

my %common = (
 "abandonning" => "abandoning",
 "abigious" => "ambiguous",
 "abitrate" => "arbitrate",
 "abov" => "above",
 "absense" => "absence",
 "absolut" => "absolute",
 "accelleration" => "acceleration",
 "accesing" => "accessing",
 "accesnt" => "accent",
 "accessable" => "accessible",
 "accidentaly" => "accidentally",
 "accidentually" => "accidentally",
 "accomodate" => "accommodate",
 "accomodates" => "accommodates",
 "accout" => "account",
 "acess" => "access",
 "acessable" => "accessible",
 "acording" => "according",
 "acumulating" => "accumulating",
 "addional" => "additional",
 "additionaly" => "additionally",
 "adress" => "address",
 "adresses" => "addresses",
 "adviced" => "advised",
 "afecting" => "affecting",
 "albumns" => "albums",
 "alegorical" => "allegorical",
 "algorith" => "algorithm",
 "algorithmical" => "algorithmically",
 "algoritms" => "algorithms",
 "allpication" => "application",
 "alot" => "a lot",
 "alows" => "allows",
 "altough" => "although",
 "ambigious" => "ambiguous",
 "amoung" => "among",
 "amout" => "amount",
 "analysator" => "analyzer",
 "ang" => "and",
 "annoucement" => "announcement",
 "anomolies" => "anomalies",
 "anomoly" => "anomaly",
 "aplication" => "application",
 "appearence" => "appearance",
 "appropiate" => "appropriate",
 "appropriatly" => "appropriately",
 "aquired" => "acquired",
 "arbitary" => "arbitrary",
 "architechture" => "architecture",
 "arguement" => "argument",
 "arguements" => "arguments",
 "aritmetic" => "arithmetic",
 "arne't" => "aren't",
 "arraival" => "arrival",
 "artifical" => "artificial",
 "artillary" => "artillery",
 "assigment" => "assignment",
 "assigments" => "assignments",
 "assistent" => "assistant",
 "asuming" => "assuming",
 "atomatically" => "automatically",
 "attemps" => "attempts",
 "attruibutes" => "attributes",
 "authentification" => "authentication",
 "automaticaly" => "automatically",
 "automaticly" => "automatically",
 "automatize" => "automate",
 "automatized" => "automated",
 "automatizes" => "automates",
 "autonymous" => "autonomous",
 "auxilliary" => "auxiliary",
 "avaiable" => "available",
 "availabled" => "available",
 "availablity" => "availability",
 "availale" => "available",
 "availavility" => "availability",
 "availble" => "available",
 "availble" => "available",
 "availiable" => "available",
 "avaliable" => "available",
 "avaliable" => "available",
 "backgroud" => "background",
 "bahavior" => "behavior",
 "baloons" => "balloons",
 "batery" => "battery",
 "becomming" => "becoming",
 "becuase" => "because",
 "begining" => "beginning",
 "calender" => "calendar",
 "cancelation" => "cancellation",
 "capabilites" => "capabilities",
 "capatibilities" => "capabilities",
 "cariage" => "carriage",
 "challanges" => "challenges",
 "changable" => "changeable",
 "charachters" => "characters",
 "charcter" => "character",
 "childs" => "children",
 "chnages" => "changes",
 "choosen" => "chosen",
 "colorfull" => "colorful",
 "comand" => "command",
 "comit" => "commit",
 "commerical" => "commercial",
 "comminucation" => "communication",
 "commited" => "committed",
 "commiting" => "committing",
 "committ" => "commit",
 "commoditiy" => "commodity",
 "compability" => "compatibility",
 "compatability" => "compatibility",
 "compatable" => "compatible",
 "compatibiliy" => "compatibility",
 "compatibilty" => "compatibility",
 "compleatly" => "completely",
 "complient" => "compliant",
 "compres" => "compress",
 "compresion" => "compression",
 "configuratoin" => "configuration",
 "connectinos" => "connections",
 "consistancy" => "consistency",
 "containes" => "contains",
 "containts" => "contains",
 "contence" => "contents",
 "continous" => "continuous",
 "continueing" => "continuing",
 "contraints" => "constraints",
 "convertor" => "converter",
 "convinient" => "convenient",
 "corected" => "corrected",
 "correponding" => "corresponding",
 "correponds" => "corresponds",
 "cryptocraphic" => "cryptographic",
 "curently" => "currently",
 "deafult" => "default",
 "deamon" => "daemon",
 "debain" => "Debian",
 "debians" => "Debian's",
 "decompres" => "decompress",
 "definate" => "definite",
 "definately" => "definitely",
 "delemiter" => "delimiter",
 "dependancies" => "dependencies",
 "dependancy" => "dependency",
 "dependant" => "dependent",
 "detabase" => "database",
 "developement" => "development",
 "developped" => "developed",
 "deveolpment" => "development",
 "devided" => "divided",
 "dictionnary" => "dictionary",
 "diplay" => "display",
 "disapeared" => "disappeared",
 "discontiguous" => "noncontiguous",
 "dispertion" => "dispersion",
 "dissapears" => "disappears",
 "docuentation" => "documentation",
 "documantation" => "documentation",
 "documentaion" => "documentation",
 "dont" => "don't",
 "downlad" => "download",
 "downlads" => "downloads",
 "easilly" => "easily",
 "ecspecially" => "especially",
 "edditable" => "editable",
 "editting" => "editing",
 "eletronic" => "electronic",
 "enchanced" => "enhanced",
 "encorporating" => "incorporating",
 "endianess" => "endianness",
 "enhaced" => "enhanced",
 "enlightnment" => "enlightenment",
 "enocded" => "encoded",
 "enterily" => "entirely",
 "enviroiment" => "environment",
 "enviroment" => "environment",
 "environement" => "environment",
 "environent" => "environment",
 "equivelant" => "equivalent",
 "equivilant" => "equivalent",
 "excecutable" => "executable",
 "exceded" => "exceeded",
 "excellant" => "excellent",
 "exlcude" => "exclude",
 "expecially" => "especially",
 "explicitely" => "explicitly",
 "expresion" => "expression",
 "exprimental" => "experimental",
 "extention" => "extension",
 "failuer" => "failure",
 "familar" => "familiar",
 "fatser" => "faster",
 "fetaures" => "features",
 "forse" => "force",
 "fortan" => "fortran",
 "forwardig" => "forwarding",
 "framwork" => "framework",
 "fuction" => "function",
 "fuctions" => "functions",
 "functionaly" => "functionally",
 "functionnality" => "functionality",
 "functonality" => "functionality",
 "futhermore" => "furthermore",
 "generiously" => "generously",
 "grahical" => "graphical",
 "grahpical" => "graphical",
 "grapic" => "graphic",
 "guage" => "gauge",
 "halfs" => "halves",
 "heirarchically" => "hierarchically",
 "helpfull" => "helpful",
 "hierachy" => "hierarchy",
 "hierarchie" => "hierarchy",
 "howver" => "however",
 "immeadiately" => "immediately",
 "implemantation" => "implementation",
 "implemention" => "implementation",
 "incomming" => "incoming",
 "incompatabilities" => "incompatibilities",
 "incompatable" => "incompatible",
 "inconsistant" => "inconsistent",
 "indendation" => "indentation",
 "indended" => "intended",
 "independant" => "independent",
 "informatiom" => "information",
 "informations" => "information",
 "infromation" => "information",
 "initalize" => "initialize",
 "initators" => "initiators",
 "initializiation" => "initialization",
 "inofficial" => "unofficial",
 "integreated" => "integrated",
 "integrety" => "integrity",
 "integrey" => "integrity",
 "intendet" => "intended",
 "interchangable" => "interchangeable",
 "intermittant" => "intermittent",
 "interupted" => "interrupted",
 "jave" => "java",
 "langage" => "language",
 "langauage" => "language",
 "langugage" => "language",
 "lauch" => "launch",
 "lenght" => "length",
 "lesstiff" => "lesstif",
 "libaries" => "libraries",
 "libary" => "library",
 "libraris" => "libraries",
 "licenceing" => "licencing",
 "loggging" => "logging",
 "loggin" => "login",
 "logile" => "logfile",
 "machinary" => "machinery",
 "maintainance" => "maintenance",
 "maintainence" => "maintenance",
 "makeing" => "making",
 "managable" => "manageable",
 "manoeuvering" => "maneuvering",
 "mathimatical" => "mathematical",
 "mathimatic" => "mathematic",
 "mathimatics" => "mathematics",
 "ment" => "meant",
 "messsages" => "messages",
 "microprocesspr" => "microprocessor",
 "milliseonds" => "milliseconds",
 "miscelleneous" => "miscellaneous",
 "misformed" => "malformed",
 "mispelled" => "misspelled",
 "mmnemonic" => "mnemonic",
 "modulues" => "modules",
 "monochorome" => "monochrome",
 "monochromo" => "monochrome",
 "monocrome" => "monochrome",
 "mroe" => "more",
 "multidimensionnal" => "multidimensional",
 "mulitplied" => "multiplied",
 "mutiple" => "multiple",
 "nam" => "name",
 "nams" => "names",
 "navagating" => "navigating",
 "nead" => "need",
 "neccesary" => "necessary",
 "neccessary" => "necessary",
 "necesary" => "necessary",
 "negotation" => "negotiation",
 "nescessary" => "necessary",
 "nessessary" => "necessary",
 "noticable" => "noticeable",
 "notications" => "notifications",
 "o'caml" => "OCaml",
 "omitt" => "omit",
 "ommitted" => "omitted",
 "optionnal" => "optional",
 "optmizations" => "optimizations",
 "orientatied" => "orientated",
 "orientied" => "oriented",
 "overaall" => "overall",
 "overriden" => "overridden",
 "pacakge" => "package",
 "pachage" => "package",
 "packacge" => "package",
 "packege" => "package",
 "packge" => "package",
 "pakage" => "package",
 "pallette" => "palette",
 "paramameters" => "parameters",
 "paramater" => "parameter",
 "parametes" => "parameters",
 "paramter" => "parameter",
 "paramters" => "parameters",
 "particularily" => "particularly",
 "pased" => "passed",
 "peprocessor" => "preprocessor",
 "perfoming" => "performing",
 "permissons" => "permissions",
 "persistant" => "persistent",
 "plattform" => "platform",
 "pleaes" => "please",
 "ploting" => "plotting",
 "posible" => "possible",
 "postgressql" => "PostgreSQL",
 "powerfull" => "powerful",
 "preceeded" => "preceded",
 "preceeding" => "preceding",
 "precendence" => "precedence",
 "precission" => "precision",
 "prefered" => "preferred",
 "prefferably" => "preferably",
 "prepaired" => "prepared",
 "primative" => "primitive",
 "princliple" => "principle",
 "priorty" => "priority",
 "procceed" => "proceed",
 "proccesors" => "processors",
 "proces" => "process",
 "processessing" => "processing",
 "processpr" => "processor",
 "processsing" => "processing",
 "progams" => "programs",
 "programers" => "programmers",
 "programm" => "program",
 "programms" => "programs",
 "promps" => "prompts",
 "pronnounced" => "pronounced",
 "prononciation" => "pronunciation",
 "pronouce" => "pronounce",
 "pronunce" => "pronounce",
 "propery" => "property",
 "prosess" => "process",
 "protable" => "portable",
 "protcol" => "protocol",
 "protecion" => "protection",
 "protocoll" => "protocol",
 "psychadelic" => "psychedelic",
 "quering" => "querying",
 "recieved" => "received",
 "recieve" => "receive",
 "reciever" => "receiver",
 "recogniced" => "recognised",
 "recognizeable" => "recognizable",
 "recommanded" => "recommended",
 "redircet" => "redirect",
 "redirectrion" => "redirection",
 "reenabled" => "re-enabled",
 "reenable" => "re-enable",
 "reencode" => "re-encode",
 "refence" => "reference",
 "registerd" => "registered",
 "registraration" => "registration",
 "regulamentations" => "regulations",
 "remoote" => "remote",
 "removeable" => "removable",
 "repectively" => "respectively",
 "replacments" => "replacements",
 "requiere" => "require",
 "requred" => "required",
 "resizeable" => "resizable",
 "ressize" => "resize",
 "ressource" => "resource",
 "retransmited" => "retransmitted",
 "runnning" => "running",
 "safly" => "safely",
 "savable" => "saveable",
 "searchs" => "searches",
 "secund" => "second",
 "separatly" => "separately",
 "sepcify" => "specify",
 "seperated" => "separated",
 "seperately" => "separately",
 "seperate" => "separate",
 "seperatly" => "separately",
 "seperator" => "separator",
 "sequencial" => "sequential",
 "serveral" => "several",
 "setts" => "sets",
 "similiar" => "similar",
 "simliar" => "similar",
 "speach" => "speech",
 "speciefied" => "specified",
 "specifed" => "specified",
 "specificaton" => "specification",
 "specifing" => "specifying",
 "speficied" => "specified",
 "speling" => "spelling",
 "splitted" => "split",
 "staically" => "statically",
 "standart" => "standard",
 "staticly" => "statically",
 "subdirectoires" => "subdirectories",
 "suble" => "subtle",
 "succesfully" => "successfully",
 "succesful" => "successful",
 "sucessfully" => "successfully",
 "superflous" => "superfluous",
 "superseeded" => "superseded",
 "suplied" => "supplied",
 "suport" => "support",
 "suppored" => "supported",
 "supportin" => "supporting",
 "suppoted" => "supported",
 "suppported" => "supported",
 "suppport" => "support",
 "suspicously" => "suspiciously",
 "synax" => "syntax",
 "synchonized" => "synchronized",
 "syncronize" => "synchronize",
 "syncronizing" => "synchronizing",
 "syncronus" => "synchronous",
 "syste" => "system",
 "sythesis" => "synthesis",
 "taht" => "that",
 "throught" => "through",
 "transfering" => "transferring",
 "trasmission" => "transmission",
 "treshold" => "threshold",
 "trigerring" => "triggering",
 "unecessary" => "unnecessary",
 "unexecpted" => "unexpected",
 "unfortunatelly" => "unfortunately",
 "unknonw" => "unknown",
 "unkown" => "unknown",
 "unuseful" => "useless",
 "usefull" => "useful",
 "usera" => "users",
 "usetnet" => "Usenet",
 "usualy" => "usually",
 "utilites" => "utilities",
 "utillities" => "utilities",
 "utilties" => "utilities",
 "utiltity" => "utility",
 "utitlty" => "utility",
 "variantions" => "variations",
 "varient" => "variant",
 "verbse" => "verbose",
 "verisons" => "versions",
 "verison" => "version",
 "verson" => "version",
 "vicefersa" => "vice-versa",
 "vitual" => "virtual",
 "whataver" => "whatever",
 "wheter" => "whether",
 "wierd" => "weird",
 "xwindows" => "X",
 "yur" => "your",
);

sub _check_common {
	my $words = shift;

	# Holds the failures we saw
	my %err;

	# Logic taken from Lintian::Check::check_spelling(), thanks!
	foreach my $w ( @$words ) {
		my $lcw = lc( $w );
		if ( exists $common{ $lcw } ) {
			# Determine what kind of correction we need
			if ( $w =~ /^[A-Z]+$/ ) {
				$err{ $w } = uc( $common{ $lcw } );
			} elsif ( $w =~ /^[A-Z]/ ) {
				$err{ $w } = ucfirst( $common{ $lcw } );
			} else {
				$err{ $w } = $common{ $lcw };
			}
		}
	}

	return \%err;
}

1;
__END__

=for stopwords wordlist Lintian

=head1 NAME

Pod::Spell::CommonMistakes::WordList - Holds the wordlist data for Pod::Spell::CommonMistakes

=head1 SYNOPSIS

	die "Don't use this module directly. Please use Pod::Spell::CommonMistakes instead.";

=head1 DESCRIPTION

Holds the wordlist used in L<Pod::Spell::CommonMistakes>. The data is taken from L<http://wiki.debian.org/Teams/Lintian>, thanks!

	# Data taken from:
	# lintian/data/spellings/corrections
	# lintian/data/spellings/corrections-case

	# Data was synced on Wed Apr  7 13:33:46 MST 2010
	# The git repo was on 0fbfb39a4510a3e80685ce6201810b7b06f1b78e

=head1 SEE ALSO

L<Pod::Spell::CommonMistakes>

=head1 AUTHOR

Apocalypse E<lt>apocal@cpan.orgE<gt>

Thanks goes out to the Lintian team for their work!

=head1 COPYRIGHT AND LICENSE

Copyright 2010 by Apocalypse

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

=cut
