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
if [ ! -f "$FILE" ]; then
  echo '{ "cliPluginsExtraDirs": ["/opt/homebrew/lib/docker/cli-plugins"] }' > "$FILE"
else
  jq '.cliPluginsExtraDirs = ["/opt/homebrew/lib/docker/cli-plugins"]' "$FILE" > temp.json && mv temp.json "$FILE"
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