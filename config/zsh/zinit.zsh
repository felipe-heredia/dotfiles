# source "$HOME/.local/share/zinit/zinit.git/zinit.zsh"

# autoload -Uz _zinit
# (( ${+_comps} )) && _comps[zinit]=_zinit
# ### End of Zinit's installer chunk

[ ! -d $ZINIT_HOME ] && mkdir -p "$(dirname $ZINIT_HOME)"
[ ! -d $ZINIT_HOME/.git ] && git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
source "${ZINIT_HOME}/zinit.zsh"

zinit light zsh-users/zsh-autosuggestions
zinit light zsh-users/zsh-completions
zinit light zdharma-continuum/fast-syntax-highlighting
zinit light Aloxaf/fzf-tab

#zinit snippet OMZP::git
zinit snippet OMZP::sudo
zinit snippet OMZP::archlinux
zinit snippet OMZP::aws
