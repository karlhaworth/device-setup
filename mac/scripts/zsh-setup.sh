### ZSH Setup

#### Install Oh My ZSH

#### https://ohmyz.sh

sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

#### Add OhMyZSH plugins

sed -ir 's|^plugins=(\(.*\))|plugins=(\1 kubectl history sudo)|g' ~/.zshrc

#### Set Theme - PowerLevel10k

#### https://github.com/romkatv/powerlevel10k#oh-my-zsh

git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
gsed -i 's|ZSH_THEME=.*|ZSH_THEME="powerlevel10k/powerlevel10k"|g' ~/.zshrc

#### Autocomplete

gsed -i '1s|^|source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh\n|' ~/.zshrc

#### OTHERS

gsed -i '1s|^|export PATH=/opt/homebrew/opt/coreutils/libexec/gnubin:$PATH\n|' ~/.zshrc
gsed -i '1s|^|export PATH=/opt/homebrew/opt/gnu-sed/libexec/gnubin:$PATH\n|' ~/.zshrc
