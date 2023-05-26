# #!/usr/bin/env perl
# # http://mirrors.ctan.org/support/latexmk/latexmk.txt
$lualatex = 'lualatex -shell-escape -halt-on-error -file-line-error -synctex=1 -interaction=nonstopmode';
$lualatex_silent = $lualatex . '-interaction=batchmode';
$pdflualatex  = $lualatex;
$max_repeat = 5;
$pdf_mode = 4;

$pvc_view_file_via_temporary = 0;
if ($^O eq 'linux') {
    $dvi_previewer = "xdg-open %S";
    $pdf_previewer = "xdg-open %S";
} elsif ($^O eq 'darwin') {
    $dvi_previewer = "open %S";
    $pdf_previewer = "open %S";
} else {
    $dvi_previewer = "start %S";
    $pdf_previewer = "start %S";
}
