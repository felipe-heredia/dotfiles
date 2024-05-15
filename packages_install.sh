#!/bin/bash
set -e

PROGRAMAS_PARA_INSTALAR=(
  bluez
  bluez-utils

  git
  keepassxc
  nextcloud-client
  flameshot
  firefox
  alacritty
  neovim
  zsh
  curl
  rust
  fuse
  okular
  pidgin
  pidgin-otr
  qbittorrent
  veracrypt
  eza
  bottom
  bandwhich
  starship
  fzf
  tmux
  gnucash
  tor
  torbrowser-launcher
  fd
  zoxide
  difftastic
)

## Atualizando Sistema ##
sudo pacman -Syu --noconfirm

## Adicionando Suporte ao AUR ##
git clone https://aur.archlinux.org/yay.git && cd yay && makepkg -si

## Instalar programas
for nome_do_programa in ${PROGRAMAS_PARA_INSTALAR[@]}; do
  echo
  if ! sudo pacman -Q $nome_do_programa; then # Só instala se já não estiver instalado
    sudo pacman -S "$nome_do_programa" --noconfirm
  else
    echo "[INSTALADO] - $nome_do_programa"
  fi
done


## Instalndo ZSH

## Instalando Pacotes yay ##

YAY_PROGRAMAS=(
  nvm
  spotify
  ttf-jetbrains-mono
  nerd-fonts-git
  ttf-roboto
  ttf-poppins
  stremio-beta
  grml-zsh-config
  minecraft-launcher
)

for programa in ${YAY_PROGRAMAS[@]}; do
  echo
  if ! sudo pacman -Q $programa; then # Só instala se já não estiver instalado
    yay -S "$programa" --noconfirm
  else
    echo "[INSTALADO] - $programa"
  fi
done

## Configurando dotfiles

## Configurando ZSH

# Instalando Oh-my-zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Instalando zinit
bash -c "$(curl --fail --show-error --silent --location https://raw.githubusercontent.com/zdharma-continuum/zinit/HEAD/scripts/install.sh)"

## Instalando Wallpapers ##
git clone https://gitlab.com/felipesuri/wallpapers.git ~/Pictures/wallpapers
