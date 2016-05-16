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
export EDITOR=emacs

export PATH=$HOME/.local/bin:$PATH

# Miniconda stuff
export PATH=$HOME/miniconda3/bin:$PATH

### PIPITS stuff
function activate_pipits () {
    echo "Activating PIPITS; your python path is gonna get kinda weird..."
    export PATH=$HOME/pipits/bin:$PATH
    export PYTHONPATH=$HOME/pipits/lib/python2.7/site-packages:$PYTHONPATH
    export PIPITS_UNITE_REFERENCE_DATA_CHIMERA=$HOME/pipits/refdb/uchime_sh_refs_dynamic_original_985_11.03.2015.fasta
    export PIPITS_UNITE_RETRAINED_DIR=$HOME/pipits/refdb/UNITE_retrained
    export PIPITS_RDP_CLASSIFIER_JAR=$HOME/pipits/classifier.jar
}

