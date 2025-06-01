#!/bin/zsh

set -Ceu

# 今のディレクトリ
# dotfilesディレクトリに移動する
BASEDIR=$(dirname $0)
cd $BASEDIR

# brewでパッケージのインストール

# CLI tools
PACKAGE_NAMES=("mise" "tmux" "ghostty")
# GUI tools
# PACKAGE_NAMES+=("spotify" "1password" "notion" "raycast" "google-chrome" "visual-studio-code")
# fonts
PACKAGE_NAMES+=("font-meslo-lg-nerd-font")

for PACKAGE_NAME in "${PACKAGE_NAMES[@]}"; do
    if which "${PACKAGE_NAME}" >/dev/null; then
        echo "🚀${PACKAGE_NAME} is already installed."
    else
        echo "🚀install ${PACKAGE_NAME}"
        brew install ${PACKAGE_NAME}
    fi
done

echo "💻ターミナルを再起動してください"
