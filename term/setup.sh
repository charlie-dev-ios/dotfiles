#!/bin/zsh

set -Ceu

# 今のディレクトリ
# dotfilesディレクトリに移動する
BASEDIR=$(dirname $0)
cd $BASEDIR

# infocmp tmux-256color > ./tmux-256color.info
# 上記で実行して得たterminfoに"Smulx=\E[4\:%p1%dm,"を足したものをコミットしている
# このterminfoを固めてtmuxやneovimから使用する
# これがないとtmux > neovimでアンダーカールの表示ができない
tic -xe tmux-256color ./tmux-256color.info

# infocmp -lx | grep Smulx
# 上記コマンドで現在の$TERMにアンダーカールの設定が入っているか確認できる
