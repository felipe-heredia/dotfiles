#!/usr/bin/env zsh
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
  gnome-boxes
  neovim
  wireguard-tools
  zsh
  curl
  rust
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
#sudo pacman -S zsh 
#sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Instalando NVM

## Instalando Pacotes yay ##

YAY_PROGRAMAS=(
  nvm
  spotify
  whatsapp-nativefier-dark
  insomnia-bin
  ttf-jetbrains-mono
  nerd-fonts-complete
  ttf-roboto
  ttf-poppins
  stremio-beta
  lbry-app-bin
  lunarvim-git
)

for programa in ${YAY_PROGRAMAS[@]}; do
  echo
  if ! sudo pacman -Q $programa; then # Só instala se já não estiver instalado
    yay -S "$programa"
  else
    echo "[INSTALADO] - $programa"
  fi
done
## Configurando dotfiles

cp .zshrc ~/.zshrc
cp .gitconfig ~/.gitconfig
cp .config/ ~/.config -r

## Configurando ZSH

# Instalando Oh-my-zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Instalando zinit
sh -c "$(curl -fsSL https://git.io/zinit-install)"

# Instalando spaceship-prompt
git clone https://github.com/spaceship-prompt/spaceship-prompt.git "$ZSH_CUSTOM/themes/spaceship-prompt" --depth=1

## Instalando Wallpapers ##
git clone https://gitlab.com/felipesuri/wallpapers.git ~/Pictures/wallpapers
