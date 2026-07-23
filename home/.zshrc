# oh-my-zsh
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME=""
plugins=(git)
source "$ZSH/oh-my-zsh.sh"

# zsh-syntax-highlighting (brew)
source "$(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"

# Prefer US English and use UTF-8
export LC_ALL="en_US.UTF-8"
export LANG="en_US"

# Default editor
export EDITOR='vim'
export VISUAL='vim'

# grep color
export GREP_OPTIONS='--color=auto'

# Binaries
export PATH="$HOME/.local/bin:$PATH"
export PATH="$PATH:/usr/local/sbin"

# Homebrew
export HOMEBREW_NO_ANALYTICS=1
export HOMEBREW_AUTO_UPDATE_SECS=3600
export HOMEBREW_INSTALL_CLEANUP=1
export PATH="/opt/homebrew/opt/postgresql@17/bin:$PATH"
export PATH="/opt/homebrew/opt/ruby/bin:$PATH"

# Python
export PYTHONDONTWRITEBYTECODE=true

# gbdev
export PATH="$HOME/code/gb_dev/gbdk/bin:$PATH"
export GBDK_HOME="$HOME/code/gb_dev/gbdk"

# NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && . "$NVM_DIR/bash_completion"

# pnpm
export PNPM_HOME="$HOME/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac

# golang
export GOPATH="$HOME/go"
export PATH="$PATH:$GOPATH/bin"

# direnv
eval "$(direnv hook zsh)"

# Aliases
source "$HOME/.aliases"

# pure prompt
fpath+="$HOME/.zsh/pure"
autoload -U promptinit; promptinit
prompt pure
