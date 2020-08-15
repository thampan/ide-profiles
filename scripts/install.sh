#!/bin/bash
set -eux

mkdir -p ~/.vim/bundle/
mkdir -p ~/.vim/autoload/
mapfile  -t plugins < plugins.txt
mapfile  -t vimrc   < vimrc_settings.txt

if [ ! -f  /home/$USER/.vim/autoload/ ]; then
	wget https://raw.githubusercontent.com/tpope/vim-pathogen/master/autoload/pathogen.vim -P ~/.vim/autoload/
fi

for settings in "${vimrc[@]}";
do
	echo $settings >> ~/vimrc
done

pushd  ~/.vim/bundle
for f in ${plugins[@]};
do
	if [[ $f == "#"* ]];
	then
		continue;
	fi
	folder=${f##*/}
	if [ ! -d  ${folder%.*} ]; then
		git clone https://github.com/$f
	fi
done
popd

