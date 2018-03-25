#!/bin/bash

# Variables

CWD=$HOME
DIR=$CWD/dotfiles/linked
BAKDIR=$CWD/dotfiles.bak

DIRPATH=$((${#DIR}+2))
ARRAY=(); for file in $DIR/{.??,}*; do ARRAY+=("${file:DIRPATH}"); done
FILES=$(printf " %s" "${ARRAY[@]}")

echo 'Home directory: '   $DIR
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
        ln -s $DIR/.$file $CWD/.$file
    done

    echo "...done"
fi
