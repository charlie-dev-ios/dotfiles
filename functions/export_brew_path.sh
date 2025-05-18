#!/bin/zsh

set -Ceu

if [[ "$(uname -m)" == "arm64" ]]; then
  BREW_PATH="/opt/homebrew"
elif [[ "$(uname -m)" == "x86_64" ]]; then
  BREW_PATH="/usr/local"
else
  echo "警告: 不明なアーキテクチャです。Homebrew のパス設定をスキップします。" >&2
  return
fi

if [ -d "${BREW_PATH}/bin" ]; then
  eval "$("${BREW_PATH}/bin/brew" shellenv)"
fi
