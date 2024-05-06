read -n1 -p "Work or Home? [w,h]" type 


### XCODE
xcode-select --install

### BREW

/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

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
