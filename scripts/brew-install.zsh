#!/usr/bin/env zsh
#
# Installs Homebrew. The shellenv line is NOT appended to ~/.zprofile here -
# that is owned by zprofile-configs/brew.zsh, deployed by scripts/dotfiles.zsh.

set -euo pipefail

if ! command -v brew >/dev/null 2>&1; then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# Make brew usable for the rest of this run.
eval "$(/opt/homebrew/bin/brew shellenv)"

brew analytics off
