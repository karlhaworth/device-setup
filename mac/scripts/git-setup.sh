# Setup GIT

git config --global user.name "karlhaworth"
git config --global user.email github@karlhaworth.com


# SSH KEY

ssh-keygen -t rsa -b 4096 -C "github@karlhaworth.com" -f ~/.ssh/id_rsa

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