#!/bin/bash
# This script safely makes symlinks with dotfiles to keep all of my devices
# in sync. Before overwrriting any existing dotfiles with our new symlinked
# dotfiles, we make sure to move existing dotfiles into ~/dofiles_old
# This script also synchronizes .config/folders in a similar fashion.

# List of files/folders to symlink to the home directory.
configfiles=".bashrc .vimrc .gitconfig .zshrc"
configfolders="terminator compiz-1"

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

# Move any existing config folders in ~/.config to ~/.config_old directory 
# and then make symlinks for all folders listed in $configfolders.
if [ ! -e ~/.config ]; then
    mkdir  ~/.config
fi
config_old=~/.config_old
echo "Creating $config_old to backup any existing config folders in ~/.config"
mkdir -p $config_old
for folder in $configfolders; do
    if [ -e ~/.config/$folder ]; then
        echo "Moving $folder from ~/.config to $config_old"
        mv ~/.config/$folder $config_old/$folder
    fi
    echo "Creating symlink to $folder in ~/.config directory."
    ln -s `pwd`/.config/$folder ~/.config/$folder
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
