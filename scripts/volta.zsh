#!/usr/bin/env zsh
#
# volta owns node/npm/yarn - there is deliberately no brew 'node' formula.

set -euo pipefail

export VOLTA_HOME="$HOME/.volta"
export PATH="$VOLTA_HOME/bin:$PATH"

volta install node
volta install yarn
