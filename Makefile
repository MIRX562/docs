# Makefile for thesis compilation
#
# All intermediate (generated) files go into build/; the root stays clean.
#
#   make            # build both PDFs (via latexmk -> build/)
#   make proposal   # build main_proposal.pdf
#   make skripsi    # build main_skripsi.pdf
#   make clean      # remove build/ and every root-level generated file
#
# Requires: latexmk (reads .latexmkrc, which sets $out_dir = 'build')

SHELL := /bin/bash

TEXFILES := main_proposal.tex main_skripsi.tex
PDFS     := $(TEXFILES:.tex=.pdf)

.PHONY: all proposal skripsi clean

all: $(PDFS)

proposal: main_proposal.pdf
skripsi: main_skripsi.pdf

%.pdf: %.tex
	mkdir -p build/frontmatter build/chapters
	latexmk -pdf $<

clean:
	latexmk -CA main_proposal.tex 2>/dev/null || true
	latexmk -CA main_skripsi.tex 2>/dev/null || true
	rm -f main_proposal.aux main_proposal.log main_proposal.out main_proposal.toc main_proposal.lof main_proposal.lot main_proposal.bbl main_proposal.blg main_proposal.fls main_proposal.fdb_latexmk main_proposal.synctex.gz main_proposal.pdf main_skripsi.aux main_skripsi.log main_skripsi.out main_skripsi.toc main_skripsi.lof main_skripsi.lot main_skripsi.bbl main_skripsi.blg main_skripsi.fls main_skripsi.fdb_latexmk main_skripsi.synctex.gz main_skripsi.pdf chapters/*.aux frontmatter/*.aux chapters/*.log frontmatter/*.log
	rm -rf build
