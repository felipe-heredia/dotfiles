#!/bin/sh
path=$(pwd)

# Home directory
ln -sf $path/.gitconfig $HOME/.gitconfig
ln -sf $path/.gitconfig.work $HOME/.gitconfig.work
ln -sf $path/.zprofile $HOME/.zprofile
ln -sf $path/zshenv $HOME/.zshenv
ln -sf $path/.zsh_aliases $HOME/.zsh_aliases
ln -sf $path/zshrc $HOME/.zshrc
ln -sf $path/psqlrc $HOME/.psqlrc

# Config directory

CONFIG_DIRECTORY="config"
GLOBAL_CONFIG_DIRECTORY=".config"

[ ! -d $HOME/$GLOBAL_CONFIG_DIRECTORY ] && mkdir $HOME/$GLOBAL_CONFIG_DIRECTORY

[ -d $HOME/$GLOBAL_CONFIG_DIRECTORY/alacritty ] && rm -rf $HOME/$GLOBAL_CONFIG_DIRECTORY/alacritty
ln -sf $path/$CONFIG_DIRECTORY/alacritty $HOME/$GLOBAL_CONFIG_DIRECTORY/alacritty

[ -d $HOME/.themes ] && rm -rf $HOME/.themes
ln -sf $path/.themes $HOME/.themes

[ -d $HOME/$GLOBAL_CONFIG_DIRECTORY/neofetch ] && rm -rf $HOME/$GLOBAL_CONFIG_DIRECTORY/neofetch
ln -sf $path/$CONFIG_DIRECTORY/neofetch $HOME/$GLOBAL_CONFIG_DIRECTORY/neofetch

[ -d $HOME/$GLOBAL_CONFIG_DIRECTORY/zsh ] && rm -rf $HOME/$GLOBAL_CONFIG_DIRECTORY/zsh
ln -sf $path/$CONFIG_DIRECTORY/zsh $HOME/$GLOBAL_CONFIG_DIRECTORY/zsh

[ -d $HOME/$GLOBAL_CONFIG_DIRECTORY/.tmux ] && rm -rf $HOME/$GLOBAL_CONFIG_DIRECTORY/.tmux
ln -sf $path/$CONFIG_DIRECTORY/tmux $HOME/$GLOBAL_CONFIG_DIRECTORY/tmux

[ -d $HOME/$CONFIG_DIRECTORY/nvim ] && rm -rf $HOME/$GLOBAL_CONFIG_DIRECTORY/nvim
ln -sf $path/$CONFIG_DIRECTORY/nvim $HOME/$GLOBAL_CONFIG_DIRECTORY/nvim

ln -sf $path/$CONFIG_DIRECTORY/starship.toml $HOME/$GLOBAL_CONFIG_DIRECTORY/starship.toml

dconf load /org/cinnamon/ < cinnamon_desktop_backup
