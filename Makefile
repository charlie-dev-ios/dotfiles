.PHONY: setup
setup:
	sh zsh/setup.sh
	sh install_brew_packages.sh
	sh mise/setup.sh
	sh alacritty/setup.sh
	sh tmux/setup.sh
	sh vim/setup.sh
	sh term/setup.sh
	sh functions/setup.sh
	zsh env/setup.sh
	zsh ghostty/setup.sh
	zsh starship/setup.sh

