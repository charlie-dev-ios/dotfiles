#!/bin/zsh

set -Ceu

# dotfilesディレクトリに移動する
BASEDIR=$(dirname "$0")
cd "$BASEDIR/.obsidian"

DOTFILES_OBSIDIAN_DIR="${PWD}"
echo $DOTFILES_OBSIDIAN_DIR

OBSIDIAN_DIR="$HOME/Library/Mobile Documents/iCloud~md~obsidian/Documents/Vault/.obsidian"

# 既存の.obsidian2ディレクトリが存在する場合の処理
if [ -e "$OBSIDIAN_DIR" ]; then
    if [ -L "$OBSIDIAN_DIR" ]; then
        # すでにシンボリックリンクの場合は削除
        echo "Removing existing symlink: $OBSIDIAN_DIR"
        rm "$OBSIDIAN_DIR"
    elif [ -d "$OBSIDIAN_DIR" ]; then
        # 実ディレクトリの場合はバックアップを作成
        BACKUP_DIR="${OBSIDIAN_DIR}.backup.$(date +%Y%m%d_%H%M%S)"
        echo "Backing up existing directory to: $BACKUP_DIR"
        mv "$OBSIDIAN_DIR" "$BACKUP_DIR"
    else
        # ファイルの場合はエラー
        echo "Error: $OBSIDIAN_DIR exists but is not a directory or symlink"
        exit 1
    fi
fi

# dotfilesの.obsidianディレクトリへのシンボリックリンクを作成
echo "Creating symlink: $OBSIDIAN_DIR -> $DOTFILES_OBSIDIAN_DIR"
ln -s "$DOTFILES_OBSIDIAN_DIR" "$OBSIDIAN_DIR"

echo "Setup complete! Obsidian settings are now managed via dotfiles."


