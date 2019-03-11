#!/bin/bash

dir="$(cd "$(dirname "${script_name}")" && pwd)"

for vimrc in .vimrc.local .vimrc.local.plugins .vimrc.local.before
do
  ln -s "${dir}"/"${vimrc}" ~/"${vimrc}"
done

# install https://github.com/luan/vimfiles
curl vimfiles.luan.sh/install | bash

ln -s "${dir}"/colors "${HOME}"/.vim/colors
