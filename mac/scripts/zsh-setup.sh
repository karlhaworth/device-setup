### ZSH Setup

#### Install Oh My ZSH

#### https://ohmyz.sh

sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

#### Add OhMyZSH plugins

sed -ir 's|^plugins=(\(.*\))|plugins=(\1 kubectl history sudo emoji encode64 web-search asdf)|g' .zshrc

#### Set Theme - PowerLevel10k

#### https://github.com/romkatv/powerlevel10k#oh-my-zsh

git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
sed -i 's|ZSH_THEME=.*|ZSH_THEME="powerlevel10k/powerlevel10k"|g' ~/.zshrc

#### Install Autosuggestions

#### https://github.com/zsh-users/zsh-autosuggestions/blob/master/INSTALL.md

git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
sed -ir 's|^plugins=(\(.*\))|plugins=(\1 zsh-autosuggestions)|g' ~/.zshrc

#### Install ZSH Suggestions

git clone https://github.com/zsh-users/zsh-completions ${ZSH_CUSTOM:=~/.oh-my-zsh/custom}/plugins/zsh-completions
sed -ir 's|^plugins=(\(.*\))|plugins=(\1 zsh-completions)|g' ~/.zshrc