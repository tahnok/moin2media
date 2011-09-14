#!/usr/bin/perl

#TODO make the math workt with $ in between
#TODO fix links
#TODO fix mixed bulleted/numbered list structure
#TODO date removal...
#TODO tables...
#TODO lists with a. in them
#TODO fix s/__(.*)__/<u>$1</u>/g;

open(HANDLE, "moin.txt");
@testlines = <HANDLE>;
close HANDLE;

foreach (@testlines) {
#	while (s/[*#]([*#]+)/ $1/g) {}
	while (s/^\s*:/ /g) {}
	s/^(\s*)\*/'*' x length($1)/eg;
	s/^(\s*)\d\./'#' x (length($1))/eg;
	s/^{{{/<syntaxhighlight lang = "text">/g;
	s/^{{{(.*)/<syntaxhighlight lang = "$1">/g;
	s/^}}}/<\/syntaxhighlight>/g;
	s/<<latex\(\$(.*?)\$\)>>/<math>$1<\/math>/g;
	s/ (.*)::(.*)/; $1 : $2/g;
#	s/[[(.*) | (.*)]]/[$1 $2]/g;
#	s/^ (.*)/:$1/g;	
	s/^<<Date\((.*)T(.*)\)>>/$1/g;
	s/\[\[(.*)\]\]/$1/g;
	s/__(.*)__/<u>$1<\/u>/g;
}

open(HANDLES, ">media.txt");
print HANDLES "$_" foreach @testlines;
close HANDLES;


