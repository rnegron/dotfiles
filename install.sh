#!/usr/bin/env zsh

set -euo pipefail

echo "==> Running install.sh..."

if ! command -v brew >/dev/null 2>&1; then
  echo "==> Installing Homebrew..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi
eval "$(/opt/homebrew/bin/brew shellenv)"

# Shell setup first: a package failure below must not leave zsh broken
echo "==> Installing ohmyzsh..."
[ -d "$HOME/.oh-my-zsh" ] || sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended --keep-zshrc

echo "==> Installing pure prompt..."
mkdir -p "$HOME/.zsh"
[ -d "$HOME/.zsh/pure" ] || git clone https://github.com/sindresorhus/pure.git "$HOME/.zsh/pure"

echo "==> Installing VimAwesome..."
[ -d "$HOME/.vim_runtime" ] || git clone --depth=1 https://github.com/amix/vimrc.git "$HOME/.vim_runtime"

echo "==> Updating Homebrew..."
brew update
brew upgrade

echo "==> Installing Brewfile packages..."
brew bundle || echo "==> WARNING: some Brewfile entries failed, re-run 'brew bundle' after fixing"

echo "==> Configuring asdf..."
export PATH="${ASDF_DATA_DIR:-$HOME/.asdf}/shims:$PATH"
asdf plugin add python 2>/dev/null || true
asdf plugin add nodejs 2>/dev/null || true

cd ~

echo "==> Installing Python via asdf..."
asdf install python latest
asdf set python latest

echo "==> Installing Node.js via asdf..."
asdf install nodejs latest
asdf set nodejs latest

echo "==> Cleaning up Homebrew..."
brew cleanup

echo "==> Done! Open a new shell."
