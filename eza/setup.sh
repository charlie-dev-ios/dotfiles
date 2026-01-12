#!/bin/zsh

set -Ceu
cd $(dirname $0)

TARGET_DIR=$HOME/.config/eza
if ! [ -d $TARGET_DIR ]; then
    mkdir $TARGET_DIR
fi

FILES=`find . -type f ! -name setup.sh | sed 's|\./||'`
for FILE in $FILES; do
    ln -snfv ${PWD}/$FILE $TARGET_DIR/$FILE
done

