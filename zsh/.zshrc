### Zsh Configuration ###

source $XDG_CONFIG_HOME/zsh/aliases
source /usr/share/zsh/scripts/zplug/init.zsh
fpath=($ZDOTDIR/external $fpath)


## Auto-start i3 ##

if [ "$(tty)" = "/dev/tty1" ];
then
    pgrep i3 || exec startx "$XDG_CONFIG_HOME/X11/.xinitrc"
fi


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


## Search with up/down ##

autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey "^[[A" up-line-or-beginning-search # Up
bindkey "^[[B" down-line-or-beginning-search # Down
bindkey "^K" up-line-or-beginning-search # Up
bindkey "^J" down-line-or-beginning-search # Down


## fzf (Fuzzy Finder) ##

if [ $(command -v "fzf") ]; then
    source /usr/share/fzf/completion.zsh
    source /usr/share/fzf/key-bindings.zsh
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


## Hacks ##

# Remove extra space when started
clear
