#!/usr/bin/env bash
#
# install.sh — symlink dotfiles from this repo into $HOME.
#
# Usage:
#   ./install.sh          # symlink everything, backing up any existing files
#   ./install.sh --dry-run # show what would happen, change nothing
#
set -euo pipefail

DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
BACKUP_DIR="$HOME/.dotfiles-backup"

DRY_RUN=false
[[ "${1:-}" == "--dry-run" ]] && DRY_RUN=true

# Files to symlink into $HOME. Add new dotfiles here as you grow the repo.
FILES=(
  .tmux.conf
  .wezterm.lua
)

log() { printf '%s\n' "$*"; }
run() { $DRY_RUN && log "  [dry-run] $*" || eval "$*"; }

log "Dotfiles: $DOTFILES_DIR"
$DRY_RUN && log "(dry run — no changes will be made)"

for f in "${FILES[@]}"; do
  src="$DOTFILES_DIR/$f"
  dest="$HOME/$f"

  if [[ ! -e "$src" ]]; then
    log "! skip $f (not found in repo)"
    continue
  fi

  # Already the correct symlink? Nothing to do.
  if [[ -L "$dest" && "$(readlink "$dest")" == "$src" ]]; then
    log "= $f already linked"
    continue
  fi

  # Back up an existing real file / wrong symlink before replacing.
  if [[ -e "$dest" || -L "$dest" ]]; then
    run "mkdir -p '$BACKUP_DIR'"
    run "mv '$dest' '$BACKUP_DIR/$f.$(date +%s)'"
    log "~ backed up existing $f to $BACKUP_DIR/"
  fi

  run "ln -sf '$src' '$dest'"
  log "+ linked $f"
done

log "Done."
