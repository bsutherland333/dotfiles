#!/bin/bash

# Function to check it a command exists
command_exists() {
    command -v "$1" >/dev/null 2>&1
}

## Main script

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

case $DISTRIBUTION in
    ubuntu)
        echo "Detected Ubuntu. Installing packages using apt-get."
        sudo apt-get update

        # Add ppa repos
        sudo apt-get install software-properties-common -y
        sudo add-apt-repository ppa:neovim-ppa/stable -y

        # Install apt packages
        sudo apt-get install \
            man-db \
            neovim \
            git \
            zsh \
            fzf \
            grep \
            less \
            zplug \
            tree \
            -y
        # diff-so-fancy
        ;;
    arch)
        echo "Detected Arch Linux. Installing packages using pacman."

        # Install packages
        sudo pacman -Syu --noconfirm \
            man \
            man-pages \
            neovim \
            git \
            zsh \
            fzf \
            grep \
            diff-so-fancy \
            less \
            tree
            #zplug  # On AUR, setup yay first
        ;;
    *)
        echo "Unsupported distribution: $DISTRIBUTION. Cannot install packages."
        exit 1
        ;;
esac

if command_exists "diff-so-fancy."; then
    echo "Setting git to use diff-so-fancy"
    git config --global core.pager "diff-so-fancy | less --tabs=4 -RFX"
fi

echo "Package installation complete."

