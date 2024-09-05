#!/bin/bash
set -e

## Brave Browser
sudo curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg

echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg] https://brave-browser-apt-release.s3.brave.com/ stable main"|sudo tee /etc/apt/sources.list.d/brave-browser-release.list

PROGRAMAS_PARA_INSTALAR=(
  tmux
  difftastic
  starship
  eza
  fd
  zoxide
  git
  keepassxc
  flameshot
  firefox
  neovim
  zsh
  curl
  fonts-roboto
  exa
  neovim
  python3-pip
  curl
  brave-browser
  plank
  postgresql
  postgresql-client
)

PPAS=(
)

## Atualizando Sistema ##
sudo apt update && sudo apt upgrade -y

for nome_do_ppa in "${PPAS[@]}"; do
    sudo add-apt-repository "$nome_do_ppa" -y
done

sudo apt update

for nome_do_programa in "${PROGRAMAS_PARA_INSTALAR[@]}"; do
    echo
    if ! dpkg -s "$nome_do_programa" >/dev/null 2>&1; then
        sudo apt-get install "$nome_do_programa" -y
    else
        echo "[INSTALADO] - $nome_do_programa"
    fi
done

PROGRAMAS_FLATPAK=(
  md.obsidian.Obsidian
  com.spotify.Client
  io.dbeaver.DBeaverCommunity
)

for nome_do_programa in "${PROGRAMAS_FLATPAK[@]}"; do
    echo
    if ! flatpak info "$nome_do_programa" >/dev/null 2>&1; then
        flatpak install "$nome_do_programa" -y
    else
        echo "[FLATPAK INSTALADO] - $nome_do_programa"
    fi
done

## Instalando nvm

[ ! -d $HOME/.nvm ] && curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.3/install.sh | bash

export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

## Configurando ZSH

# Instalando Oh-my-zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Instalando zinit
sh -c "$(curl -fsSL https://git.io/zinit-install)"

## Instalando Wallpapers ##
[ ! -d $HOME/Pictures/wallpapers ] && mkdir git clone https://gitlab.com/felipesuri/wallpapers.git ~/Pictures/wallpapers

## Rust

curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

## Instalando Lvim

LV_BRANCH='release-1.3/neovim-0.9' bash <(curl -s https://raw.githubusercontent.com/LunarVim/LunarVim/release-1.3/neovim-0.9/utils/installer/install.sh)

## Nerd Fonts
path=$(pwd)

if [ ! -d $path/nerd-fonts ] && git clone https://github.com/ryanoasis/nerd-fonts.git

./nerd-fonts/install.sh
