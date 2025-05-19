brew install docker
brew install docker-buildx

FILE="$HOME/.docker/config.json"
if [ ! -f "$FILE" ]; then
  mkdir -p "$(dirname "$FILE")"
  echo '{ "cliPluginsExtraDirs": ["/opt/homebrew/lib/docker/cli-plugins"] }' > "$FILE"
else
  jq '.cliPluginsExtraDirs = ["/opt/homebrew/lib/docker/cli-plugins"]' "$FILE" > temp.json && mv temp.json "$FILE"
fi

brew install colima

brew services start colima

 sudo ln -sf $HOME/.colima/default/docker.sock /var/run/docker.sock

brew install grype
brew install dive
