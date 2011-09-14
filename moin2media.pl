#!/usr/bin/perl

#TODO make the math work with $ in between
#TODO fix links
#TODO fix mixed bulleted/numbered list structure
#TODO tables...
#TODO lists with a. in them

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
	s/\{\{(http:\/\/[\w\d\-_\.\/]+)(\.png|\.svg|\.jpg|\.jpeg|\.gif|\.bmp|\.PNG|\.SVG|\.JPG|\.JPEG|\.GIF|\.BMP)}\}/<img src="$1$2">/g;
}

open(HANDLES, ">media.txt");
print HANDLES "$_" foreach @testlines;
close HANDLES;


