#!/bin/zsh

set -Ceu

tmux new-session -A -s dotfiles -d
tmux rename-window -t dotfiles:0 nvim
tmux new-window -t dotfiles -n zsh
tmux select-window -t dotfiles:0
tmux send-keys -t dotfiles "cd '$(ghq list --full-path | grep dotfiles)'" C-m
tmux send-keys -t dotfiles "vim" C-m
tmux attach-session -t dotfiles
