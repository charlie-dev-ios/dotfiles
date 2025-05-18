#!/bin/zsh

set -Ceu

# 今のディレクトリ
# dotfilesディレクトリに移動する
BASEDIR=$(dirname $0)
cd $BASEDIR

eval "$(mise activate zsh)"

# グローバル用のconfig.tomlがなければ作成
MISE_DIR=$HOME/.config/mise
if ! [ -d $MISE_DIR ]; then
    mkdir $MISE_DIR
fi

# miseで各CLIをインストール
ln -snfv ${PWD}/config.toml $HOME/.config/mise/config.toml
cd $HOME
mise i
