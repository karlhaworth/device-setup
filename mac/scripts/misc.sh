# GNU Core Utils
brew install coreutils
brew install autoconf
brew install binutils
brew install diffutils
brew install ed
brew install findutils
brew install gawk
brew install gnu-sed
brew install grep
brew install gzip
brew install make
brew install nano
brew install screen
brew install watch
brew install wdiff
brew install wget
brew install zip

cat << EOF >> ~/.zshrc
export PATH="/opt/homebrew/opt/gnu-sed/libexec/gnubin:$PATH"
export PATH="/opt/homebrew/opt/coreutils/libexec/gnubin:$PATH"
export PATH="/opt/homebrew/opt/binutils/bin:$PATH"
export PATH="/opt/homebrew/opt/findutils/libexec/gnubin:$PATH"
export PATH="/opt/homebrew/opt/gawk/libexec/gnubin:$PATH"
export PATH="/opt/homebrew/opt/ed/bin:$PATH"
export PATH="/opt/homebrew/opt/grep/libexec/gnubin:$PATH"
export PATH="/opt/homebrew/opt/make/libexec/gnubin:$PATH"
export PATH="/opt/homebrew/opt/zip/bin:$PATH"
EOF

brew install terraform

brew install shellcheck

brew install dockutil
