source "$HOME/.local/share/zinit/zinit.git/zinit.zsh"

autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit
### End of Zinit's installer chunk

zinit light zsh-users/zsh-autosuggestions
zinit light zsh-users/zsh-completions
zinit light zdharma-continuum/fast-syntax-highlighting

SPACESHIP_PROMPT_ADD_NEWLINE=false
SPACESHIP_USER_SHOW="always" # Shows System user name before directory name
SPACESHIP_PACKAGE_SHOW_PRIVATE=true
SPACESHIP_TIME_SHOW=true
SPACESHIP_TIME_FORMAT='%D{%H:%M}'
SPACESHIP_PROMPT_ORDER=(
  user          # Username section
  time          # Time stamps section
  dir           # Current directory section
  git           # Git section (git_branch + git_status)
  package       # Package version
  node          # Node.js section
  ruby          # Ruby section
  rust          # Rust section
  docker        # Docker section
  aws           # Amazon Web Services section
  exec_time     # Execution time
  line_sep      # Line break
  battery       # Battery level and status
  jobs          # Backgound jobs indicator
  exit_code     # Exit code section
  char          # Prompt character
)

if [[ "$USER" == "root" ]]; then
  SPACESHIP_CHAR_SYMBOL="%(?:%{$fg_bold[red]%}%{$fg_bold[yellow]%}%{$fg_bold[red]%} :%{$fg_bold[red]%} )"
else
  SPACESHIP_CHAR_SYMBOL="%(?:%{$fg_bold[red]%}%{$fg_bold[green]%}%{$fg_bold[yellow]%} :%{$fg_bold[red]%} )"
fi
