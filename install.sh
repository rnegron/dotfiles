#!/usr/bin/env zsh

set -euo pipefail

echo "==> Running install.sh..."

echo "==> Installing Homebrew..."
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

echo "==> Updating Hombrew..."
brew update
brew upgrade

echo "==> Installing Homebrew bundle..."
brew tap Homebrew/bundle
brew bundle

# Accept Xcode license
sudo xcodebuild -license accept

# Install nvm
echo "==> Installing nvm..."
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.2/install.sh | zsh

# Install latest release of node
echo "==> Installing latest node LTS via nvm..."
nvm install lts/*  --latest-npm

echo "==> Installing yarn..."
brew install yarn --without-node

echo "==> Installing pyenv..."
brew install pyenv

# Install Python
echo "==> Installing Python versions via pyenv..."
pyenv install 2.7.17
pyenv install 3.8.1
pyenv global 3.8.1

# Global Pip stuff
echo "==> Installing Python packages..."
pip3 install -U pip
pip3 install -U virtualenv black pipenv

echo "==> Installing VimAwesome..."
git clone --depth=1 https://github.com/amix/vimrc.git ~/.vim_runtime
sh ~/.vim_runtime/install_awesome_vimrc.sh

# VSCode packages
echo "==> Installing VSCode Packages..."
xargs -n 1 code --install-extension < ~/code/github/dotfiles/vscode/extensions.txt

# zsh
echo "==> Installing ohmyzsh and pure theme..."
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone https://github.com/sindresorhus/pure.git "$HOME/.zsh/pure"

echo "==> Cleaning up Homebrew..."
brew cleanup

# Reload profile
source ~/.zshrc

echo "==> Done!"
