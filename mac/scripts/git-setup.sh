# Setup GIT

git config --global user.name "xx"
git config --global user.email xx
git config --global pull.rebase false

# SSH KEY

ssh-keygen -t rsa -b 4096 -C "xx" -f ~/.ssh/id_rsa

# GPG

mkdir ~/.gnupg
echo 'use-agent' > ~/.gnupg/gpg.conf
echo 'export GPG_TTY=$(tty)' >> ~/.zshrc
chmod 700 ~/.gnupg
gpg --full-gen-key
gpg -k
gpg --armor --export <your key id>
git config --global gpg.program $(which gpg)
git config --global user.signingkey <your key id>
git config --global commit.gpgsign true

# Global .gitignore

cat > ~/.gitignore << EOF
.tool-versions
EOF

git config --global core.excludesfile ~/.gitignore
