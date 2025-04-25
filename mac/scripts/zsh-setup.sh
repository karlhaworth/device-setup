### ZSH Setup

#### Install Oh My ZSH

#### https://ohmyz.sh

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

#### Set Theme - PowerLevel10k

#### https://github.com/romkatv/powerlevel10k#oh-my-zsh

brew install powerlevel10k
echo "source $(brew --prefix)/share/powerlevel10k/powerlevel10k.zsh-theme" >>~/.zshrc
