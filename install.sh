#!/bin/bash

dir=$HOME/dotfiles
olddir=$HOME/dotfiles_old
files="vim vimrc zshrc"

# create dotfiles_old in homedir
echo "Creating $olddir for backup of any existing dotfiles in ~"
mkdir -p $olddir
echo "...done"

# change to the dotfiles directory
echo "Changing to the $dir directory"
cd $dir
echo "...done"

echo "Moving any existing dotfiles from ~ to $olddir"
for file in $files; do
    mv -n ~/.$file $olddir/
    echo "Creating symlink to $file in home directory."
    ln -s $dir/$file ~/.$file
done
