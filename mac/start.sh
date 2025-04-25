read -n1 -p "Work or Home? [w,h]" type 


### XCODE
xcode-select --install

### BREW

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

echo >> ~/.zprofile
echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.zprofile
eval "$(/opt/homebrew/bin/brew shellenv)"

### Node

bash scripts/node.sh

### Java

bash scripts/java.sh

### ZSH

bash scripts/zsh-setup.sh

### GIT

bash scripts/git-setup.sh
