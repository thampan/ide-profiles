#!/bin/bash
set -eux

mkdir -p ~/.vim/bundle/
mkdir -p ~/.vim/autoload/

wget https://raw.githubusercontent.com/tpope/vim-pathogen/master/autoload/pathogen.vim -P ~/.vim/autoload/
echo "execute pathogen#infect()" > ~/.vimrc
echo "filetype plugin indent on" >> ~/.vimrc
echo "syntax on" >> ~/.vimrc
echo "set ic" >> ~/.vimrc
echo "set shiftwidth=2" >> ~/.vimrc
echo "set tabstop=2" >> ~/.vimrc
echo "set bg=dark" >> ~/.vimrc

cd  ~/.vim/bundle
if [ ! -d  delimitMate ]; then
	git clone https://github.com/Raimondi/delimitMate.git 
fi
