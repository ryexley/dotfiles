export PATH=/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.dotfiles/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.dotfiles/.zprezto/init.zsh"
fi

# increase the default open files limit
ulimit -n 2048

function fxv () {
    echo
    echo Node $(node -v)
    # ruby -v
    # rails -v
    # elixir -v
    echo
}

# Load NVM into a shell session *as a function*
if [ -f "$HOME/.nvm/nvm.sh" ]; then
    [[ -s "$HOME/.nvm/nvm.sh" ]] && source "$HOME/.nvm/nvm.sh"

    # Set the node.js version to use with NVM
    nvm use default
fi

# eval "$(rbenv init -)"

# list framework versions
fxv

# Aliases
alias ll="ls -la"
alias c="clear"
alias hs="http-server" # node http-server : https://github.com/nodeapps/http-server
alias renv=rbenv
alias md2word=md2word # alias the function below
alias srs="c && rails server -b 0.0.0.0" # start a rails server in the current directory, bound on all local interfaces
alias start-postgres="pg_ctl -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log start"
alias stop-postgres="pg_ctl -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log stop"

# Project aliases

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

vs () {
    if [[ $# = 0 ]]
    then
        open -a "Visual Studio Code"
    else
        [[ $1 = /* ]] && F="$1" || F="$PWD/${1#./}"
        open -a "Visual Studio Code" --args "$F"
    fi
}
