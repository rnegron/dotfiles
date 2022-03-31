#!/usr/bin/env zsh

set -euo pipefail

echo "==> Running install.sh..."

echo "==> Installing Homebrew..."
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

echo "==> Updating Hombrew..."
brew update
brew upgrade

echo "==> Installing Homebrew bundle..."
brew tap Homebrew/bundle
brew bundle

# Install nvm
echo "==> Installing nvm..."
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.2/install.sh | zsh

# Install latest release of node
echo "==> Installing latest node LTS via nvm..."
[ -s "$HOME/.nvm/nvm.sh" ] && . "$HOME/.nvm/nvm.sh"
nvm install --lts

echo "==> Installing yarn..."
brew install yarn

echo "==> Installing pyenv..."
brew install pyenv

# Install Python
echo "==> Installing Python versions via pyenv..."
pyenv install 2.7.18
pyenv install 3.7.10
pyenv install 3.8.8
pyenv install 3.9.2
pyenv global 3.8.8

# Global Pip stuff
echo "==> Installing Python packages..."
pip3 install -U pip
pip3 install -U virtualenv black pipenv pre-commit


# Poetry
echo "==> Installing Poetry..."
curl -sSL https://raw.githubusercontent.com/python-poetry/poetry/master/get-poetry.py | python

# VimAwesome
echo "==> Installing VimAwesome..."
git clone --depth=1 https://github.com/amix/vimrc.git ~/.vim_runtime
sh ~/.vim_runtime/install_awesome_vimrc.sh

# zsh
echo "==> Installing ohmyzsh and pure theme..."
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

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
