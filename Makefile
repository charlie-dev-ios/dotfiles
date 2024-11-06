.PHONY: setup
setup:
	sh prezto/setup.sh
	sh install_brew_packages.sh
	sh mise/setup.sh
	sh alacritty/setup.sh
	sh tmux/setup.sh

