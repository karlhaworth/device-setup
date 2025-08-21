#!/bin/bash

stty sane

read -p "Enter name: " name
read -s -p "Enter password: " password
echo
read -p "Enter email: " email
echo

# Setup GIT

git config --global user.name "$name"
git config --global user.email "$email"
git config --global pull.rebase false

# SSH KEY

ssh-keygen -t rsa -b 4096 -C "$email" -P "$password" -f ~/.ssh/id_rsa

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
gh config set pager cat

gpg --armor --export $KEYID

echo "GIT setup complete. Upload the public key above to GitHub."
