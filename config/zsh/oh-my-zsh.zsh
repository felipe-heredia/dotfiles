export ZSH=$HOME/.oh-my-zsh

zstyle ':omz:update' mode auto
ENABLE_CORRECTION="true"

plugins=(
  git
  node
  npm
  docker
  docker-compose
  nvm
  web-search
  sudo
  copypath
  copyfile
  copybuffer
  history
  ubuntu
  tmux
  dnf
)

zshcache_time="$(date +%s%N)"
autoload -Uz add-zsh-hook

source $ZSH/oh-my-zsh.sh
