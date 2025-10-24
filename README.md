# Device Setup

## Mac

### Setup

```zsh
cd mac

bash start.sh
```

### ZSHRC

```zsh
for config (~/zsh-configs/*.zsh) source $config
```

### Upgrade Software

```zsh
brew upgrade
sudo softwareupdate --install --all
```

#### Brew Update

This command updates Homebrew itself and fetches the latest information about available packages (formulas and casks) from the Homebrew repositories on GitHub.

```zsh
brew update
```

#### Brew Upgrade Casks

```zsh
brew upgrade --casks --greedy --verbose
```

### Cleanup

```zsh
brew outdated
brew autoremove
brew cleanup --prune=all --dry-run
```

### Misc

#### Colima

##### Standard

```bash
colima start --memory 10 --cpu 6 --disk 100 --arch aarch64 --network-address
```

##### x86_64

```bash
colima start --memory 10 --cpu 6 --disk 100 --arch x86_64 --vz-rosetta --vm-type=vz --mount-type=virtiofs
```

### Helpful Links

- [store sensitive environment variables](https://medium.com/@johnjjung/how-to-store-sensitive-environment-variables-on-macos-76bd5ba464f6)
- [system-wide mic mute](https://brett.cloud/mic-mute/)
