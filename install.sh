#!/usr/bin/env bash
set -e

PROGRAMAS_PARA_INSTALAR=(
  git
  keepassxc
  telegram-desktop
  discord
  flameshot
  firefox
  alacritty
  dbeaver
  galculator
  gnucash
  minder
  veracrypt
  gnome-boxes
  neovim
  wireguard-tools
  zsh
  curl
)

## Atualizando Sistema ##
sudo pacman -Syu --noconfirm

## Adicionando Suporte ao AUR ##
git clone https://aur.archlinux.org/yay.git && cd yay && makepkg -si

## Instalar programas
for nome_do_programa in ${PROGRAMAS_PARA_INSTALAR[@]}; do
  echo
  if ! sudo pacman -Q $nome_do_programa; then # Só instala se já não estiver instalado
    sudo pamacn -S "$nome_do_programa" --noconfirm
  else
    echo "[INSTALADO] - $nome_do_programa"
  fi
done


## Instalndo ZSH
#sudo pacman -S zsh 
#sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

## Instalando Pacotes yay ##

YAY_PROGRAMAS=(
  spotify
  insomnia
  #whatsapp-nativefier
  ttf-jetbrains-mono
  ttf-roboto
  ttf-poppins
  nvm # Node Version Manager
  stremio
  lbry
)

for programa in ${YAY_PROGRAMAS[@]}; do
  echo
  if ! sudo pacman -Q $programa; then # Só instala se já não estiver instalado
    sudo yay -S "$programa"
  else
    echo "[INSTALADO] - $programa"
  fi
done

## Configurando dotfiles

cp .zshrc ~/.zshrc
cp .gitconfig ~/.gitconfig
cp .config/ ~/.config

## Configurando sistema para desenvolver ##

zsh

## Configurando ZSH

# Instalando Oh-my-zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Instalando zinit
sh -c "$(curl -fsSL https://git.io/zinit-install)"

# Instalando spaceship-prompt
git clone https://github.com/spaceship-prompt/spaceship-prompt.git "$ZSH_CUSTOM/themes/spaceship-prompt" --depth=1

# Instalando Node
nvm install --lts

# Instalando Lunarvim
bash <(curl -s https://raw.githubusercontent.com/lunarvim/lunarvim/master/utils/installer/install.sh)

## Instalando Wallpapers ##
git clone git@gitlab.com:felipesuri/wallpapers.git ~/Pictures/

