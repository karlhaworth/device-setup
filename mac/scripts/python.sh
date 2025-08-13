brew install python
brew install uv
brew install pipenv
brew install pyenv

cat << EOF >> ~/.zshrc
alias python=/opt/homebrew/bin/python3
alias pip=/opt/homebrew/bin/pip3
EOF
