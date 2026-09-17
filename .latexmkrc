# All intermediates live in build/; only the final PDF is copied back to the repo root.
$out_dir = 'build';
$aux_dir = 'build';

# pdflatex + -shell-escape (required by minted and by TikZ externalization).
$pdf_mode = 1;
$pdflatex = 'pdflatex -shell-escape -synctex=1 -interaction=nonstopmode -file-line-error %O %S';

# TikZ externalization writes its cache through \write18 sub-compiles; make sure the
# directory exists before pdflatex runs, otherwise the sub-compile dies on open-out.
$compiling_cmd = 'mkdir -p build/tikz-cache';

# Hand the user a main.pdf at the repo root (the only build product that is tracked).
$success_cmd = 'cp build/main.pdf main.pdf';

# `latexmk -c` / `-C` should also take the copied PDF and the tikz cache with them.
$clean_ext = 'auxlock bbl run.xml synctex.gz';
push @generated_exts, 'auxlock';
