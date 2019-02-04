export PATH=/usr/local/bin:/usr/local/lib:/usr/bin:/bin:/usr/local/sbin:/usr/sbin:/sbin
export PATH="$HOME/.nvm/bin:$PATH"
export PATH="$PATH:/usr/local/go/bin" # go lang path
# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

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
ulimit -n 20000

function fxv () {
    echo
    ruby -v
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

# https://rvm.io/integration/zsh
# fixes pure prompt issues with rvm
unsetopt auto_name_dirs

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

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
alias md2word=md2word # alias the function below
alias vcc="open ./coverage/lcov-report/index.html"
alias reset="clear && source ~/.zshrc"
alias vs="code"

# git aliases
alias gfo="git fetch origin"
alias gmom="git merge origin/master"
alias grom="git rebase origin/master"

# random aliases
alias rcli="clear && create-react-app"
alias riam="open ~/projects/ryexley/poplar/build/WemoMenubarController-darwin-x64/WemoMenubarController.app"

# node/npm aliases
alias cnmi="clear && rm -rf node_modules && mkdir node_modules && touch node_modules/.metadata_never_index && npm set progress=true && time npm install && say node modules installation complete"
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
alias yr="clear && yarn run"

# Service aliases
alias what-changed="git diff HEAD~2"

# Project aliases
alias rungf="GAP_DC=localhost npm run server"

source ~/.ryexley.private.zsh

# Project aliases

# Functions

# wrap git with a handler to switch the email address it uses for personal projects
# (will use the configured default email address from ~/.gitconfig by default)
function git() {
  case "$PWD" in
    $HOME/projects/ryexley/*)
      command git -c user.email=bob@yexley.net "$@"
      ;;
    $HOME/projects/sparkbox/gap/*)
      command git -c user.email=bob_yexley@gap.com -c user.signingkey=2AD022C1 "$@"
      ;;
    *)
      command git "$@"
      ;;
  esac
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
