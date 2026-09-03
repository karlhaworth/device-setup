#!/usr/bin/env zsh
#
# Deploys this repo's shell config into $HOME.
#
# Symlinks zsh-configs/ and zprofile-configs/ into ~, then makes sure
# ~/.zshrc and ~/.zprofile each source their directory. Both steps are
# idempotent and additive - existing rc content is never overwritten.

set -euo pipefail

repo_dir="${0:A:h:h}"

link_config_dir() {
  local src="$1" dest="$2"

  if [[ -L "$dest" ]]; then
    if [[ "${dest:A}" == "${src:A}" ]]; then
      echo "ok: $dest -> $src"
      return
    fi
    echo "relinking $dest (was ${dest:A})"
    rm "$dest"
  elif [[ -e "$dest" ]]; then
    local backup="${dest}.backup.$(date +%Y%m%d%H%M%S)"
    echo "moving existing $dest -> $backup"
    mv "$dest" "$backup"
  fi

  ln -s "$src" "$dest"
  echo "linked $dest -> $src"
}

ensure_block() {
  local file="$1" marker="$2" body="$3"

  touch "$file"
  if grep -q "# BEGIN ${marker}" "$file"; then
    echo "ok: $file already sources ${marker}"
    return
  fi

  printf '\n# BEGIN %s\n%s\n# END %s\n' "$marker" "$body" "$marker" >>"$file"
  echo "added ${marker} block to $file"
}

link_config_dir "${repo_dir}/zsh-configs" "$HOME/zsh-configs"
link_config_dir "${repo_dir}/zprofile-configs" "$HOME/zprofile-configs"

# Login shells: env/PATH that only needs computing once per login.
ensure_block "$HOME/.zprofile" "DEVICE-SETUP ZPROFILE-CONFIGS" \
  'for config (~/zprofile-configs/*.zsh(N)) source $config'

# Interactive shells: prompt, aliases, completions, history.
ensure_block "$HOME/.zshrc" "DEVICE-SETUP ZSH-CONFIGS" \
  'for config (~/zsh-configs/*.zsh(N)) source $config'

echo
echo "Shell config deployed. Open a new terminal to pick it up."
