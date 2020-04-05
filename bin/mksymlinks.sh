#!/bin/bash

CWD=$HOME
LINKED=$CWD/dotfiles/linked
BAKDIR=$CWD/dotfiles.bak

DIRPATH=$((${#LINKED}+2))
ARRAY=(); for file in $LINKED/{.??,}*; do ARRAY+=("${file:DIRPATH}"); done
FILES=$(printf " %s" "${ARRAY[@]}")

echo 'Home directory: '   $LINKED
echo 'Backup directory: ' $BAKDIR
echo 'Detected files: '   $FILES

read -p "This action will override all local changes. Proceed? [Y/n] " -n 1 -r
echo

if [[ $REPLY =~ ^[Yy]$ ]]; then

    if [ ! -d "$CWD/dotfiles.bak" ]; then
        mkdir $CWD/dotfiles.bak
    fi

    echo "Moving any existing dotfiles from $CWD to $BAKDIR"

    for file in $FILES; do
        mv ~/.$file $BAKDIR/
    done

    echo "Creating symlinks..."

    for file in $FILES; do
        echo ".$file"
        ln -s $LINKED/.$file $CWD/.$file
    done

    echo "...done"
fi
