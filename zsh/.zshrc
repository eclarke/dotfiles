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

export PATH=/Users/ecl/miniconda3/bin:$PATH
export HOMEBREW_GITHUB_API_TOKEN="1860c29f65532488a539ba1e79a59bd725c1bacc"
export RUST_SRC_PATH=$HOME/.rust/src
export GOPATH=$HOME/dev/go
export PATH=$GOPATH/bin:$PATH

#alias emacs="$HOME/Applications/Emacs.app/Contents/MacOS/Emacs"

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"
