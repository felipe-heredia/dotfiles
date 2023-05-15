#!/bin/bash
set -e

PROGRAMAS_PARA_INSTALAR=(
  git
  keepassxc
  flameshot
  firefox
  dbeaver
  neovim
  zsh
  curl
  btm
  insomnia
  fonts-jetbrains-mono
  fonts-roboto
)

## Atualizando Sistema ##
sudo apt update && sudo apt upgrade -y

for nome_do_programa in "${PROGRAMAS_PARA_INSTALAR[@]}"; do
    echo
    if ! dpkg -s "$nome_do_programa" >/dev/null 2>&1; then
        sudo apt-get install "$nome_do_programa" -y
    else
        echo "[INSTALADO] - $nome_do_programa"
    fi
done

## Instalando nvm

curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.3/install.sh | bash

export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

## Configurando dotfiles

## Configurando ZSH

# Instalando Oh-my-zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Instalando zinit
sh -c "$(curl -fsSL https://git.io/zinit-install)"

# Instalando spaceship-prompt
git clone https://github.com/spaceship-prompt/spaceship-prompt.git "$ZSH_CUSTOM/themes/spaceship-prompt" --depth=1

## Instalando Wallpapers ##
git clone https://gitlab.com/felipesuri/wallpapers.git ~/Pictures/wallpapers

# Flatpak

flatpak install flathub com.spotify.Client
