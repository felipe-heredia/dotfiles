#!/bin/sh
path=$(pwd)

# Home directory
ln -sf $path/.gitconfig $HOME/.gitconfig
ln -sf $path/.zprofile $HOME/.zprofile
ln -sf $path/.zshenv $HOME/.zshenv
ln -sf $path/.zsh_aliases $HOME/.zsh_aliases
ln -sf $path/.zshrc $HOME/.zshrc
ln -sf $path/.hyper.js $HOME/.hyper.js

# Config directory
[ ! -d $HOME/.config ] && mkdir $HOME/.config

[ -d $HOME/.config/alacritty ] && rm -rf $HOME/.config/alacritty
ln -sf $path/.config/alacritty $HOME/.config/alacritty

[ -d $HOME/.themes ] && rm -rf $HOME/.themes
ln -sf $path/.themes $HOME/.themes

[ -d $HOME/.config/neofetch ] && rm -rf $HOME/.config/neofetch
ln -sf $path/.config/neofetch $HOME/.config/neofetch

[ -d $HOME/.config/nvim ] && rm -rf $HOME/.config/nvim
ln -sf $path/.config/nvim $HOME/.config/nvim

[ -d $HOME/.config/lvim ] && rm -rf $HOME/.config/lvim
ln -sf $path/.config/lvim $HOME/.config/lvim

dconf load /org/cinnamon/ < cinnamon_desktop_backup
