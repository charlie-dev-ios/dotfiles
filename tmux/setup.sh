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

THEME_DIR="$HOME/.tmux/themes"
THEME_REPO="https://raw.githubusercontent.com/folke/tokyonight.nvim/main/extras/tmux/tokyonight_moon.tmux"
if ! [ -d "${THEME_DIR}" ]; then
    mkdir $THEME_DIR
fi
curl -o "$THEME_DIR/tokyonight_storm.tmux" $THEME_REPO

