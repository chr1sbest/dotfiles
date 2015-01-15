dotfiles
========

- This repository contains my configuration dotfiles for various applications.
- symlink_dotfiles moves current dotfiles in the home directory into a backup folder and then create symlinks to the dotfiles in this repository. Using symlinks, it's easy to proagate configuration changes through all devices using a simple git pull command.
- restore_old_dotfiles removes the symlinks and moves the old dotfiles back into the home direcory.
