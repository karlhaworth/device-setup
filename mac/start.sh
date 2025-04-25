read -n1 -p "Work or Home? [w,h]" type 


### XCODE
xcode-select --install

### BREW

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

echo >> ~/.zprofile
echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.zprofile
eval "$(/opt/homebrew/bin/brew shellenv)"

brew bundle install --file=brew/Brewfile
case $type in  
  w|W) brew bundle install --file=brew/Brewfile.work ;; 
  h|H) brew bundle install --file=brew/Brewfile.home ;; 
esac

### NVM

bash scripts/nvm.sh

### JENV

bash scripts/jenv.sh

### ZSH

bash scripts/zsh-setup.sh

### DOCK

pip install pyobjc docklib

case $type in  
  w|W) python scripts/dock.work.py ;; 
  h|H) python scripts/dock.home.py ;; 
esac

### KREW Plugins

bash scripts/krew-plugins.sh

### GIT

bash scripts/git-setup.sh

### Extras

#### Set Go to another directory

go env -w GOPATH=$HOME/.go
