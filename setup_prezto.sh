#!/bin/zsh

set -Ceu

# 今のディレクトリ
# dotfilesディレクトリに移動する
BASEDIR=$(dirname $0)
cd $BASEDIR

# prezto関係の設定
ln -snfv ${PWD}/.p10k.zsh ~/.p10k.zsh

cd .prezto/runcoms
runcoms=`find ${PWD} -name ".*" -type f -maxdepth 1`
for file in $runcoms; do
    # シンボリックリンクを貼る
    ln -snfv $file ~
    # prezto自体にもシンボリックリンクを貼る必要がある
    ln -snfv $file ~/.zprezto/runcoms
done

# p10k用のフォントのインストール
cd ../../
cp -r fonts/ ~/Library/Fonts
