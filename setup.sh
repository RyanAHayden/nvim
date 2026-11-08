#!/usr/bin/env bash
# Stows this LazyVim config into ~/.config/nvim the same way on macOS (run from hypr-mac) and Linux (run from dotfiles).
# Safe to re-run.
set -euo pipefail

REPO="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
T="$HOME/.config/nvim"

if ! command -v stow >/dev/null; then
	if [ "$(uname)" = Darwin ]; then brew install stow; else sudo pacman -S --needed stow; fi
fi

echo "==> nvim: stow config into $T"
mkdir -p "$T"
# links left from when hypr-mac/dotfiles carried the config themselves
find "$T" -type l | while read -r l; do
	case $(readlink "$l") in */hypr-mac/.config/nvim/* | */dotfiles/.config/nvim/*) rm "$l" ;; esac
done
# real files in the way (Omarchy's starter config) go to .bak
(cd "$REPO/config" && find . -type f) | while read -r f; do
	if [ -e "$T/$f" ] && [ ! -L "$T/$f" ]; then mv "$T/$f" "$T/$f.bak"; fi
done
# --no-folding: real directories, linked files, so what nvim and Omarchy write there (lazy-lock.json, Omarchy's
# plugins/theme.lua link) stays local
stow -d "$REPO" -t "$T" --no-folding -R config
echo "==> nvim: done"
