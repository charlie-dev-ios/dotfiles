#!/bin/zsh

set -Ceu

# 今のディレクトリ
# dotfilesディレクトリに移動する
BASEDIR=$(dirname $0)
cd $BASEDIR

if which brew >/dev/null; then
    echo "🚀brew is already installed."
else
    echo "🚀install brew"
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    sh export_brew_path.sh
fi

# brewでパッケージのインストール

# CLI tools
PACKAGE_NAMES=("mise" "tmux" "ghostty")
# GUI tools
# PACKAGE_NAMES+=("spotify" "1password" "notion" "raycast" "google-chrome")
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
