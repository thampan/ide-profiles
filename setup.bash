#!/bin/bash
set -eux

mkdir -p ~/.vim/bundle/
mkdir -p ~/.vim/autoload/

plugins=(
Raimondi/delimitMate.git
yegappan/mru.git
preservim/nerdtree.git
WolfgangMehner/c-support.git
#inkarkat/vim-ConflictMotions.git
vim-scripts/Conque-GDB.git
inkarkat/vim-ingo-library.git
Shougo/neocomplete.vim.git
vim-syntastic/syntastic.git
ntpeters/vim-better-whitespace.git
altercation/vim-colors-solarized.git
mptre/vim-printf.git
thinca/vim-quickrun.git
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
		git clone https://github.com/$f
	fi
done
popd

