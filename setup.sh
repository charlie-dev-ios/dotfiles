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

# brewでパッケージのインストール
PACKAGE_NAMES=("eza" "peco" "ghq")

for PACKAGE_NAME in "${PACKAGE_NAMES[@]}"; do
    if which "${PACKAGE_NAME}" >/dev/null; then
        echo "🚀${PACKAGE_NAME} is already installed."
    else
        echo "🚀install ${PACKAGE_NAME}"
        brew install ${PACKAGE_NAME}
    fi
done
