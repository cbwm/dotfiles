# reference: https://github.com/webpro/dotfiles/blob/master/Makefile

SHELL := /usr/bin/fish
DOTFILES_DIR := $(dirname $(realpath $(firstword $(MAKEFILE_LIST))))

backup: | ~/config_backup.tar
~/config_backup.tar:
	tar -cvf ~/config_backup.tar ~/.config

##### linux-only dots
linux: backup alias-linux kitty-linux common

alias-linux:
	ln -s $(DOTFILES_DIR)/linux-alias ~/.alias

kitty-linux:
	ln -s $(DOTFILES_DIR)/config/kitty-linux ~/.config/kitty

##### macos-only dots
macos: backup alias-macos kitty-macos common

alias-macos:
	ln -s $(DOTFILES_DIR)/macos-alias ~/.alias

kitty-macos:
	ln -s $(DOTFILES_DIR)/config/kitty-macos ~/.config/kitty

##### shared dots
common: fish nvim

fish: ~/.config/fish/functions/fisher.fish
	ln -s $(DOTFILES_DIR)/config/fish-linux ~/.config/fish
~/.config/fish/functions/fisher.fish:
	curl -sL https://git.io/fisher | source && fisher install jorgebucaran/fisher

nvim:
	ln -s $(DOTFILES_DIR)/config/nvim ~/.config/nvim
