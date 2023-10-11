### Zsh Configuration ###

source "$XDG_CONFIG_HOME/zsh/aliases"
fpath=($ZDOTDIR/external $fpath)


## Vi Mode ##

bindkey -v
export KEYTIMEOUT=1
autoload -Uz cursor_mode && cursor_mode

zmodload zsh/complist
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history


## Prompt ##

# Initialize custom prompt
autoload -Uz prompt_purification_setup; prompt_purification_setup


## Auto-complete ##

# Initialize auto-complete
autoload -U compinit; compinit  # must be called after hjkl bindkey commands

# Autocomplete hidden files
_comp_options+=(globdots)
source ~/dotfiles/zsh/external/completion.zsh


## Directory stack ##

# Push the current directory visited on to the stack.
setopt AUTO_PUSHD
# Do not store duplicate directories in the stack.
setopt PUSHD_IGNORE_DUPS
# Do not print the directory stack after using pushd or popd.
setopt PUSHD_SILENT


## Backwards directory command (bd) ##

source ~/dotfiles/zsh/external/bd.zsh


## Syntax Highlighting ##

# Needs to be sourced after everything (so it knows it's syntax)
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh


## fzf (Fuzzy Finder) ##

if [ $(command -v "fzf") ]; then
    source /usr/share/fzf/completion.zsh
    source /usr/share/fzf/key-bindings.zsh
fi


## Auto-start i3 ##

if [ "$(tty)" = "/dev/tty1" ];
then
    pgrep i3 || exec startx "$XDG_CONFIG_HOME/X11/.xinitrc"
fi


## Hacks ##

# Remove extra space when started
clear


