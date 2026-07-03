# dotfiles

My personal config files for quickly setting up a new machine / VPS server.

## Contents

| File | Purpose |
|------|---------|
| `.tmux.conf` | tmux configuration |
| `.wezterm.lua` | WezTerm terminal configuration |

## Setup on a new machine

Clone the repo and symlink (or copy) the files into your home directory:

```sh
git clone https://github.com/spyderweb47/dotfiles.git ~/dotfiles
cd ~/dotfiles

ln -sf "$PWD/.tmux.conf"   ~/.tmux.conf
ln -sf "$PWD/.wezterm.lua" ~/.wezterm.lua
```

Using symlinks means editing the file in `~/dotfiles` and committing keeps everything in sync.
