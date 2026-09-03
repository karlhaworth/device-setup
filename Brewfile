# Brewfile for macOS setup
#
# Shared baseline for every machine. Host-specific additions live in
# Brewfile.home / Brewfile.work and are applied by start.sh.

## Dock Utilities
brew 'dockutil'

## Git and related tools
brew 'git'
brew 'gh'
brew 'act'

brew 'gnupg'
brew 'pinentry-mac'

### Development Environments

#### Miscellaneous tools

brew 'jq'
brew 'yq'
brew 'watch'
brew 'less'
brew 'bash'
brew 'mkdocs'
brew 'prettier'
brew 'shellcheck'
brew 'shfmt'
brew 'pandoc'
brew 'hugo'
brew 'ffmpeg'

##### GNU / uutils replacements for the BSD userland
brew 'uutils-coreutils'
brew 'uutils-diffutils'
brew 'uutils-findutils'
brew 'gnu-indent'
brew 'gnu-tar'
brew 'gnu-which'
brew 'gpatch'

##### Networking
brew 'gping'
brew 'iperf'
brew 'telnet'

##### Supply chain / security scanning
brew 'scorecard'
brew 'trivy'

#### Python and related tools
# uv owns Python itself - do not add a python@X formula here.
brew 'uv'

#### Node.js and related tools
# volta owns node/npm/yarn - do not add brew 'node' or brew 'npm' here,
# they shadow volta's shims. Versions are installed by scripts/volta.zsh.
brew 'volta'

#### Java and related tools
# sdkman owns java/maven/gradle - do not add openjdk@X or maven here.
# Versions are installed by scripts/sdkman.zsh.
tap 'sdkman/tap'
brew 'sdkman-cli'

#### Go and related tools
brew 'go'

#### Infrastructure as code

tap 'hashicorp/tap'
brew 'hashicorp/tap/terraform'
brew 'ansible'
brew 'azure-cli'

# ZSH and related tools

brew 'zsh-autosuggestions'
brew 'zsh-syntax-highlighting'
brew 'starship'
brew 'fontconfig'
cask 'font-jetbrains-mono-nerd-font'
cask 'font-caskaydia-cove-nerd-font'
cask 'font-iosevka-term-nerd-font'
cask 'font-fira-mono-nerd-font'

## Kubernetes tools

brew 'kubernetes-cli'
brew 'stern'

brew 'helm'
brew 'kubectx'

brew 'openshift-cli'
brew 'kubescape'
brew 'kube-score'
brew 'kustomize'
brew 'krew'
brew 'derailed/k9s/k9s'
tap 'vladimirvivien/oss-tools'
brew 'ktop'

## Docker and related tools

brew 'docker'
brew 'docker-credential-helper'
brew 'docker-buildx'
brew 'docker-compose'
brew 'colima'

brew 'qemu'
brew 'lima-additional-guestagents'

brew 'grype'
brew 'dive'

## Databases

brew 'libpq'

## Casks

cask 'bruno'
cask 'chromium'
cask 'clocker'
cask 'drawio'
cask 'dbeaver-community'
cask 'firefox@developer-edition'
cask 'deskpad'
cask 'ghostty'
cask 'iterm2'
cask 'keepingyouawake'
cask 'microsoft-edge'
cask 'visual-studio-code'
cask 'zoom'
cask 'trex'
cask 'zen'
cask 'syntax-highlight'
cask 'ollama-app'

### Communication
cask 'slack'
cask 'microsoft-teams'

### AI
cask 'claude'
cask 'chatgpt'

## VS Code Extensions

vscode 'anthropic.claude-code'
vscode 'astral-sh.ty'
vscode 'bradlc.vscode-tailwindcss'
vscode 'charliemarsh.ruff'
vscode 'continue.continue'
vscode 'emeraldwalk.runonsave'
vscode 'esbenp.prettier-vscode'
vscode 'github.vscode-github-actions'
vscode 'github.vscode-pull-request-github'
vscode 'golang.go'
vscode 'hedeit.vscode-drawio'
vscode 'ms-kubernetes-tools.vscode-kubernetes-tools'
vscode 'ms-python.debugpy'
vscode 'ms-python.python'
vscode 'ms-python.vscode-pylance'
vscode 'ms-vscode.makefile-tools'
vscode 'ms-vsliveshare.vsliveshare'
vscode 'redhat.vscode-yaml'
vscode 'streetsidesoftware.code-spell-checker'
