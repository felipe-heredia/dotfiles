#!/bin/sh
path=$(pwd)

# Home directory
ln -sf $path/gitconfig $HOME/.gitconfig
ln -sf $path/zshenv $HOME/.zshenv
ln -sf $path/zshrc $HOME/.zshrc
ln -sf $path/hyper.js $HOME/.hyper.js



# Config directory

config_directory="config"
global_config_directory=".config"

ln -sf $path/$config_directory/vimrc $HOME/.vimrc

# Config directory
[ ! -d $HOME/$global_config_directory ] && mkdir $HOME/$global_config_directory

ln -sf $path/$config_directory/starship.toml $HOME/$global_config_directory/starship.toml

[ -d $HOME/$global_config_directory/alacritty ] && rm -rf $HOME/$global_config_directory/alacritty
ln -sf $path/$config_directory/alacritty $HOME/$global_config_directory/alacritty

[ -d $HOME/$global_config_directory/neofetch ] && rm -rf $HOME/$global_config_directory/neofetch
ln -sf $path/$config_directory/neofetch $HOME/$global_config_directory/neofetch

[ -d $HOME/$global_config_directory/nvim ] && rm -rf $HOME/$global_config_directory/nvim
ln -sf $path/$config_directory/nvim $HOME/$global_config_directory/nvim

[ -d $HOME/$global_config_directory/lvim ] && rm -rf $HOME/$global_config_directory/lvim
ln -sf $path/$config_directory/lvim $HOME/$global_config_directory/lvim

[ -d $HOME/$global_config_directory/zsh ] && rm -rf $HOME/$global_config_directory/zsh
ln -sf $path/$config_directory/zsh $HOME/$global_config_directory/zsh

[ -d $HOME/.tmux ] && rm -rf $HOME/.tmux
ln -sf $path/$config_directory/tmux $HOME/$global_config_directory/tmux

# Var Directory
#[ ! -d /var ] && sudo mkdir -p /var/spool/cron
#[ ! -d /var/spool ] && sudo mkdir -p /var/spool/cron
#[ -d /var/spool/cron ] && rm -rf /var/spool/cron
#sudo ln -sf $path/cron /var/spool/cron
