#!/bin/zsh

set -Ceu

# 今のディレクトリ
# dotfilesディレクトリに移動する
BASEDIR=$(dirname $0)
cd $BASEDIR

VIM_DIR="$HOME/.config/nvim"
if ! [ -d $VIM_DIR ]; then
    mkdir $VIM_DIR
fi

# ディレクトリ構造を再現
DIRS=`find . -type d -mindepth 1 | sed 's|^\./||'`
for dir in $DIRS; do
    TARGET_DIR="$VIM_DIR/$dir"
    if ! [ -d $TARGET_DIR ]; then
        mkdir $TARGET_DIR
    fi
done

# シンボリックリンクを作成
FILES=`find . -type f ! -name setup.sh | sed 's|\./||'`
for FILE in $FILES; do
    ln -snfv ${PWD}/$FILE $VIM_DIR/$FILE
done

