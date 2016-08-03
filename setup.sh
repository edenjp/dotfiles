#!/bin/bash

export bashrc_file=~/.bashrc

dotfiles=$(ls -A dotfiles| egrep '^\.')
for i in $dotfiles
do
  ln -fs $PWD/dotfiles/$i ~/$i || echo "did not create symlink for $i because file ~/$i already exists"
done

grep bashrc_includes $bashrc_file || echo "source ~/.bashrc_includes" >> $bashrc_file

source $bashrc_file

echo "done!"
