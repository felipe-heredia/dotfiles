export PNPM_HOME="$HOME/.local/share/pnpm"

YARN_BIN="$HOME/.yarn/bin"
CARGO_BIN="$HOME/.cargo/bin"
LOCAL_BIN="$HOME/.local/bin"
GO_BIN="/usr/local/go/bin/"
DIFFT_BIN="/usr/local/difft"

export PATH="$PATH:/$YARN_BIN:/$CARGO_BIN:/$LOCAL_BIN:/$GO_BIN:/$PNPM_HOME:/$DIFFT_BIN"

. "$HOME/.cargo/env"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion



case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
