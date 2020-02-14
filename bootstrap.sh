#!/usr/bin/env zsh

set -euo pipefail

echo "==> Running bootstrap.sh..."

echo "==> Updating MacOS..."
sudo softwareupdate --install --all --verbose

echo "==> Installing Xcode command line tools..."
touch /tmp/.com.apple.dt.CommandLineTools.installondemand.in-progress

CMD_LINE_TOOLS=$(softwareupdate -l | grep "\*.*Command Line" | tail -n 1 | awk -F"*" '{print $2}' | sed -e 's/^ *//' | tr -d '\n')

sudo softwareupdate -i "$CMD_LINE_TOOLS" --verbose

rm /tmp/.com.apple.dt.CommandLineTools.installondemand.in-progress


echo "==> Cloning dotfiles repo..."
mkdir -p ~/code/github
cd ~/code/github
git clone https://github.com/rnegron/dotfiles.git
cd dotfiles

# Defaults
./mac.sh

# Symlinks
./symlinks.sh

# Installs
./install.sh
