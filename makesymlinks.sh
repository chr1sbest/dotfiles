#!/bin/bash
# This script creates symlinks from the home directory to any desired 
# dotfiles in ~/dotfiles, moves old dotfiles to dotfiles_old, and copies 
# specified config folders into .config.

# list of files/folders to symlink to ~
configfiles=".bashrc .vimrc .gitconfig .zshrc"

# create dotfiles_old in homedir
dotfiles_old=~/dotfiles_old
echo "Creating $dotfiles_old for backup of any existing dotfiles in ~/"
mkdir -p $dotfiles_old

# move any existing dotfiles in homedir to dotfiles_old directory, 
# then create symlinks 
for file in $configfiles; do
    if [ -e ~/$file ]; then
        echo "Moving $file from ~/ to ~$dotfiles_old/"
        mv ~/$file $dotfiles_old
    fi
    echo "Creating symlink to $file in home directory."
    ln -s `dirname $0`/$file ~/
done

#cp .config/terminator/config ~/.config/terminator/config

# Package installation notes:
# - Cinnamon (If Ubuntu)
# - Git
# - Chrome
# - Terminator
# - zsh
# - xclip
# - compizconfig-settings-manager
# - VLC
