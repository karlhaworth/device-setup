brew install go

go env -w GOPATH=$HOME/.go

cat << EOF >> ~/.zshrc
export PATH="$HOME/.go/bin:$PATH"
EOF
