#!/bin/zsh

set -Ceu

# 今のディレクトリ
# dotfilesディレクトリに移動する
BASEDIR=$(dirname $0)
cd $BASEDIR

# brewでパッケージのインストール
PACKAGE_NAMES=("mise" "tmux")

for PACKAGE_NAME in "${PACKAGE_NAMES[@]}"; do
    if which "${PACKAGE_NAME}" >/dev/null; then
        echo "🚀${PACKAGE_NAME} is already installed."
    else
        echo "🚀install ${PACKAGE_NAME}"
        brew install ${PACKAGE_NAME}
    fi
done
