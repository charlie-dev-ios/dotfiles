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

# miseで各CLIをインストール
ln -snfv ${PWD}/config.toml ~/.config/mise/config.toml
cd ~
mise i
