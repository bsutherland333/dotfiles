### Zsh Configuration ###

source $XDG_CONFIG_HOME/zsh/aliases
source $ZPLUG_ROOT/init.zsh
fpath=($ZDOTDIR/external $fpath)


## Auto-start sway ##

if [ "$(tty)" = "/dev/tty1" ];
then
    exec sway
fi


## Vi Mode ##

zplug "jeffreytse/zsh-vi-mode"


## Search with up/down ##

autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search

function zvm_after_lazy_keybindings() {
    # Custom keybindings must be delcared inside this function when using zsh-vi-mode plugin
    zvm_bindkey vicmd '^[[A' up-line-or-beginning-search # Up
    zvm_bindkey vicmd '^[[B' down-line-or-beginning-search # Down
    zvm_bindkey vicmd 'k' up-line-or-beginning-search # Up
    zvm_bindkey vicmd 'j' down-line-or-beginning-search # Down
}

# Set history to be written after every command, rather than on terminal close
setopt INC_APPEND_HISTORY


## Prompt ##

# Initialize custom prompt
autoload -Uz prompt_purification_setup; prompt_purification_setup


## Auto-complete ##

# Disable vi keys to enable autocomplete navigation with them
zmodload zsh/complist
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history

# Initialize auto-complete (must be called after hjkl bindkey lines)
autoload -U compinit; compinit

# Autocomplete hidden files
_comp_options+=(globdots)
source $DOTFILES/zsh/external/completion.zsh


## Directory stack ##

# Push the current directory visited on to the stack.
setopt AUTO_PUSHD
# Do not store duplicate directories in the stack.
setopt PUSHD_IGNORE_DUPS
# Do not print the directory stack after using pushd or popd.
setopt PUSHD_SILENT


## Backwards directory command (bd) ##

source $DOTFILES/zsh/external/bd.zsh


## fzf (Fuzzy Finder) ##

if [ $(command -v "fzf") ]; then
    source $FZF_SCRIPTS/completion.zsh
    source $FZF_SCRIPTS/key-bindings.zsh
fi


## Syntax Highlighting ##

# Needs to be sourced after everything (so it knows all the syntax)
zplug "zsh-users/zsh-syntax-highlighting", defer:2


## Load plugins ##

# Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

# Then, source plugins and add commands to $PATH
zplug load

