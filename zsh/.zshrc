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

# Perl stuff
PATH="/media/8TB_PLAYGROUND/home/ecl/perl5/bin${PATH:+:${PATH}}"; export PATH;
PERL5LIB="/media/8TB_PLAYGROUND/home/ecl/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
PERL_LOCAL_LIB_ROOT="/media/8TB_PLAYGROUND/home/ecl/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
PERL_MB_OPT="--install_base \"/media/8TB_PLAYGROUND/home/ecl/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=/media/8TB_PLAYGROUND/home/ecl/perl5"; export PERL_MM_OPT;

