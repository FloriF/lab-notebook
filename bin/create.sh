#!/bin/bash

cd ..

TEMPLATE="./bin/template.Rmd"
NEWFILE="./entries/new.Rmd"
TODAY=$(date +"%Y-%m-%d")
FILENAME=$TODAY.Rmd
FILE="./entries/$FILENAME"

echo $TODAY

# if the file exists
if [ -e $FILE ]
then
    echo "$FILENAME already exists. What do you want to do?"
    echo "s - stop"
    echo "p - proceed (This overwrites the file!)"
    echo "e - edit this file"
    # wait for input
    read -s -n 1 PROCEED_OR_STOP
    if test "$PROCEED_OR_STOP" = "p"
    then
        # proceed
        echo "Overwrite file $FILE."
        # copy template
        cp $TEMPLATE $NEWFILE
        mv $NEWFILE $FILE
        start $FILE
    fi
    if test "$PROCEED_OR_STOP" = "s"
    then
        echo "stopped - Returning to main menu"
    fi
    if test "$PROCEED_OR_STOP" = "e"
    then
        start $FILE
    fi
else
    cp $TEMPLATE $NEWFILE
    mv $NEWFILE $FILE
    start $FILE
    echo "# $TODAY" >> notebook.Rmd
    echo "# $TODAY" >> $FILE
    echo -e "\`\`\`{r child = '$FILE'}" >> notebook.Rmd
    echo "\`\`\`" >> notebook.Rmd
    echo "" >> notebook.Rmd
fi

# pwd

# comment in if you want to see error messages (prevents cmd from closing)
# cmd /k