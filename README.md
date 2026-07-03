# dotfiles

My personal config files for quickly setting up a new machine / VPS server.

## Contents

| File | Purpose |
|------|---------|
| `.tmux.conf` | tmux configuration |
| `.wezterm.lua` | WezTerm terminal configuration |

## Setup on a new machine

Clone the repo and run the install script — it symlinks each config into your
home directory, backing up any existing file to `~/.dotfiles-backup/` first:

```sh
git clone https://github.com/spyderweb47/dotfiles.git ~/dotfiles
cd ~/dotfiles
./install.sh
```

Preview what it would do without changing anything:

```sh
./install.sh --dry-run
```

Using symlinks means editing the file in `~/dotfiles` and committing keeps
everything in sync — the live config and the repo are the same file.

### Adding new dotfiles

1. Move the file into this repo.
2. Add its name to the `FILES=(...)` array in `install.sh`.
3. Re-run `./install.sh`, then commit and push.
