#!/usr/bin/perl

#TODO make the math workt with $ in between
#TODO fix links
#TODO fix mixed bulleted/numbered list structure
#TODO date removal...
#TODO tables...
#TODO lists with a. in them

open(HANDLE, "moin.txt");
@testlines = <HANDLE>;
close HANDLE;

$testlines[0] =~ s/\|\|(.*)/\{\| border="1"\n\|$1/g;
$testlines[-1] =~ s/(.*)\|\|/$1\n\|\}/g;
foreach (@testlines) {
	s/(.*)\|\|$/$1\n\|-/g;
	s/^\|\|(.*)/\|$1/g;
}

open(HANDLES, ">media.txt");
print HANDLES "$_" foreach @testlines;
close HANDLES;


