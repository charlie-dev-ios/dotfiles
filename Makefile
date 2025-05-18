.PHONY: initial-setup
initial-setup:
	sh functions/setup.sh
	sh zsh/setup.sh

.PHONY: install-brew
install-brew:
	sh brew/install-brew.sh

.PHONY: install-brew-packages
install-brew-packages:
	sh brew/install_brew_packages.sh

.PHONY: setup
setup:
	sh mise/setup.sh
	sh tmux/setup.sh
	sh vim/setup.sh
	sh term/setup.sh
	sh env/setup.sh
	sh ghostty/setup.sh
	sh starship/setup.sh

