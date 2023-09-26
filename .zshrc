eval "$(starship init zsh)"

ZSH_CONFIG_FOLDER="$HOME/.config/.zsh"

[[ -f "$ZSH_CONFIG_FOLDER/oh-my-zsh.zsh" ]] && . "$ZSH_CONFIG_FOLDER/oh-my-zsh.zsh"
[[ -f "$ZSH_CONFIG_FOLDER/aliases.zsh" ]] && . "$ZSH_CONFIG_FOLDER/aliases.zsh"
[[ -f "$ZSH_CONFIG_FOLDER/zinit.zsh" ]] && . "$ZSH_CONFIG_FOLDER/zinit.zsh"
[[ -f "$ZSH_CONFIG_FOLDER/starship.zsh" ]] && . "$ZSH_CONFIG_FOLDER/starship.zsh"

nf
