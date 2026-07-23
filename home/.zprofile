eval "$(/opt/homebrew/bin/brew shellenv)"

export PATH="$PATH:$HOME/.local/bin"

# OrbStack command-line tools and integration
source ~/.orbstack/shell/init.zsh 2>/dev/null || :
