# tmux内ではない場合はtmuxを起動
if [ -z "$TMUX" ]; then
  tmux new-session -A -s session1
fi

# mise
eval "$(mise activate zsh)"

# starship
eval "$(starship init zsh)"

# alias
alias repo='cd "$(ghq list --full-path | fzf)"'
alias ll-old='ls -laG'
alias ll='eza --long --color=always --color-scale=all --color-scale-mode=gradient --icons --hyperlink \
--all --ignore-glob=.git \
--header --time=modified --git --time-style='+%Y/%m/%d %H:%M' --octal-permissions --no-user'
alias tt='tmux'
alias vim='nvim'
alias dotfiles='setup_tmux_dotfiles.sh'

### MANAGED BY RANCHER DESKTOP START (DO NOT EDIT)
export PATH="$HOME/.rd/bin:$PATH"
### MANAGED BY RANCHER DESKTOP END (DO NOT EDIT)

