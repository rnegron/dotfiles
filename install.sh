#!/bin/bash
echo "==> Running install.sh"

echo "Installing Homebrew..."
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

echo "Updating Hombrew..."
brew upgrade
brew update

echo "Installing Homebrew bundle..."
brew tap Homebrew/bundle
brew bundle

# Accept Xcode license
sudo xcodebuild -license accept

# Install nvm
echo "Installing nvm..."
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.34.0/install.sh | bash

# Install latest release of node
echo "Installing node..."
nvm install lts/*  --latest-npm

echo "Installing yarn..."
brew install yarn --without-node

echo "Installing pyenv..."
brew install pyenv

# Install Python
echo "Installing Python..."
pyenv install 3.7.3
pyenv global 3.7.3

# Global Pip stuff
echo "Installing Python packages..."
pip3 install -U pip
pip3 install -U virtualenv virtualenvwrapper black

echo "Installing VimAwesome..."
git clone --depth=1 https://github.com/amix/vimrc.git ~/.vim_runtime
sh ~/.vim_runtime/install_awesome_vimrc.sh

# Reload profile
source ~/.bash_profile

# VSCode packages
echo "Installing VSCode Packages..."
xargs -n 1 code --install-extension < ~/code/github/dotfiles/vscode/extensions.txt

echo "Cleaning up Homebrew..."
brew cleanup

echo
echo "==> Done!"
