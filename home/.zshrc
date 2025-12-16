export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME=""

ZSH_CUSTOM=$HOME/.zsh_custom

plugins=(git)

source $ZSH/oh-my-zsh.sh

# Prefer US English and use UTF-8
export LC_ALL="en_US.UTF-8"
export LANG="en_US"

# Default editor
export EDITOR='vim'
export VISUAL='vim'

# Binaries
export PATH="$HOME/.bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"

# Homebrew
export PATH="$(brew --prefix)/bin:$PATH"
export PATH="$(brew --prefix)/sbin:$PATH"
export HOMEBREW_NO_ANALYTICS=1
export HOMEBREW_AUTO_UPDATE_SECS=3600
export HOMEBREW_INSTALL_CLEANUP=1

# Python
export PYTHONDONTWRITEBYTECODE=true
export PATH="$(brew --prefix openssl@3)/bin:$PATH"

# gbdev
export PATH="$HOME/code/gb_dev/gbdk-n/bin:$PATH"
export PATH="$HOME/code/gb_dev/gbdk/bin:$PATH"
export PATH="$HOME/code/gb_dev/sdcc/bin:$PATH"

# pnpm
export PNPM_HOME="$HOME/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

# golang
export GOPATH="$HOME/go"
export PATH="$PATH:$GOPATH/bin"

# asdf version manager
source "$(brew --prefix asdf)/libexec/asdf.sh"

# Aliases
source "$HOME/.aliases"

# pure theme for zsh
fpath+=$HOME/.zsh/pure
autoload -U promptinit; promptinit
prompt pure
