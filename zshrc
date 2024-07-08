prompt off
eval "$(starship init zsh)"
eval "$(zoxide init --cmd cd zsh)"
eval "$(fzf --zsh)"

ZSH_CONFIG_FOLDER="$HOME/.config/zsh"

[[ -f "$ZSH_CONFIG_FOLDER/oh-my-zsh.zsh" ]] && . "$ZSH_CONFIG_FOLDER/oh-my-zsh.zsh"
[[ -f "$ZSH_CONFIG_FOLDER/aliases.zsh" ]] && . "$ZSH_CONFIG_FOLDER/aliases.zsh"
[[ -f "$ZSH_CONFIG_FOLDER/zinit.zsh" ]] && . "$ZSH_CONFIG_FOLDER/zinit.zsh"
[[ -f "$ZSH_CONFIG_FOLDER/starship.zsh" ]] && . "$ZSH_CONFIG_FOLDER/starship.zsh"

HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

bindkey '^p' history-search-backward
bindkey '^n' history-search-forward

nf
