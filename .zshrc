# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH
#
#source $(brew --prefix nvm)/nvm.sh


# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
#ZSH_THEME="robbyrussell"
ZSH_THEME="powerlevel10k/powerlevel10k"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
#
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
export ob="/Users/sas/Google Drive/My Drive/01_My Stuff/obsidian/sas"

source $zsh/oh-my-zsh.sh
#source /Users/sas/.bash_profile

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8



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

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

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
alias dc="nvim /Users/sas/rms/front-end/docker-compose.yml"
alias szs="source ~/.zshrc"
alias chrome="open -a 'Google Chrome'"
alias c='clear'

alias docker-compose="docker compose --compatibility $@"

#Database connection
alias dbl="mysql -u root -proot"   
alias db="mysql -u root -h 127.0.0.1 -P 3306 -proot"   
alias restart-fe="~/rms/rms-release/bin/start.sh"

alias mysqle2e="mysql -u root -h 127.0.0.1 -P 3333 -p"   

#alias mysql=/usr/local/mysql/bin/mysql

#Docker
alias dcu='dcup'
alias dcr='dcrestart'
alias dcs='dcstop'
alias dcl='dlogs'
alias dce='dexec'
#GIT
# Git worktree add 
function git-wtadd() {
  git worktree add "$1"
}

# Git worktree remove  
function git-wtr() {
  git worktree remove "$1"
}

export PATH="/opt/homebrew/opt/gawk/libexec/gnubin:$PATH"
export PATH=$PATH:$HOME/bin
export HISTTIMEFORMAT="%d/%m/%y %T "
export PATH="/usr/local/bin:$PATH"

# Define function for starting a service
dcup() {
  ($fe && docker compose up -d "$@")
}

# Define function for starting a service
dcrestart() {
  ($fe && docker compose stop "$@" && docker compose up -d "$@")
}

# Define function for stopping a service
dcstop() {
  ($fe && docker compose stop "$@")
}

dlogs() {
  ($fe && docker compose logs -f "$@")
}

dexec() {
  ($fe && docker compose exec -it "$@" sh)
}

# Path to your oh-my-zsh installation.
export PATH="$PATH:$HOME/.rvm/bin"
export PATH="/usr/local/sbin:$PATH"
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
export PATH=$PATH:/usr/local/mysql/bin
