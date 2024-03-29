#!/bin/zsh

echo "Installing dotfiles and nvim plugins."

source "$HOME/dotfiles/zsh/.zshenv"

## nvim ##
mkdir -p "$XDG_CONFIG_HOME/nvim"
mkdir -p "$XDG_CONFIG_HOME/nvim/undo"
ln -sf "$DOTFILES/nvim/init.vim" "$XDG_CONFIG_HOME/nvim"
mkdir -p "$XDG_CONFIG_HOME/nvim/lua"
ln -sf "$DOTFILES/nvim/lua/init.lua" "$XDG_CONFIG_HOME/nvim/lua/init.lua"

## vim-plug ##
[ ! -f "$DOTFILES/nvim/autoload/plug.vim" ] \
    && curl -fLo "$DOTFILES/nvim/autoload/plug.vim" --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

mkdir -p "$XDG_CONFIG_HOME/nvim/autoload"
ln -sf "$DOTFILES/nvim/autoload/plug.vim" "$XDG_CONFIG_HOME/nvim/autoload/plug.vim"

nvim --noplugin +PlugUpdate +qa

## foot ##
mkdir -p "$XDG_CONFIG_HOME/foot"
ln -sf "$DOTFILES/foot/foot.ini" "$XDG_CONFIG_HOME/foot"

## zathura ##
mkdir -p "$XDG_CONFIG_HOME/zathura"
ln -sf "$DOTFILES/zathura/zathurarc" "$XDG_CONFIG_HOME/zathura"

## sway ##
rm -rf "$XDG_CONFIG_HOME/sway"
ln -s "$DOTFILES/sway" "$XDG_CONFIG_HOME"

## zsh ##
mkdir -p "$XDG_CONFIG_HOME/zsh"
ln -sf "$DOTFILES/zsh/.zshenv" "$HOME"
ln -sf "$DOTFILES/zsh/.zshrc" "$XDG_CONFIG_HOME/zsh"
ln -sf "$DOTFILES/zsh/aliases" "$XDG_CONFIG_HOME/zsh/aliases"
rm -rf "$XDG_CONFIG_HOME/zsh/external"
ln -sf "$DOTFILES/zsh/external" "$XDG_CONFIG_HOME/zsh"

## GTK ##
mkdir -p "$XDG_CONFIG_HOME/gtk-3.0"
ln -sf "$DOTFILES/gtk-3.0/settings.ini" "$XDG_CONFIG_HOME/gtk-3.0"

## rclone ##
mkdir -p "$XDG_CONFIG_HOME/rclone"
ln -sf "$DOTFILES/rclone/remote_sync_filter.txt" "$XDG_CONFIG_HOME/rclone"

