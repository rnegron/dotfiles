# Case-insensitive globbing (used in pathname expansion)
shopt -s nocaseglob

# Append to the Bash history file, rather than overwriting it
shopt -s histappend

# Autocorrect typos in path names when using `cd`
shopt -s cdspell

# Prefer US English and use UTF-8
export LC_ALL="en_US.UTF-8"
export LANG="en_US"

# Default editor
export EDITOR='vim'
export VISUAL='vim'

# grep color
export GREP_OPTIONS='--color=auto'

# Binaries
export PATH="$HOME/.bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"
export PATH="$PATH:/usr/local/sbin"

# Homebrew
export PATH="/usr/local/bin:$PATH"
export PATH="/usr/local/sbin:$PATH"
export HOMEBREW_NO_ANALYTICS=1
export HOMEBREW_AUTO_UPDATE_SECS=3600
export HOMEBREW_INSTALL_CLEANUP=1

# Python and Virtualenv
export WORKON_HOME=$HOME/.virtualenvs
export PROJECT_HOME=$HOME/code
export VIRTUALENVWRAPPER_PYTHON=python3
source /usr/local/bin/virtualenvwrapper.sh
export PYTHONDONTWRITEBYTECODE=true

# gbdev
export PATH="/usr/local/bin/charm:$PATH"
export PATH="~/code/gb_dev/gbdk-n/bin:$PATH"
export PATH="~/code/gb_dev/gbdk/bin:$PATH"
export PATH="~/code/gb_dev/sdcc/bin:$PATH"

# Go
export PATH="$PATH:/usr/local/opt/go/libexec/bin"
export PATH="$PATH:~/code/go/bin"

# NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
[[ -r "$NVM_DIR/bash_completion" ]] && . "$NVM_DIR/bash_completion"

# pyenv
if which pyenv > /dev/null; then eval "$(pyenv init -)"; fi

# Bash Completion
if hash brew 2>/dev/null && [ -f `brew --prefix`/etc/bash_completion ]; then
  . `brew --prefix`/etc/bash_completion
fi

# Add tab completion for SSH hostnames based on ~/.ssh/config, ignoring wildcards
[ -e "$HOME/.ssh/config" ] && complete -o "default" -o "nospace" -W "$(grep "^Host" ~/.ssh/config | grep -v "[?*]" | cut -d " " -f2)" scp sftp ssh

# Alias
source "$HOME/.aliases"

# Prompt setup
 export PS1="\u @ \W$ "
