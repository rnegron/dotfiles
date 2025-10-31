#!/usr/bin/env zsh

set -euo pipefail

echo "==> Running install.sh..."

echo "==> Installing Homebrew..."
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

echo "==> Updating Homebrew..."
brew update
brew upgrade

# asdf is now installed via Brewfile
echo "==> Configuring asdf..."
source "$(brew --prefix asdf)/libexec/asdf.sh"

# Add asdf plugins
echo "==> Adding asdf plugins..."
asdf plugin add python
asdf plugin add nodejs

# make sure we are in the home directory
cd ~

# Install Python versions
echo "==> Installing Python versions via asdf..."
asdf install python latest
asdf set python latest

# Install Node.js LTS
echo "==> Installing Node.js via asdf..."
asdf install nodejs latest
asdf set nodejs latest

# VimAwesome
echo "==> Installing VimAwesome..."
git clone --depth=1 https://github.com/amix/vimrc.git ~/.vim_runtime
sh ~/.vim_runtime/install_awesome_vimrc.sh

# zsh
echo "==> Installing ohmyzsh and pure theme..."
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"


# Move the original .zsh back where it belongs
cd ~
mv .zshrc.pre-oh-my-zsh .zshrc

# Install pure prompt
mkdir -p "$HOME/.zsh"
git clone https://github.com/sindresorhus/pure.git "$HOME/.zsh/pure"

echo "==> Cleaning up Homebrew..."
brew cleanup

# Reload profile
source ~/.zshrc

echo "==> Done!"
