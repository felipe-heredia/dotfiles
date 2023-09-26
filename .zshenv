export PNPM_HOME="$HOME/.local/share/pnpm"

NVIM_PATH="/usr/local/nvim-linux64/bin"
GO_BIN="/usr/local/go/bin/"

export PATH="$PATH:$GO_BIN:$NVIM_PATH:$PNPM_HOME"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
