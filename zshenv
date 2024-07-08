export PNPM_HOME="$HOME/.local/share/pnpm"

NVIM_PATH="/usr/local/nvim-linux64/bin"
GOPATH="$(go env GOPATH)/bin"

export ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/.share}/zinit/zinit.git"

export PATH="$PATH:$GOPATH:$NVIM_PATH:$PNPM_HOME"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm

### "nvim" as manpager
export MANPAGER="nvim +Man!"
