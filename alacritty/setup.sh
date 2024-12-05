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

# シンボリックリンクを作成
FILES=`find . -type f ! -name setup.sh | sed 's|\./||'`
for FILE in $FILES; do
    ln -snfv ${PWD}/$FILE $ALACRITTY_DIR/$FILE
done
