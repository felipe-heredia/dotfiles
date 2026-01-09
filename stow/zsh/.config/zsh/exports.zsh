# pnpm
export PNPM_HOME="/home/felipeheredia/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

source /usr/share/nvm/init-nvm.sh

