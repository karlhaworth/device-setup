# Device Setup

## Mac

### Setup

```zsh
cd mac

bash start.sh
```

### ZSHRC

```zsh
for config (~/mac/zsh-configs/*.zsh) source $config
```

### Update

```zsh
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
