#!/usr/bin/env zsh
#
# Provisions a Mac from scratch.
#
#   ./start.sh [home|work]
#
# Git identity is required for the git step; pass it via the environment:
#   GIT_NAME="Your Name" GIT_EMAIL="you@example.com" ./start.sh work

set -euo pipefail

repo_dir="${0:A:h}"
cd "$repo_dir"

profile="${1:-}"
if [[ -n "$profile" && "$profile" != "home" && "$profile" != "work" ]]; then
  echo "Usage: $0 [home|work]" >&2
  exit 1
fi

step() { echo "\n==> $*" }

step "Xcode command line tools"
xcode-select --install 2>/dev/null || echo "already installed"

step "Homebrew"
./scripts/brew-install.zsh
eval "$(/opt/homebrew/bin/brew shellenv)"

step "Brewfile"
brew bundle install --file=Brewfile

if [[ -n "$profile" ]]; then
  step "Brewfile.${profile}"
  brew bundle install --file="Brewfile.${profile}"
fi

step "Shell config"
./scripts/dotfiles.zsh

step "Git, SSH and GPG"
./scripts/git.zsh

step "File system"
./scripts/file-system.zsh

step "Language toolchains"
./scripts/sdkman.zsh
./scripts/volta.zsh
./scripts/uv.zsh
./scripts/go.zsh

step "Package manager hardening"
./scripts/npm.zsh
./scripts/pip.zsh

step "Kubernetes"
./scripts/krew.zsh

step "Docker"
./scripts/docker.zsh

step "VS Code"
./scripts/vscode.zsh

step "Dock"
./scripts/dock.zsh

if [[ "$profile" == "work" ]]; then
  step "IntelliJ IDEA"
  ./scripts/intellij-idea.zsh
fi

echo "\nDone. A restart is required for scripts/file-system.zsh to take effect."
