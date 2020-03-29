#!/bin/bash
cd ../entries

grep --include \*.Rmd -iRE --color "tags: " .

# sed -n '/^tags: [/,/^]/p;/^]/q' *.Rmd

# for file in *.Rmd
    # sed /^---$/,/^---$/p "$file"
# done
cd ..

# cmd /k