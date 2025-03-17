export PNPM_HOME="$HOME/.local/share/pnpm"
export GOPATH="$HOME/go"

YARN_BIN="$HOME/.yarn/bin"
CARGO_BIN="$HOME/.cargo/bin"
LOCAL_BIN="$HOME/.local/bin"
DIFFT_BIN="/usr/local/difft"
NVIM_PATH="/usr/local/nvim-linux64/bin"

export PATH="$PATH:/$YARN_BIN:/$CARGO_BIN:/$LOCAL_BIN:/$PNPM_HOME:/$DIFFT_BIN:/$NVIM_PATH:/usr/local/go/bin:$GOPATH/bin"

. "$HOME/.cargo/env"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion


export PAGER="less -S"
export EDITOR="nvim"
export MANPAGER="nvim +Man!"
