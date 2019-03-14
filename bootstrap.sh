#!/bin/bash

echo "==> Running bootstrap.sh"

echo "Updating OSX..."
sudo softwareupdate --install --all --verbose

echo "Cloning dotfiles repo..."
mkdir -p ~/code/github
cd ~/code/github
git clone https://github.com/rnegron/dotfiles.git
cd dotfiles

# Defaults
./osx.sh

# Symlinks
./symlinks.sh

# Installs
./install.sh
