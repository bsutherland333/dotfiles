### Zsh Configuration ###

source "$XDG_CONFIG_HOME/zsh/aliases"
fpath=($ZDOTDIR/external $fpath)

# Initialize auto-complete
autoload -U compinit; compinit
# Initialize custom prompt
autoload -Uz prompt_purification_setup; prompt_purification_setup

# Autocomplete hidden files
_comp_options+=(globdots)
source ~/dotfiles/zsh/external/completion.zsh

# Remove extra space when started
clear
