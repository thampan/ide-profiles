#!/bin/bash
set -eu

DIRNAME=$(dirname {$(basename $0)})
FILES=$DIRNAME/files
mkdir -p ~/.vim/bundle/
mkdir -p ~/.vim/autoload/
mapfile  -t plugins < $FILES/plugins.conf
mapfile  -t vimrc   < $FILES/vimrc_settings.conf

if [ ! -f  /home/$USER/.vim/autoload/ ]; then
   wget https://github.com/tpope/vim-pathogen/tree/master/autoload/pathogen.vim -P ~/.vim/autoload/
fi

# Flush exisiting configurations
echo > ~/.vimrc 

# Pump the new configuration as specified in `files/vimrc_settings.conf`
for settings in "${vimrc[@]}";
do
  if [[ $settings == "#"* ]];
  then
    continue;
  fi
  echo $settings >> ~/.vimrc
done

pushd  ~/.vim/bundle

# Pump the new configuration as specified in `files/plugins.conf`
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

