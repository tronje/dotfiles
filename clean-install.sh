#! /bin/bash

# NOTE:
# DO NOT RUN THIS IF YOU HAVEN'T BACKED UP YOUR CONFIG FILES
# READ THIS SCRIPT CAREFULLY AND ONLY EXECUTE IT IF YOU ARE
# AWARE OF WHAT IT DOES, AND THAT THAT'S WHAT YOU WANT TO HAPPEN!

path=~/dotfiles

# delete files in order to be able to create symlinks later
# make sure to backup these files if you're not sure what you're doing
rm ~/.i3/config ~/.zshr ~/.vimrc ~/.gvimrc ~/.config/i3status/config ~/.config/termite/config ~/.rtorrent.rc

ln -s $path/rtorrent.rc ~/.rtorrent.rc
ln -s $path/vimrc ~/.vimrc
ln -s $path/zshrc ~/.zshrc
ln -s $path/i3/config ~/.i3/config
ln -s $path/config/i3status/config ~/.config/i3status/config
ln -s $path/config/termite/config ~/.config/termite/config
