brew install jenv

cat << 'EOF' | tee -a ~/.zshrc > /dev/null

export PATH="$HOME/.jenv/bin:$PATH"
eval "$(jenv init -)"

EOF
