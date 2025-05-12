code --install-extension 4ops.terraform
code --install-extension adamhartford.vscode-base64
code --install-extension bierner.markdown-mermaid
code --install-extension davidanson.vscode-markdownlint
code --install-extension esbenp.prettier-vscode
code --install-extension exiasr.hadolint
code --install-extension foxundermoon.shell-format
code --install-extension github.copilot
code --install-extension github.copilot-chat
code --install-extension github.vscode-github-actions
code --install-extension github.vscode-pull-request-github
code --install-extension golang.go
code --install-extension hashicorp.hcl
code --install-extension hashicorp.terraform
code --install-extension hediet.vscode-drawio
code --install-extension jflbr.jwt-decoder
code --install-extension jock.svg
code --install-extension mariusalchimavicius.json-to-ts
code --install-extension me-dutour-mathieu.vscode-github-actions
code --install-extension ms-azuretools.vscode-docker
code --install-extension ms-python.black-formatter
code --install-extension ms-python.debugpy
code --install-extension ms-python.python
code --install-extension ms-python.vscode-pylance
code --install-extension ms-sarifvscode.sarif-viewer
code --install-extension orta.vscode-jest
code --install-extension redhat.vscode-yaml
code --install-extension rosshamish.kuskus-kusto-language-server
code --install-extension streetsidesoftware.code-spell-checker
code --install-extension waderyan.gitblame
code --install-extension wdhongtw.gpg-indicator

jq '."git.defaultCloneDirectory" = "~/dev"' ~/Library/Application\ Support/Code/User/settings.json
jq '."files.dislog.defaultPath" = "~/dev"' ~/Library/Application\ Support/Code/User/settings.json

cat >> ~/.zshrc << EOF

export PATH="$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"

EOF
