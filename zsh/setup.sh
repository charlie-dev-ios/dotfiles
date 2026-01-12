#!/bin/zsh

set -Ceu

# 今のディレクトリ
# dotfilesディレクトリに移動する
BASEDIR=$(dirname $0)
cd $BASEDIR

RUNCOMS=`find ${PWD} -type f ! -name setup.sh -maxdepth 1`
for file in $RUNCOMS; do
    # シンボリックリンクを貼る
    ln -snfv $file $HOME
done

