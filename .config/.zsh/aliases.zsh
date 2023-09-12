VIEDITOR="nvim"

# omz

alias zshconfig="$VIEDITOR ~/.zshrc"
alias ohmyzsh="$VIEDITOR ~/.oh-my-zsh"
alias gitconfig="$VIEDITOR ~/.gitconfig"
alias aliasconf="$VIEDITOR ~/.zsh_aliases"

# ls

alias ls="exa --icons"
alias l='exa -lh --icons'
alias ll='exa -lah --icons'
alias la='exa -an --icons'
alias lsgi="exa -lha --git-ignore --icons"

# git

alias gcl='git clone'
alias gcld='git clone --depth 1'
alias gud='git fetch --unshallow'
alias gi='git init'

alias gs='git st'
alias ga='git add'
alias gaa='git add .'
alias gc='git ci -m'

alias gp='git push'
alias gpl="git pull"

alias gsta="git stash apply"
alias gst="git stash"
alias gstc="git stash clear"

alias gvc='git verify-commit HEAD~1'
alias gsb='git branch --no-contains=main --no-contains=develop'

function git_branch_starts_clear () { 
  local branches=$(gsb | grep "$1")

  if [ -z "$branches" ]; then
    echo "No branches found starting with '$1'."
    echo ""
    echo "--- List all branches --"
    gsb | awk '{print $1}'
  else
    echo "Deleting branches starting with '$1':"
    echo "$branches" | xargs git branch -D
  fi
}

alias gbc='git_branch_starts_clear'

# others

alias myip='curl -s https://checkip.amazonaws.com'
alias myhistory="history | awk '{print \$2}' | sort | uniq -c | sort -rn | head -10"
alias btm="btm --battery --mem_as_value"
alias band="sudo bandwhich"
alias reload="source ~/.zshrc"
alias ..="cd .."
alias nf="neofetch"
alias ips="ip -c -br a"
alias p="pgrep"
alias filesize="du -sh * | sort -h"
alias mkdir="mkdir -pv"
alias duf='du -sk * | sort -n | perl -ne '\''($s,$f)=split(m{\t});for (qw(K M G)) {if($s<1024) {printf("%.1f",$s);print "$_\t$f"; last};$s=$s/1024}'\'''

# docker

alias dcup="docker compose up"
alias dcdw="docker compose down"
alias dclog="docker logs -f "


function docker_migration_run () { docker exec "$1" npm run typeorm migration:run }
function docker_migration_revert () { docker exec "$1" npm run typeorm migration:revert }
function docker_migration () { docker exec "$1" npm run typeorm migration:generate --name $2 }

alias dcmigrun="docker_migration_run"
alias dcmigrev="docker_migration_revert"
alias dcmig="docker_migration"
