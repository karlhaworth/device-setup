FILE="$HOME/.docker/config.json"

# parse optional registry args for configuring credHelpers
registries=()
while [[ "$#" -gt 0 ]]; do
  case "$1" in
    --registry)
      registries+=("$2")
      shift 2
      ;;
    *)
      echo "Usage: $0 [--registry REGISTRY ...]"
      exit 1
      ;;
  esac
done

mkdir -p "$(dirname "$FILE")"

cliPluginDirs=()
if [[ -d "/opt/homebrew/lib/docker/cli-plugins" ]]; then
  cliPluginDirs+=("/opt/homebrew/lib/docker/cli-plugins")
fi
if [[ -d "/usr/local/lib/docker/cli-plugins" ]]; then
  cliPluginDirs+=("/usr/local/lib/docker/cli-plugins")
fi
if [[ -d "$HOME/.docker/cli-plugins" ]]; then
  cliPluginDirs+=("$HOME/.docker/cli-plugins")
fi
if [[ ${#cliPluginDirs[@]} -eq 0 ]]; then
  cliPluginDirs=("/opt/homebrew/lib/docker/cli-plugins")
fi

cliPluginDirsJson=$(printf '%s\n' "${cliPluginDirs[@]}" | jq -R . | jq -s .)
if [[ ! -f "$FILE" ]]; then
  jq -n --argjson dirs "$cliPluginDirsJson" '{cliPluginsExtraDirs: $dirs}' > "$FILE"
else
  jq --argjson dirs "$cliPluginDirsJson" '.cliPluginsExtraDirs = $dirs' "$FILE" > temp.json && mv temp.json "$FILE"
fi

# ensure user cli-plugins dir exists and add compose/buildx plugin metadata to config
mkdir -p "$HOME/.docker/cli-plugins"

compose_path="$HOME/.docker/cli-plugins/docker-compose"
buildx_path="$HOME/.docker/cli-plugins/docker-buildx"

# Add cliPlugins entries (will not download binaries, only configure paths)
jq --arg cp "$compose_path" --arg bp "$buildx_path" '
  .cliPlugins = (.cliPlugins // {}) |
  .cliPlugins["docker-compose"] = {"path": $cp, "enabled": true} |
  .cliPlugins["docker-buildx"] = {"path": $bp, "enabled": true}
' "$FILE" > temp.json && mv temp.json "$FILE"

# Informational guidance if plugins are missing
if ! docker compose version >/dev/null 2>&1; then
  echo "Docker Compose CLI plugin not detected. To install, download the appropriate binary into: $compose_path and make it executable. Example (replace ARCH/OS as needed):"
  echo "  curl -Lo \"$compose_path\" \"https://github.com/docker/compose/releases/latest/download/docker-compose-DARWIN-ARCH\" && chmod +x \"$compose_path\""
fi

if ! docker buildx version >/dev/null 2>&1; then
  echo "Docker Buildx plugin not detected. To install, download the appropriate binary into: $buildx_path and make it executable. Example (replace ARCH/OS as needed):"
  echo "  curl -Lo \"$buildx_path\" \"https://github.com/docker/buildx/releases/latest/download/buildx-DARWIN-ARCH\" && chmod +x \"$buildx_path\""
fi

# Prefer Docker Desktop's osxkeychain helper when available
creds_store=""
if command -v docker-credential-osxkeychain >/dev/null 2>&1; then
  creds_store="osxkeychain"
elif command -v docker-credential-helper >/dev/null 2>&1; then
  creds_store="osxkeychain"
elif [[ -f "/Applications/Docker.app/Contents/Resources/bin/docker-credential-osxkeychain" ]]; then
  creds_store="osxkeychain"
fi

if [[ -n "$creds_store" ]]; then
  # set credsStore
  jq --arg cs "$creds_store" '.credsStore = $cs' "$FILE" > temp.json && mv temp.json "$FILE"

  # add any registry-specific helpers
  for reg in "${registries[@]}"; do
    jq --arg reg "$reg" --arg cs "$creds_store" '.credHelpers[$reg] = $cs' "$FILE" > temp.json && mv temp.json "$FILE"
  done

  echo "Configured Docker to use credential store: $creds_store"
else
  echo "docker-credential-osxkeychain not found; skipped configuring credsStore. Install Docker Desktop or the osxkeychain helper to enable keychain-backed creds."
fi

chmod 600 "$FILE"

# start Colima and expose socket for Docker CLI
brew services start colima

sudo ln -sf $HOME/.colima/default/docker.sock /var/run/docker.sock