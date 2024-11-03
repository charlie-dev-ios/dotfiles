#!/bin/zsh

set -Ceu

# 今のディレクトリ
# dotfilesディレクトリに移動する
BASEDIR=$(dirname $0)
cd $BASEDIR

if ! [ -d ~/.config/alacritty ]; then
    mkdir ~/.config/alacritty
fi

ln -snfv ${PWD}/alacritty.toml ~/.config/alacritty/alacritty.toml
