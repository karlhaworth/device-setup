brew install jenv

cat << 'EOF' | tee -a ~/.zshrc > /dev/null

export PATH="$HOME/.jenv/bin:$PATH"
eval "$(jenv init -)"

EOF

brew install openjdk@17 openjdk@21 openjdk

source ~/.zshrc

jenv add /opt/homebrew/opt/openjdk@17/libexec/openjdk.jdk/Contents/Home

jenv add /opt/homebrew/opt/openjdk@21/libexec/openjdk.jdk/Contents/Home

brew install maven gradle

jenv enable-plugin export
