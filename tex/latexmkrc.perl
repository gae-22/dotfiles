# #!/usr/bin/env perl
# # http://mirrors.ctan.org/support/latexmk/latexmk.txt
$lualatex = 'lualatex -shell-escape -halt-on-error -file-line-error -synctex=1 -interaction=nonstopmode';
$lualatex_silent = $lualatex . '-interaction=batchmode';
$pdflualatex  = $lualatex;
$max_repeat = 5;
$pdf_mode = 4;
