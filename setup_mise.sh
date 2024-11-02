#!/bin/zsh

set -Ceu

# 今のディレクトリ
# dotfilesディレクトリに移動する
BASEDIR=$(dirname $0)
cd $BASEDIR

# グローバル用のconfig.tomlがなければ作成
if ! [ -d ~/.config/mise ]; then
    mkdir ~/.config/mise
fi

if ! [ -f ~/.config/mise/config.toml ]; then
    touch ~/.config/mise/config.toml
fi

# miseで各CLIをインストール
ln -snfv ${PWD}/.config/mise/config.toml ~/.config/mise/config.toml
cd ~
mise i
