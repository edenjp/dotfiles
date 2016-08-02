#!/bin/bash -e

export bashrc_file=~/.bashrc

dotfiles=$(ls -A | egrep '^\.' | grep -v ^.git$)
for i in $dotfiles
do
  ln -sf $PWD/$i ~/$i || echo "did not create symlink for $i because file ~/$i already exists"
done

grep bashrc_includes $bashrc_file || echo "source .bashrc_includes" >> $bashrc_file

source $bashrc_file

echo "done!"