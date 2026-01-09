#!/bin/bash
set -e

if grep -q "ID=arch" /etc/os-release; then
  OS="arch"
  PKG_MANAGER="sudo pacman -S --noconfirm"
  AUR_HELPER="yay -S --noconfirm"
elif grep -q "ID=ubuntu\|ID=debian\|ID=linuxmint" /etc/os-release; then
  OS="debian"
  PKG_MANAGER="sudo apt install -y"
else
  echo "Unsupported OS"
  exit 1
fi

COMMON_PROGRAMS=(
  stow
  bluez bluez-utils
  git neovim tmux difftastic starship eza fd zoxide
  docker docker-compose python3-pip less fzf bottom
  keepassxc flameshot firefox curl
  postgresql rust go 
)

if [ "$OS" == "debian" ]; then
  OS_PROGRAMS=(plank postgresql-client fonts-roboto)
  sudo apt update && sudo apt upgrade -y
elif [ "$OS" == "arch" ]; then
  sudo pacman -Syu --noconfirm
fi

for pkg in $COMMON_PROGRAMS $OS_PROGRAMS; do
  echo "Installing: $pkg"

  if [ "$OS" == "debian" ]; then
    if ! dpkg -s "$pkg" >/dev/null 2>&1; then
      $PKG_MANAGER "$pkg"
    else
      echo "[INSTALLED] - $pkg"
    fi
    elif [ "$OS" == "arch" ]; then
      if ! pacman -Q "$pkg" >/dev/null 2>&1; then
        $PKG_MANAGER "$pkg"
      else
        echo "[INSTALLED] - $pkg"
      fi
    fi
done

if [ "$OS" == "debian" ]; then
  FLATPAK_PROGRAMS=(
    md.obsidian.Obsidian com.spotify.Client io.dbeaver.DBeaverCommunity
  )

  for flatpak_pkg in "${FLATPAK_PROGRAMS[@]}"; do
    if ! flatpak info "$flatpak_pkg" >/dev/null 2>&1; then
      flatpak install "$flatpak_pkg" -y
    else
      echo "[FLATPAK INSTALLED] - $flatpak_pkg"
    fi
  done
fi

if [ "$OS" == "arch" ]; then
  AUR_PROGRAMS=(
    nvm ttf-jetbrains-mono nerd-fonts-git ttf-roboto ttf-poppins
    stremio-beta grml-zsh-config minecraft-launcher proton-vpn-gtk-app
  )

  for aur_pkg in "${AUR_PROGRAMS[@]}"; do
    if ! pacman -Q "$aur_pkg" >/dev/null 2>&1; then
      $AUR_HELPER "$aur_pkg"
    else
      echo "[AUR INSTALLED] - $aur_pkg"
    fi
  done
fi

if [ ! -d "$HOME/.nvm" ]; then
  curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.1/install.sh | bash
fi

# Install Oh-My-Zsh
if [ ! -d "$HOME/.oh-my-zsh" ]; then
  sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

# Install Oh-My-Zsh
if [ ! -d "$HOME/.oh-my-zsh" ]; then
  sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

# Install Zinit
if [ ! -d "$HOME/.zinit" ]; then
  bash -c "$(curl --fail --show-error --silent --location https://raw.githubusercontent.com/zdharma-continuum/zinit/HEAD/scripts/install.sh)"
fi

# Install Rust
if ! command -v rustc >/dev/null 2>&1; then
    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
fi

# Install Nerd Fonts
if [ "$OS" == "debian" ] &&  [ ! -d nerd-fonts ]; then
    git clone https://github.com/ryanoasis/nerd-fonts.git
    ./nerd-fonts/install.sh
fi

echo "Setup complete!"
