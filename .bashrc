# Default PATH
export PATH=/usr/local/git/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/Cellar

# Add RVM to PATH for scripting
PATH=$PATH:$HOME/.rvm/bin

# Load RVM into a shell session *as a function*
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

# Set the Ruby version to use (because the default doesn't seem to be "sticking" for some reason)
rvm use 1.9.3

# Load NVM into a shell session *as a function*
[[ -s "$HOME/.nvm/nvm.sh" ]] && source "$HOME/.nvm/nvm.sh"

# Set the node.js version to use with NVM
nvm use 0.10.0

# Shell prompt (see http://blog.twistedcode.org/2008/03/customizing-your-bash-prompt.html)
# PS1='\[\033[0;36m\]\u\[\033[01;34m\] @ \[\033[0;36m\]\h \[\033[01;34m\]{ \[\033[01;34m\]\w \[\033[00;34m\]}\[\033[01;32m\] -> \[\033[00m\]'

function _update_ps1() {
	export PS1="$(~/powerline-shell.py $?) "
}

export PROMPT_COMMAND="_update_ps1"

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
