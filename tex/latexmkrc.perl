#!/usr/bin/env perl

# http://mirrors.ctan.org/support/latexmk/latexmk.txt
$lualatex = 'lualatex -shell-escape --halt-on-error';
$lualatex_silent = 'lualatex --halt-on-error --interaction=batchmode';
$max_repeat = 10;
$pdf_mode = 4; # lualatexは4
$do_cd = 1;
$rc_report = 0;
