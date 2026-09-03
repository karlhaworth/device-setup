#!/usr/bin/env zsh

set -euo pipefail

export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"

kubectl krew install view-secret
kubectl krew install modify-secret
