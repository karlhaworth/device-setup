# Device Setup

## Mac

### Setup

```zsh
cd mac

bash start.sh
```

### ZPROFILE

Login-only setup (env vars/PATH that only need to be computed once per login, e.g. `brew shellenv`) goes here, keeping it out of every new interactive shell:

```zsh
for config (~/zprofile-configs/*.zsh) source $config
```

### ZSHRC

Everything else (interactive-shell state: prompt, aliases, completions, history options) goes here, since it runs on every new shell:

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
