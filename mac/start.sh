### XCODE
xcode-select --install

### BREW

/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

brew bundle install --file=brew/Brewfile
# brew bundle install --file=brew/Brewfile.work
# brew bundle install --file=brew/Brewfile.home

### ASDF

echo -e "\n. $(brew --prefix asdf)/libexec/asdf.sh" >> ~/.bash_profile
echo -e "\n. $(brew --prefix asdf)/etc/bash_completion.d/asdf.bash" >> ~/.bash_profile
echo -e "\n. $(brew --prefix asdf)/libexec/asdf.sh" >> ${ZDOTDIR:-~}/.zshrc

bash scripts/asdf-plugins.sh

### ZSH

bash scripts/zsh-setup.sh

### DOCK

pip install pyobjc docklib
python scripts/dock.work.py

### KREW Plugins

bash scripts/krew-plugins.sh

### GIT

bash scripts/git-setup.sh
