#!/usr/bin/perl

#     ZZZZZZZZZZZZZZZZZZZZ    8888888888888       00000000000
#   ZZZZZZZZZZZZZZZZZZZZ    88888888888888888    0000000000000
#                ZZZZZ      888           888  0000         0000
#              ZZZZZ        88888888888888888  0000         0000
#            ZZZZZ            8888888888888    0000         0000       AAAAAA         SSSSSSSSSSS   MMMM       MMMM
#          ZZZZZ            88888888888888888  0000         0000      AAAAAAAA      SSSS            MMMMMM   MMMMMM
#        ZZZZZ              8888         8888  0000         0000     AAAA  AAAA     SSSSSSSSSSS     MMMMMMMMMMMMMMM
#      ZZZZZ                8888         8888  0000         0000    AAAAAAAAAAAA      SSSSSSSSSSS   MMMM MMMMM MMMM
#    ZZZZZZZZZZZZZZZZZZZZZ  88888888888888888    0000000000000     AAAA      AAAA           SSSSS   MMMM       MMMM
#  ZZZZZZZZZZZZZZZZZZZZZ      8888888888888       00000000000     AAAA        AAAA  SSSSSSSSSSS     MMMM       MMMM
#
# Copyright (C) Paulo Custodio, 2011-2013

# $Header: /home/dom/z88dk-git/cvs/z88dk/src/z80asm/t/Attic/option-t.t,v 1.3 2013-02-12 00:55:00 pauloscustodio Exp $
# $Log: option-t.t,v $
# Revision 1.3  2013-02-12 00:55:00  pauloscustodio
# CH_0017 : Align with spaces, deprecate -t option
#
# Revision 1.2  2013/01/20 21:24:29  pauloscustodio
# Updated copyright year to 2013
#
# Revision 1.1  2011/07/11 15:46:33  pauloscustodio
# Added test scripts for all z80asm options
#
#
# Test option -t

use strict;
use warnings;
use File::Slurp;
use Test::More;
use Test::Differences; 
require 't/test_utils.pl';

my $asm = "
	xdef main
main:	ld b,10
loop:	djnz loop
	ret
";
my $bin = "\x06\x0A\x10\xFE\xC9";
my $map = <<'END';
LOOP                            = 0002, L: TEST
MAIN                            = 0000, G: TEST


MAIN                            = 0000, G: TEST
LOOP                            = 0002, L: TEST
END


# no -t
t_z80asm(
	asm		=> $asm,
	bin		=> $bin,
	options	=> '-m',
);
ok -f map_file(), map_file();
eq_or_diff scalar(read_file(map_file())), $map, "mapfile contents";


# -t4
t_z80asm(
	asm		=> $asm,
	bin		=> $bin,
	options	=> '-m -t4',
	err		=> "Warning: option '-t' is deprecated",
);
ok -f map_file(), map_file();
eq_or_diff scalar(read_file(map_file())), $map, "mapfile contents";


unlink_testfiles();
done_testing();
