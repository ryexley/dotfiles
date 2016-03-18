export PATH=/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/sbin:/sbin
export PATH="$HOME/.nvm/bin:$PATH"
export PATH="$PATH:/usr/local/go/bin" # go lang path
export EDITOR=$(which subl)
# export GOPATH="$HOME/projects"

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.dotfiles/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.dotfiles/.zprezto/init.zsh"
fi

# pure prompt
autoload -U promptinit; promptinit
prompt pure

# increase the default open files limit
ulimit -n 2048

function fxv () {
    echo
    # ruby -v
    # rails -v
    elixir -v
    echo Node $(node -v)
    echo npm $(npm -v)
    echo
}

# Load NVM into a shell session *as a function*
if [ -f "$HOME/.nvm/nvm.sh" ]; then
   [[ -s "$HOME/.nvm/nvm.sh" ]] && source "$HOME/.nvm/nvm.sh"

   # Explicitly set the node.js version to use with NVM if no .nvmrc is present (which it should be)
   # nvm use default
fi

# autoload new node version when changing into a directory in which an .nvmrc file is found
autoload -U add-zsh-hook
load-nvmrc() {
  local node_version="$(nvm version)"
  local nvmrc_path="$(nvm_find_nvmrc)"

  if [ -n "$nvmrc_path" ]; then
    local nvmrc_node_version=$(nvm version "$(cat "${nvmrc_path}")")

    if [ "$nvmrc_node_version" = "N/A" ]; then
      nvm install
    elif [ "$nvmrc_node_version" != "$node_version" ]; then
      nvm use
    fi
  elif [ "$node_version" != "$(nvm version default)" ]; then
    echo "Reverting to nvm default version"
    nvm use default
  fi
}
add-zsh-hook chpwd load-nvmrc
load-nvmrc

# eval "$(rbenv init -)"

# list framework versions
# fxv

# load up z (z.sh)
source ~/z.sh

# set terminal tab title to the current working directory
# (just the directory name, not the full path)
# taken from: https://gist.github.com/phette23/5270658#gistcomment-1265682
precmd() {
    echo -ne "\e]1;${PWD##*/}\a"
}

pgdir () {
    PG_VERSION_OUTPUT=$(postgres -V)
    PG_VER=$PG_VERSION_OUTPUT[(ws: :)3]
    echo /usr/local/var/postgres/$PG_VER
}

# Aliases
alias ll="ls -la"
alias c="clear"
alias hs="http-server -p 7777" # node http-server : https://github.com/nodeapps/http-server
alias renv=rbenv
alias md2word=md2word # alias the function below
alias vcc="open ./coverage/lcov-report/index.html"
alias reset="clear && source ~/.zshrc"
alias "disable-sinopia"="mv ~/.npmrc ~/.npmrcx && echo 'Sinopia temporarily disabled (~/.npmrc renamed to ~/.npmrcx)'"
alias "enable-sinopia"="mv ~/.npmrcx ~/.npmrc && echo 'Sinopia re-enabled (~/.npmrcx renamed to ~/.npmrc)'"
alias vs="code"

# random aliases
alias rcli="clear && create-react-app"
alias riam="open ~/projects/ryexley/poplar/build/WemoMenubarController-darwin-x64/WemoMenubarController.app"

# node/npm aliases
alias cnmi="clear && npm set progress=true && rm -rf node_modules && time npm install && say node modules installation complete"
alias nt="clear && npm run test && say test run complete"
alias nom="npm"
alias nd="clear && node-dev"
alias nr="clear && npm run -s"
alias ns="clear && npm start -s"
alias ni="clear && npm install"
alias nis="clear && npm install --save"
alias nid="clear && npm install --save-dev"
alias nls="clear && npm ls"
alias nln="clear && npm link"
alias nup="clear && npm install && npm update"
alias links="clear && link-status -s -p"

# Service aliases
alias srs="c && rails server -b 0.0.0.0" # start a rails server in the current directory, bound on all local interfaces
alias start-pg="pg_ctl -w -D $(pgdir) -l $(pgdir)/server.log start"
alias stop-pg="pg_ctl -D $(pgdir) -l $(pgdir)/server.log stop"
alias start-rethinkdb="rethinkdb --directory rethinkdb-data --server-name phoenix --http-port 7070"
alias start-redis="redis-server"
alias start-rabbit="rabbitmq-server"
alias lkds-up="clear && startLeankitDevServer"
alias lkds-down="clear && stopLeankitDevServer"
alias lkds-config="subl ~/projects/leankit/lks/config.json"
alias clean-deps="npm set progress=true && rm -rf node_modules && time npm install"
alias clean-lk-deps="npm set progress=true && rm -rf node_modules/@lk && time npm install"
alias clean-deps-quiet="npm set progress=false && rm -rf node_modules && time npm install"
alias clean-lk-deps-quiet="npm set progress=false && rm -rf node_modules/@lk && time npm install"
alias cnsrepl="LK_SQL_DATABASE=Dogfood node ~/projects/leankit/core-node-sql/repl"
alias cleanup-docker-images="docker rmi $(docker images | grep '<none>' | awk '{print $3}')"
alias what-changed="git diff HEAD~2"

# Project aliases

# Functions

function startLeankitDevServer() {
    local CURRENT_DIR
    CURRENT_DIR=$(pwd)
    # cd ~/projects/leankit/lks
    # ./lks start
    lks
    cd $CURRENT_DIR
    unset CURRENT_DIR
}

function stopLeankitDevServer() {
    local CURRENT_DIR
    CURRENT_DIR=$(pwd)
    # cd ~/projects/leankit/lks
    # ./lks halt
    lks stop
    cd $CURRENT_DIR
    unset CURRENT_DIR
}

function mkcd() {
    if [ $1 != "" ]
    then
        clear && mkdir "$1" && cd "$1"
    else
        echo "You must provide a name for the directory to create"
    fi
}

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

# vs () {
#     if [[ $# = 0 ]]
#     then
#         open -a "Visual Studio Code"
#     else
#         [[ $1 = /* ]] && F="$1" || F="$PWD/${1#./ -n}"
#         open -a "Visual Studio Code" --args "$F"
#     fi
# }

[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
