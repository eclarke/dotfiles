# Aliases, functions, etc...
#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#   Erik Clarke <first.last@fastmail.com>
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Customize to your needs...
export ALTERNATE_EDITOR=emacs EDITOR=emacsclient VISUAL=emacsclient

alias emacs='emacsclient -c -a ""'
