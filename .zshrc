if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

ZSH_THEME="powerlevel10k/powerlevel10k"
plugins=(
  git
  zsh-syntax-highlighting
  zsh-autosuggestions
)

export zsh="/Users/sas/.oh-my-zsh"
export w="/Users/sas/rms"
export fe="/Users/sas/rms/front-end"
export ad="/Users/sas/rms/office365-addins/office365-word-addin/"
export c="/Users/sas/.config/nvim"
export bm="/Users/sas/bookmarks"
export it="/Users/sas/bookmarks/i/it"
export pj="/Users/sas/bookmarks/i/it/projects"
export pjc="/Users/sas/bookmarks/i/it/projects/chat"
export cou="/Users/sas/bookmarks/i/it/courses/react-typescript-tutorial"
export ob="/Users/sas/Google Drive/My Drive/01_My Stuff/obsidian/sas"


source $zsh/oh-my-zsh.sh

#Preferred editor for local and remote sessions
 if [[ -n $SSH_CONNECTION ]]; then
   export EDITOR='vim'
 else
   export EDITOR='nvim'
 fi

source <(fzf --zsh)

HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt appendhistory

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

alias wtadd='git-wtadd'
alias wtr='git-wtr'
alias wtl='git worktree list'
alias grb='git branch | grep -v "master" | xargs git branch -D'
alias df='/usr/bin/git --git-dir=/Users/sas/bookmarks/config/.dotfiles/ --work-tree=/Users/sas'
alias vf='v $(fzf)'
alias stk='stklos'
alias v="nvim"
alias zs="nvim /Users/sas/.zshrc"
alias wt="nvim /Users/sas/.wezterm.lua"
alias szs="source ~/.zshrc"
alias chrome="open -a 'Google Chrome'"
alias c='clear'
#alias aws-dev='export AWS_PROFILE=dev'
alias aws-prod='export AWS_PROFILE=prod'
alias aws-def='export AWS_PROFILE=default'

alias odc="nvim $fe/docker-compose.yml"
alias docker-compose="docker compose --compatibility $@"

#Database connection
alias dbl="mysql -u root -proot"   
alias db="mysql -u root -h 127.0.0.1 -P 3306 -proot"   
alias restart-fe="~/rms/rms-release/bin/start.sh"

alias dbe2e="mysql -u root -h 127.0.0.1 -P 3336 -proot"   

#Docker
alias dcu='dcup'
alias dcr='dcrestart'
alias dcs='dcstop'
alias dcsa='dcstopa'
alias dcl='dclogs'
alias dce='dcexec'
#GIT
# Git worktree add 
function git-wtadd() {
  git worktree add "$1"
}

# Git worktree remove  
function git-wtr() {
  git worktree remove "$1"
}

eval "$(rbenv init -)"

export PATH="/opt/homebrew/opt/gawk/libexec/gnubin:$PATH"
export PATH=$PATH:$HOME/bin
export HISTTIMEFORMAT="%d/%m/%y %T "
export PATH="/usr/local/bin:$PATH"

# Path to your oh-my-zsh installation.
export PATH="$PATH:$HOME/.rvm/bin"
export PATH="/usr/local/sbin:$PATH"
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
export PATH=$PATH:/usr/local/mysql/bin

export CYPRESS_RMS_HOME_URL=http://localhost:8081
export CYPRESS_RMS_API_URL=http://localhost:8082
export CYPRESS_RMS_SSR_URL=http://localhost:3005
# Add this to your .zshrc or relevant shell config file

# Define project paths
declare -A DOCKER_PROJECTS=(
  ["fe"]="/Users/sas/rms/front-end"
  ["chat"]="/Users/sas/bookmarks/i/it/projects/chat/front-end/react-app"
  # Add more projects as needed
)

function dc() {
  local project=$1
  shift  # Remove first argument (project name)
  
  if [[ -z "$project" ]]; then
    echo "Usage: dc <project> <docker-compose-command>"
    echo "Available projects:"
    for key in "${(k)DOCKER_PROJECTS[@]}"; do
      echo "  $key -> ${DOCKER_PROJECTS[$key]}"
    done
    return 1
  fi
  
  local project_path="${DOCKER_PROJECTS[$project]}"
  
  if [[ -z "$project_path" ]]; then
    echo "Error: Project '$project' not found"
    return 1
  fi
  
  if [[ ! -d "$project_path" ]]; then
    echo "Error: Directory '$project_path' does not exist"
    return 1
  fi
  
  (cd "$project_path" && docker compose "$@")
}

function dca() {
  dc "$1" up -d
}

function dcup() {
  dc "$1" up -d "${@:2}"
}

function dcstop() {
  dc "$1" stop "${@:2}"
}

function dcstopa() {
  docker stop $(docker ps -a -q)
}

function dcrestart() {
  dc "$1" stop "${@:2}" && dc "$1" up -d "${@:2}"
}

function dcdown() {
  dc "$1" down "${@:2}"
}

function dclogs() {
  dc "$1" logs -f "${@:2}"
}

function dcps() {
  dc "$1" ps "${@:2}"
}

function dcr() {
  dc "$1" restart "${@:2}"
}

function dcexec() {
  dc "$1" exec "${@:2}"
}


#aws profile
function aws-dev() {
    export AWS_PROFILE=dev
    export AWS_ACCESS_KEY_ID=$(aws configure get aws_access_key_id --profile dev)
    export AWS_SECRET_ACCESS_KEY=$(aws configure get aws_secret_access_key --profile dev)
    export AWS_DEFAULT_REGION=$(aws configure get region --profile dev)
}
