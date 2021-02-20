!#/bin/sh

# if zprezto isn't here, then clone it
if [ ! -d ~/.dotfiles/.zprezto ]; then
  git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.dotfiles/.zprezto"
fi

# wire up symlinks for dotfiles
ln -s ~/.dotfiles/.zprezto ~/.zprezto
ln -s ~/.dotfiles/prompt ~/.dotfiles/.zprezto/modules/prompt/functions/prompt_ryexley_setup
ln -s ~/.dotfiles/powerline-shell/powerline-shell.py ~/powerline-shell.py
ln -s ~/.dotfiles/.zshrc ~/.zshrc
ln -s ~/.dotfiles/.zprezto/runcoms/zshenv ~/.zshenv
ln -s ~/.dotfiles/.zprezto/runcoms/zlogout ~/.zlogout
ln -s ~/.dotfiles/.zprezto/runcoms/zpreztorc ~/.zpreztorc
ln -s ~/.dotfiles/.gitignore ~/.gitignore
ln -s ~/.dotfiles/.gitconfig ~/.gitconfig

# initialize zprezto
setopt EXTENDED_GLOB
for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
  ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
done
