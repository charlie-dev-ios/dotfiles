#!/bin/zsh

# 今のディレクトリ
# dotfilesディレクトリに移動する
BASEDIR=$(dirname $0)
cd $BASEDIR

files=`find ${PWD} -name ".*" -type f -maxdepth 1`
for file in $files; do
    # シンボリックリンクを貼る
    ln -snfv $file ~
done

cd .prezto/runcoms
files=`find ${PWD} -name ".*" -type f -maxdepth 1`
for file in $files; do
    # シンボリックリンクを貼る
    echo $file
    ln -snfv $file ~
    # prezto自体にもシンボリックリンクを貼る必要がある
    ln -snfv $file ~/.zprezto/runcoms
done
