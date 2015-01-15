#!/bin/bash
# This script also synchronizes .config/folders in a similar fashion.
configfolders="terminator compiz-1"

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
