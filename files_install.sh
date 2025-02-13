#!/bin/sh
path=$(pwd)

# Home directory
ln -sf $path/gitconfig $HOME/.gitconfig
ln -sf $path/gitconfig.work $HOME/.gitconfig.work
ln -sf $path/zshenv $HOME/.zshenv
ln -sf $path/zshrc $HOME/.zshrc
ln -sf $path/psqlrc $HOME/.psqlrc

# Config directory

config_directory="config"
global_config_directory=".config"

# Config directory
[ ! -d $HOME/$global_config_directory ] && mkdir $HOME/$global_config_directory

ln -sf $path/$config_directory/starship.toml $HOME/$global_config_directory/starship.toml

[ -d $HOME/$global_config_directory/alacritty ] && rm -rf $HOME/$global_config_directory/alacritty
ln -sf $path/$config_directory/alacritty $HOME/$global_config_directory/alacritty

[ -d $HOME/$global_config_directory/neofetch ] && rm -rf $HOME/$global_config_directory/neofetch
ln -sf $path/$config_directory/neofetch $HOME/$global_config_directory/neofetch

[ -d $HOME/$global_config_directory/nvim ] && rm -rf $HOME/$global_config_directory/nvim
ln -sf $path/$config_directory/nvim $HOME/$global_config_directory/nvim

[ -d $HOME/$global_config_directory/zsh ] && rm -rf $HOME/$global_config_directory/zsh
ln -sf $path/$config_directory/zsh $HOME/$global_config_directory/zsh

[ -d $HOME/$global_config_directory/tmux ] && rm -rf $HOME/$global_config_directory/tmux
ln -sf $path/$config_directory/tmux $HOME/$global_config_directory/tmux
