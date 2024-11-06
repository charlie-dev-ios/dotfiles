#!/bin/zsh

set -Ceu

# 今のディレクトリ
# dotfilesディレクトリに移動する
BASEDIR=$(dirname $0)
cd $BASEDIR

ALACRITTY_DIR=$HOME/.config/alacritty
if ! [ -d $ALACRITTY_DIR ]; then
    mkdir $ALACRITTY_DIR
fi

ln -snfv ${PWD}/alacritty.toml $HOME/.config/alacritty/alacritty.toml
ln -snfv ${PWD}/dracula.toml $HOME/.config/alacritty/dracula.toml
