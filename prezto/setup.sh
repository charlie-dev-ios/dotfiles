#!/bin/zsh

set -Ceu

# 今のディレクトリ
# dotfilesディレクトリに移動する
BASEDIR=$(dirname $0)
cd $BASEDIR

# prezto自体のインストール
if ! [ -d "${ZDOTDIR:-$HOME}/.zprezto" ]; then
    git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"
fi

# prezto関係の設定
RUNCOMS=`find ${PWD} -name ".*" -type f -maxdepth 1`
for file in $RUNCOMS; do
    # シンボリックリンクを貼る
    ln -snfv $file $HOME
done

# p10k用のフォントのインストール
cp -r ${PWD}/../fonts/ $HOME/Library/Fonts
