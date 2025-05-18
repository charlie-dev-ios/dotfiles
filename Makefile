.PHONY: setup
setup:
	sh functions/setup.sh
	sh zsh/setup.sh
	sh install_brew_packages.sh
	sh mise/setup.sh
	sh tmux/setup.sh
	sh vim/setup.sh
	sh term/setup.sh
	sh env/setup.sh
	sh ghostty/setup.sh
	sh starship/setup.sh

