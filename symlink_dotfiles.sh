#!/bin/bash
# This script safely makes symlinks with dotfiles to keep all of my devices
# in sync. Before overwrriting any existing dotfiles with our new symlinked
# dotfiles, we make sure to move existing dotfiles into ~/dofiles_old
configfiles=".bashrc .vimrc .gitconfig .zshrc .zshfunctions"

# Move any existing dotfiles in ~ to dotfiles_old directory and then create 
# symlinks for all listed $configfiles from this dotfiles directory.
dotfiles_old=~/dotfiles_old
mkdir -p $dotfiles_old
for file in $configfiles; do
    if [ -e ~/$file ]; then
        echo "Moving $file from ~/ to ~$dotfiles_old/"
        mv ~/$file $dotfiles_old
    fi
    echo "Creating symlink to $file in home directory."
    ln -s `pwd`/$file ~/$file
done

# Package installation notes for new startup.
# - Cinnamon (If Ubuntu)
# - Git
# - Chrome
# - Terminator
# - zsh
# - xclip
# - compizconfig-settings-manager
# - VLC
# - redshift
