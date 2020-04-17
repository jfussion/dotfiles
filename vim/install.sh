#!/bin/bash

dir="$(cd "$(dirname "${script_name}")" && pwd)"

for vimrc in .vimrc.local .vimrc.local .vimrc.bundles.local
do
  ln -s "${dir}"/"${vimrc}" ~/"${vimrc}"
done

# install https://github.com/luan/vimfiles
sh <(curl https://j.mp/spf13-vim3 -L)
ln -s "${dir}"/init.vim "${HOME}"/.vim/init.vim
ln -s "${HOME}"/.vim "${HOME}"/.config/nvim

ln -s "${dir}"/colors "${HOME}"/.vim/colors
