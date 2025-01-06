#!/bin/zsh

set -Ceu

tmux new-session -A -s dotfiles -d
tmux split-window -t dotfiles -v
tmux send-keys -t dotfiles:0.0 "cd '$(ghq list --full-path | grep dotfiles)'" C-m
tmux send-keys -t dotfiles:0.0 "vim" C-m
tmux resize-pane -t dotfiles:0.0 -D 20
tmux resize-pane -t dotfiles:0.0 -Z
tmux attach-session -t dotfiles
