#!/bin/bash
# This script removes symlinked dotfiles from home directory and moves old
# dotfiles back into place.

# List of files/folders to symlink to the home directory.
configfiles=".bashrc .vimrc .gitconfig .zshrc"

for file in $configfiles; do
    # If the file was previously displaced when the symlink was added, move that
    # old file back into the home directory after removing the current symlink.
    if [ -L ~/$file ] && [ -e ~/dotfiles_old/$file ]; then
        rm -rf ~/$file
        mv ~/dotfiles_old/$file ~/$file
    fi
done
rm -rf ~/dotfiles_old
