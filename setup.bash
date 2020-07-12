#!/bin/bash
set -eux

mkdir -p ~/.vim/bundle/
mkdir -p ~/.vim/autoload/

plugins=(
https://github.com/Raimondi/delimitMate.git 
https://github.com/yegappan/mru.git
https://github.com/preservim/nerdtree.git
git://github.com/altercation/vim-colors-solarized.git
)

if [ ! -f  /home/$USER/.vim/autoload/ ]; then
	wget https://raw.githubusercontent.com/tpope/vim-pathogen/master/autoload/pathogen.vim -P ~/.vim/autoload/
fi

echo "execute pathogen#infect()" > ~/.vimrc
echo "filetype plugin indent on" >> ~/.vimrc
echo "syntax on" >> ~/.vimrc
echo "set ic" >> ~/.vimrc
#echo "set background=dark" >> ~/.vimrc
#echo "colorscheme	solarized" >> ~/.vimrc
echo "set shiftwidth=2" >> ~/.vimrc
echo "set tabstop=2" >> ~/.vimrc
echo "set bg=dark" >> ~/.vimrc

pushd  ~/.vim/bundle
for f in ${plugins[@]};
do
	folder=${f##*/}
	if [ ! -d  ${folder%.*} ]; then
		git clone $f
	fi
done
popd

