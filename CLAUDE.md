# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Overview

Personal macOS dotfiles repository. Manages shell config, dev environment setup, and app preferences via symlinks from `home/` to `$HOME`.

## Setup Flow

Three-stage bootstrap: `bootstrap.sh` -> `symlinks.sh` -> `install.sh`

- **bootstrap.sh**: macOS updates, Xcode CLI tools, clones repo to `~/code/github/dotfiles`
- **symlinks.sh**: Recursively symlinks all files in `home/` to `$HOME`
- **install.sh**: Installs Homebrew, asdf (Python/Node.js), Oh My Zsh + Pure prompt, VimAwesome

After editing files in `home/`, re-run `./symlinks.sh` to update symlinks.

## Architecture

```
home/           -> Dotfiles symlinked to $HOME (the core content)
  .claude/      -> Claude Code config (CLAUDE.md with personal dev guidelines)
  .zshrc        -> Zsh config (Oh My Zsh, PATH, env vars, asdf)
  .aliases      -> Shell aliases (eza, bat, Django, Game Boy dev tools)
  .gitconfig    -> Git config (ff-only pulls, main default branch)
  .gitignore    -> Global gitignore
vscode/         -> VS Code settings (not symlinked, manual copy)
claude/skills/  -> Claude Code skill definitions
Brewfile        -> Homebrew package declarations (CLI tools + casks)
```

## Key Conventions

- Shell scripts use `set -euo pipefail` for strict error handling
- `home/.claude/CLAUDE.md` contains the user's global development guidelines (symlinked to `~/.claude/CLAUDE.md`) -- do not duplicate its contents here
- Brewfile is the source of truth for system packages
- Tools aliased: `ls`=eza, `cat`=bat, `dj`=`python manage.py`
- Version management via asdf (Python latest, Node.js LTS)

## Linting

Shell scripts can be checked with shellcheck (installed via Brewfile):

```bash
shellcheck bootstrap.sh install.sh symlinks.sh
```
