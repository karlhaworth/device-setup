# ZSH Shortcuts

## KUBECTL SHORTCUTS

cat <<EOF >> ~/.zshrc
alias k="kubectl"
alias kg='kubectl get'
alias kl='kubectl logs '
alias kx='kubectl exec -i -t'
alias ka='kubectl apply -f'
alias kd='kubectl delete -f'
alias kctx='kubectx'
alias kns='kubens'
EOF