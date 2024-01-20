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

## alacritty ##
mkdir -p "$XDG_CONFIG_HOME/alacritty"
ln -sf "$DOTFILES/alacritty/alacritty.toml" "$XDG_CONFIG_HOME/alacritty"
if [ ! -d "$XDG_CONFIG_HOME/alacritty/themes" ]; then
    mkdir "$XDG_CONFIG_HOME/alacritty/themes"
    git clone https://github.com/alacritty/alacritty-theme "$XDG_CONFIG_HOME/alacritty/themes"
fi

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

