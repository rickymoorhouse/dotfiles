#!/bin/bash
if [ ! -d backups ]; 
then
  mkdir backups
fi

for DOTFILE in bashrc bash_profile profile vim vimrc
do
  if [ -L ~/.$DOTFILE ]; 
  then
    echo ~/.$DOTFILE is a symlink
    ls -la ~/.$DOTFILE
  else
    echo $DOTFILE not a symlink so replacing
    mv ~/.$DOTFILE ~/dotfiles/backups/$DOTFILE
    ln -s ~/dotfiles/$DOTFILE ~/.$DOTFILE
  fi
done
