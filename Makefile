CURRENT_DIR := $(shell dirname $(realpath $(lastword $(MAKEFILE_LIST))))

help:
	@echo "install - install all configs available"
	@echo "install-vim - install Vim's config"
	@echo "install-tmux - install tmux's config"
	@echo "install-iterm - generate a dynamic profile for iTerm2 and install it"


install: install-vim install-tmux


install-vim:
	if [ -h ~/.vimrc ]; \
	then \
		rm ~/.vimrc; \
		echo "Removed existing symlink just in case."; \
	elif [ -f ~/.vimrc ]; \
	then \
		mv ~/.vimrc ~/.vimrc.backup; \
		echo "Saved existing Vim's configuration as ".vimrc.backup"."; \
	fi; \
	ln -s $(CURRENT_DIR)/vimrc ~/.vimrc; \
	printf "\e[34;5;120m"; \
	printf "Vim's config installed! \n"; \
	printf "\e[0m"


install-tmux:
	if [ -h ~/.tmux.conf ]; \
	then \
		rm ~/.tmux.conf; \
		echo "Removed existing symlink just in case."; \
	elif [ -f ~/.tmux.conf ]; \
	then \
		mv ~/.tmux.conf ~/.tmux.conf.backup; \
		echo "Saved existing tmux's configuration as \".tmux.conf.backup\"."; \
	fi; \
	ln -s $(CURRENT_DIR)/tmux.conf ~/.tmux.conf; \
	printf "\e[34;5;120m"; \
	printf "Tmux's config installed! \n"; \
	printf "\e[0m"


install-iterm:
	cat iTerm2Dynamic.base | sed 's/@GUID/'$(shell uuidgen)'/g' > ~/Library/Application\ Support/iTerm2/DynamicProfiles/zeroProfile
