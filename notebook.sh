THIS=$(readlink -f "$0")

echo "c - Create an entry for today"
echo "o - open most recent entry (date in filename)"
echo "e - open most recent edited file"
echo "t - list tags"
echo "p - pandoc - create pdf notebook"
echo "q - Quit"
echo "What do you want to do?"
read -p "" -s -n 1 next

if test "$next" = "c"
then
    cd ./bin && ./create.sh
fi

if test "$next" = "o"
then
    cd ./entries && start "$(ls *.Rmd | head -1)"
fi

if test "$next" = "e"
then
    cd ./entries && start "$(ls -1t *.Rmd | head -1)"
fi

if test "$next" = "t"
then
    cd ./bin && ./tags.sh
fi

if test "$next" = "q"
then
    exit
fi

if test "$next" = "p"
then
    cd ./bin && ./convert.sh
fi

# pwd
# Return to start of script
cd ..
exec "$THIS" && exit

# comment in if you want to see error messages (prevents cmd from closing)
cmd /k