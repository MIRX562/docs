$out_dir = 'build';
$pdf_mode = 1;
$postscript_mode = 0;
$dvi_mode = 0;

# Copy final PDF to repository root after successful build
$success_cmd = 'cp build/%R.pdf ./%R.pdf';

# Ensure root PDF is also removed on `latexmk -CA`
push @generated_exts, 'pdf';
