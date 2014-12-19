export PATH=/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# increase the default open files limit
ulimit -n 2048

function fxv () {
    echo
    echo Node $(node -v)
    ruby -v
    rails -v
    echo
}

# Load NVM into a shell session *as a function*
if [ -f "$HOME/.nvm/nvm.sh" ]; then
    [[ -s "$HOME/.nvm/nvm.sh" ]] && source "$HOME/.nvm/nvm.sh"

    # Set the node.js version to use with NVM
    nvm use 0.10
fi

eval "$(rbenv init -)"

# list framework versions
fxv

# Aliases
alias ll="ls -la"
alias c="clear"
alias hs="http-server" # node http-server : https://github.com/nodeapps/http-server
alias renv=rbenv
alias md2word=md2word # alias the function below

# Project aliases
alias oxy="cd ~/Projects/purdue/oxycontin/source/client-purdue-oxycontin"
alias butr="cd ~/Projects/purdue/butrans/source"
alias intm="cd ~/Projects/purdue/intermezzo/source/client-purdue-intermezzo"
alias hem="cd ~/Projects/hemlock"
alias hems="cd ~/Projects/hemlock/hemlock.server"
alias hemc="cd ~/Projects/hemlock/hemlock.client"
alias len="cd ~/Projects/appendto/lenovo/prototype-2"
alias hub="cd ~/Projects/pitney-bowes/hubble"
alias sd="cd ~/Projects/lampo/smartdollar-app"

# Functions

function npmls () {
    npm ls "$@" | grep ^[└├]
}

function md2word () {
    PANDOC_INSTALLED=$(pandoc --version >> /dev/null; echo $?)

    if [ "0" == ${PANDOC_INSTALLED} ]; then
        pandoc -o $2 -f markdown -t docx $1
    else
        echo "Pandoc is not installed. Unable to convert document."
    fi
}
