$out_dir = 'build';
$pdf_mode = 1;
$postscript_mode = 0;
$dvi_mode = 0;

# Always run bibtex
$bibtex_use = 2;

# Ensure build/ and its subdirectories exist before LaTeX runs
# (LaTeX cannot create directories for \include{} aux files itself)
unless (-d 'build') { mkdir 'build' or warn "Cannot create build: $!"; }
foreach my $d (qw(build/frontmatter build/chapters)) {
    unless (-d $d) { mkdir $d or warn "Cannot create $d: $!"; }
}

# Symlink ref/ so bibtex running from build/ can find .bib files
if (-d 'build' && ! -l 'build/ref') { symlink('../ref', 'build/ref') or warn "Cannot symlink build/ref: $!"; }

# Copy final PDF to repository root after successful build
$success_cmd = 'test -f build/%R.pdf && cp build/%R.pdf ./%R.pdf';

# Ensure root PDF is also removed on `latexmk -CA`
push @generated_exts, 'pdf';

# Allow bibtex to find .bib files from root and build dirs
$ENV{'BIBINPUTS'} = '/home/mirx/Tugas Kuliah/SEM 9/Skripsi/docs:./build';
