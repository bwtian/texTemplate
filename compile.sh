#!/bin/sh
filename=template
dir=build
mkdir -p $dir
pdflatex -synctex=1 -interaction=nonstopmode -output-directory=$dir $filename.tex
	bibtex     $dir/$filename.aux 	
	makeindex  $dir/$filename.aux
	makeindex  $dir/$filename.idx
        makeglossaries -d $dir $filename
	makeindex  $dir/$filename.nlo -s  $dir/nomencl.ist -o  $dir/$filename.nls
pdflatex -synctex=1 -interaction=nonstopmode -output-directory=$dir $filename.tex
	makeindex  $dir/$filename.nlo -s  $dir/nomencl.ist -o  $dir/$filename.nls
pdflatex -synctex=1 -interaction=nonstopmode -output-directory=$dir $filename.tex
okular $dir/$filename.pdf
