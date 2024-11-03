.PHONY: setup
setup:
	sh setup_prezto.sh
	sh install_brew_packages.sh
	sh setup_mise.sh
	sh alacritty/setup.sh
	sh tmux/setup.sh

