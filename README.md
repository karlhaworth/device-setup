# Device Setup

## Mac

### Setup

```zsh
GIT_NAME="Your Name" GIT_EMAIL="you@example.com" ./start.sh work
```

The profile argument is optional and selects a host-specific Brewfile on top of
the shared one: `home` applies `Brewfile.home`, `work` applies `Brewfile.work`.
A restart is needed afterwards for `scripts/file-system.zsh` to take effect.

### Shell config

`scripts/dotfiles.zsh` symlinks both config directories into `~` and adds a
sourcing loop to each rc file. It is idempotent and never overwrites existing
rc content, so it is safe to re-run on an already-configured machine.

| Directory           | Sourced from | Runs                  | Holds                                                  |
| ------------------- | ------------ | --------------------- | ------------------------------------------------------ |
| `zprofile-configs/` | `~/.zprofile`| once per login        | env vars and `PATH` (`brew shellenv`, `DOCKER_HOST`)   |
| `zsh-configs/`      | `~/.zshrc`   | every interactive shell | prompt, aliases, completions, history options        |

Anything that only needs computing once belongs in `zprofile-configs/` - it is
inherited by every child shell, so putting it in `zsh-configs/` just pays the
cost again on every new tab.

### Toolchain ownership

Each language has exactly one version manager. Adding the equivalent Homebrew
formula shadows it and is deliberately excluded from the Brewfile:

| Language | Owned by  | Do not `brew install`         |
| -------- | --------- | ----------------------------- |
| Node     | volta     | `node`, `npm`, `yarn`         |
| Java     | sdkman    | `openjdk@*`, `maven`, `gradle`|
| Python   | uv        | `python@*`                    |

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
