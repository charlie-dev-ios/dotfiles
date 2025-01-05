#!/bin/zsh

set -Ceu

# 今のディレクトリ
# dotfilesディレクトリに移動する
BASEDIR=$(dirname $0)
cd $BASEDIR

ln -snfv ${PWD}/.tmux.conf $HOME/.tmux.conf

TPM_DIR="$HOME/.tmux/plugins/tpm"
if ! [ -d "${TPM_DIR}" ]; then
    git clone https://github.com/tmux-plugins/tpm "$TPM_DIR"
fi

