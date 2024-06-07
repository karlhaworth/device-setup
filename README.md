# Device Setup

## Mac

### Setup

```zsh
cd mac

bash start.sh
```

### Update

```zsh
cd mac

brew upgrade
sudo softwareupdate --install --all
```

### Cleanup

```zsh
brew outdated
brew autoremove
brew cleanup --prune=all --dry-run
```

### Misc

#### Colima

```bash
colima start --memory 10 --cpu 6 --disk 100 --arch aarch64 --network-address
```

### Helpful Links

- [store sensitive environment variables](https://medium.com/@johnjjung/how-to-store-sensitive-environment-variables-on-macos-76bd5ba464f6)
