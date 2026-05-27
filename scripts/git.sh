#!/bin/bash

stty sane

name=""
email=""
ssh_key_file="$HOME/.ssh/id_ed25519_github"

while [[ "$#" -gt 0 ]]; do
  case "$1" in
    --name)
      name="$2"
      shift 2
      ;;
    --email)
      email="$2"
      shift 2
      ;;
    --ssh-key-file)
      ssh_key_file="$2"
      shift 2
      ;;
    *)
      echo "Usage: $0 --name NAME --email EMAIL [--ssh-key-file PATH]"
      exit 1
      ;;
  esac
done

name="${name:-${GIT_NAME:-$(git config --global user.name)}}"
email="${email:-${GIT_EMAIL:-$(git config --global user.email)}}"

if [[ -z "$name" || -z "$email" ]]; then
  echo "Error: name and email are required."
  echo "Usage: $0 --name NAME --email EMAIL [--ssh-key-file PATH]"
  exit 1
fi

# Setup GIT

git config --global user.name "$name"
git config --global user.email "$email"
git config --global pull.rebase false

# SSH KEY

mkdir -p "$HOME/.ssh"
chmod 700 "$HOME/.ssh"

if [[ -f "$ssh_key_file" ]]; then
  echo "SSH key already exists at $ssh_key_file. Skipping generation."
else
  ssh-keygen -t ed25519 -C "$email" -N "" -f "$ssh_key_file"
fi

echo "Generated GitHub SSH public key: ${ssh_key_file}.pub"
cat "${ssh_key_file}.pub"

# GPG

mkdir ~/.gnupg
echo 'use-agent' > ~/.gnupg/gpg.conf
echo 'export GPG_TTY=$(tty)' >> ~/.zshrc
chmod 700 ~/.gnupg
gpg --full-gen-key --batch <(echo "Key-Type: 1"; \
                             echo "Key-Length: 4096"; \
                             echo "Subkey-Type: 1"; \
                             echo "Subkey-Length: 4096"; \
                             echo "Expire-Date: 0"; \
                             echo "Name-Real: $name"; \
                             echo "Name-Email: $email"; \
                             echo "%no-protection"; )
KEYID=$(gpg -k | awk '{for(i=1;i<=NF;i++) if($i ~ /^[A-F0-9]{40}$/) print $i}')
git config --global gpg.program $(which gpg)
git config --global user.signingkey $KEYID
git config --global commit.gpgsign true

# Global .gitignore

cat > ~/.gitignore << EOF
.tool-versions
EOF

git config --global core.excludesfile ~/.gitignore
git config --global push.autoSetupRemote true
git config --global core.symlinks true
gh config set pager cat

gpg --armor --export $KEYID

echo "GIT setup complete. Upload the public key above to GitHub."
