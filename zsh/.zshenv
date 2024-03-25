## Sets Zsh enviromnent variables ##

# Detect current distribution
if [ -f /etc/os-release ]; then
    . /etc/os-release
    DISTRIBUTION=$ID
elif [ -f /etc/lsb-release ]; then
    . /etc/lsb-release
    DISTRIBUTION=$DISTRIB_ID
else
    DISTRIBUTION="unknown"
fi

# For dotfiles
export XDG_CONFIG_HOME="$HOME/.config"

# For specific data
export XDG_DATA_HOME="$XDG_CONFIG_HOME/local/share"

# For cached files
export XDG_CACHE_HOME="$XDG_CONFIG_HOME/cache"

# For editors
export EDITOR="nvim"
export VISUAL="nvim"

# Set location of zsh config files
export ZDOTDIR="$XDG_CONFIG_HOME/zsh"

# History filepath
export HISTFILE="$ZDOTDIR/.zhistory"
# Maximum events for internal history
export HISTSIZE=10000
# Maximum events in history file
export SAVEHIST=10000

# Set location of dotfiles
export DOTFILES="$HOME/dotfiles"

# Switch fzf to ripgrep, and set parameters
export FZF_DEFAULT_COMMAND="rg --files --hidden --glob '!.git'"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

# Set location of zplug installation, for sourcing startup scripts
case $DISTRIBUTION in
    ubuntu)
        export ZPLUG_ROOT="/usr/share/zplug"
        export FZF_SCRIPTS="/usr/share/docs/fzf/examples"
        ;;
    arch)
        export ZPLUG_ROOT="/usr/share/zsh/scripts/zplug"
        export FZF_SCRIPTS="/usr/share/fzf"
        ;;
esac

# Specify drivers for video hardware acceleration
export VDPAU_DRIVER=radeonsi
export LIBVA_DRIVER_NAME=radeonsi
