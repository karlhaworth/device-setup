#!/usr/bin/env zsh
#
# 'sdk' is a shell function, not a binary - it has to be sourced before use.

set -euo pipefail

export SDKMAN_DIR="$(brew --prefix sdkman-cli)/libexec"
source "${SDKMAN_DIR}/bin/sdkman-init.sh"

sdk install java 17.0.12-tem
sdk default java 17.0.12-tem

sdk install maven 3.9.10
sdk default maven 3.9.10

sdk install gradle 9.0.0
sdk default gradle 9.0.0
