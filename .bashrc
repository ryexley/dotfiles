# Default PATH
export PATH=/usr/local/git/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/Cellar

# Load RVM into a shell session *as a function*
# if [ -f "$HOME/.rvm/scripts/rvm" ]; then
#     [[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

    # Set the Ruby version to use (because the default doesn't seem to be "sticking" for some reason)
#     rvm use 1.9.3
# fi

# Load NVM into a shell session *as a function*
if [ -f "$HOME/.nvm/nvm.sh" ]; then
    [[ -s "$HOME/.nvm/nvm.sh" ]] && source "$HOME/.nvm/nvm.sh"

    # Set the node.js version to use with NVM
    nvm use 0.10
fi

# increase the default open files limit
ulimit -n 2048

# Shell prompt (see http://blog.twistedcode.org/2008/03/customizing-your-bash-prompt.html)
# PS1='\[\033[0;36m\]\u\[\033[01;34m\] @ \[\033[0;36m\]\h \[\033[01;34m\]{ \[\033[01;34m\]\w \[\033[00;34m\]}\[\033[01;32m\] -> \[\033[00m\]'

if [ -f ~/.dotfiles/.git-completion.bash ]; then
    . ~/.dotfiles/.git-completion.bash
fi

function _update_ps1() {
	export PS1="$(~/powerline-shell.py $?) "
}

export PROMPT_COMMAND="_update_ps1"

# Aliases
alias ls="ls -la"
alias c="clear"
alias hs="http-server" # node http-server : https://github.com/nodeapps/http-server

# Project aliases

# Functions

function npmls () {
	npm ls "$@" | grep ^[└├]
}
