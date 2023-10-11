#!/bin/bash

## nvim ##
mkdir -p "$HOME/.config/nvim"
mkdir -p "$HOME/.config/nvim/undo"
ln -sf "$HOME/dotfiles/nvim/init.vim" "$HOME/.config/nvim"

## X11 ##
rm -rf "$HOME/.config/X11"
ln -s "$HOME/dotfiles/X11" "$HOME/.config"

## zathura ##
mkdir -p "$HOME/.config/zathura"
ln -sf "$HOME/dotfiles/zathura/zathurarc" "$HOME/.config/zathura"

## i3 ##
rm -rf "$HOME/.config/i3"
ln -s "$HOME/dotfiles/i3" "$HOME/.config"

## zsh ##
mkdir -p "$HOME/.config/zsh"
ln -sf "$HOME/dotfiles/zsh/.zshenv" "$HOME"
ln -sf "$HOME/dotfiles/zsh/.zshrc" "$HOME/.config/zsh"
ln -sf "$HOME/dotfiles/zsh/aliases" "$HOME/.config/zsh/aliases"
rm -rf "$HOME/.config/zsh/external"
ln -sf "$HOME/dotfiles/zsh/external" "$HOME/.config/zsh"

## GTK ##
mkdir -p "$HOME/.config/gtk-3.0"
ln -sf "$HOME/dotfiles/gtk-3.0/settings.ini" "$HOME/.config/gtk-3.0"

