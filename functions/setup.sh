#!/bin/zsh

set -Ceu

# 今のディレクトリ
BASEDIR=$(dirname $0)
cd $BASEDIR

BIN_DIR="/usr/local/bin"

# シンボリックリンクを作成
FILES=`find . -type f ! -name setup.sh | sed 's|\./||'`
for FILE in $FILES; do
    sudo ln -snfv ${PWD}/$FILE "$BIN_DIR/$FILE"
    chmod +x "$BIN_DIR/$FILE"
done

