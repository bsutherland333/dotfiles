#!/bin/bash

# Function to detect the Linux distribution
detect_distribution() {
    if [ -f /etc/os-release ]; then
        . /etc/os-release
        DISTRIBUTION=$ID
    elif [ -f /etc/lsb-release ]; then
        . /etc/lsb-release
        DISTRIBUTION=$DISTRIB_ID
    else
        DISTRIBUTION="unknown"
    fi
}

# Function to install packages on Ubuntu
install_ubuntu_packages() {
    sudo apt-get update
    sudo apt-get install -y "${@}"
}

# Function to install packages on Arch
install_arch_packages() {
    sudo pacman -Syu --noconfirm
    sudo pacman -S --noconfirm "${@}"
}

# Function to check it a command exists
command_exists() {
    command -v "$1" >/dev/null 2>&1
}

# Main script
detect_distribution

case $DISTRIBUTION in
    ubuntu)
        echo "Detected Ubuntu. Installing packages using apt-get."
        # Add any ppa repos required
        sudo apt-get update
        sudo apt-get install software-properties-common -y
        sudo add-apt-repository ppa:neovim-ppa/stable -y

        packages=(
            "man-db"
            "neovim"
            "git"
            "zsh"
            #"zsh-completions"
            "zsh-syntax-highlighting"
            "fzf"
            "ripgrep"
            #"diff-so-fancy"
            "clang"
            #"pyright"
        )
        install_ubuntu_packages "${packages[@]}"
        ;;
    arch)
        echo "Detected Arch Linux. Installing packages using pacman."
        packages=(
            "man"
            "man-pages"
            "neovim"
            "git"
            "zsh"
            "zsh-completions"
            "zsh-syntax-highlighting"
            "fzf"
            "ripgrep"
            "diff-so-fancy"
            "clang"
            "pyright"
        )
        install_arch_packages "${packages[@]}"
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

