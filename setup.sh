#!/bin/bash

set -e

dotfiles=$(ls -A | egrep '^\.' | grep -v ^.git$)
for i in $dotfiles
do
  ln -s $PWD/$i ~/$i || echo "did not create symlink for $i because file ~/$i already exists"
done

echo "done!"