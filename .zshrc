# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
themes=(avit bureau)
# ZSH_THEME=$themes[$[${RANDOM} % $#themes]]
ZSH_THEME="bureau"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to disable command auto-correction.
# DISABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git bower vagrant)

source $ZSH/oh-my-zsh.sh

# User configuration

export DEFAULT_USER=`whoami`

export PATH="/Users/ryexley/.nvm/v0.10.28/bin:/Users/ryexley/.rvm/gems/ruby-1.9.3-p448/bin:/Users/ryexley/.rvm/gems/ruby-1.9.3-p448@global/bin:/Users/ryexley/.rvm/rubies/ruby-1.9.3-p448/bin:/Users/ryexley/.rvm/bin:/usr/local/git/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/Cellar"
# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# My customizations

# increase the default open files limit
ulimit -n 2048

# Load NVM into a shell session *as a function*
if [ -f "$HOME/.nvm/nvm.sh" ]; then
    [[ -s "$HOME/.nvm/nvm.sh" ]] && source "$HOME/.nvm/nvm.sh"

    # Set the node.js version to use with NVM
    nvm use 0.10
fi

# Aliases
alias ls="ls -la"
alias c="clear"
alias hs="http-server" # node http-server : https://github.com/nodeapps/http-server

# Project aliases
alias oxy="cd ~/Projects/purdue/oxycontin/source/client-purdue-oxycontin"
alias butr="cd ~/Projects/purdue/butrans/source"
alias intm="cd ~/Projects/purdue/intermezzo/source/client-purdue-intermezzo"
alias hem="cd ~/Projects/hemlock"
alias hems="cd ~/Projects/hemlock/hemlock.server"
alias hemc="cd ~/Projects/hemlock/hemlock.client"
alias len="cd ~/Projects/appendto/lenovo/prototype-2"
alias hub="cd ~/Projects/pitney-bowes/hubble"

# Functions

function npmls () {
    npm ls "$@" | grep ^[└├]
}
