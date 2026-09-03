export PATH="$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"

if [[ "$TERM_PROGRAM" == "vscode" ]]; then
  __vscode_shell_integration="/Applications/Visual Studio Code.app/Contents/Resources/app/out/vs/workbench/contrib/terminal/common/scripts/shellIntegration-rc.zsh"
  if [[ -r "$__vscode_shell_integration" ]]; then
    . "$__vscode_shell_integration"
  else
    . "$(code --locate-shell-integration-path zsh)"
  fi
  unset __vscode_shell_integration
fi
