#!/bin/bash
cd ../entries
FILES=*.Rmd

for f in $FILES
do
    filename="${f%.*}"
    Rscript -e "library(rmarkdown); render('${filename}.Rmd', output_dir = 'output')"
done

pandoc ./output/*.html -o ./../out.pdf
cd ./../
start out.pdf
cd ..
# cmd /k