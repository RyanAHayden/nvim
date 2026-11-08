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
# lua/ and plugin/ are linked whole (stow folds them), so new plugin files show up here and on other machines
# without re-running this. Real directories in the way (Omarchy's starter config, or per-file links from an older
# version of this script) are emptied of links into this repo and, if anything is left, moved to .bak.
(cd "$REPO/config" && find . -mindepth 1 -maxdepth 1 -type d) | while read -r d; do
	[ -d "$T/$d" ] && [ ! -L "$T/$d" ] || continue
	find "$T/$d" -type l -lname '*nvim/config/*' -delete
	find "$T/$d" -depth -type d -empty -delete
	if [ -e "$T/$d" ]; then rm -rf "$T/$d.bak" && mv "$T/$d" "$T/$d.bak"; fi
done
# real top-level files in the way (Omarchy's init.lua, stylua.toml, .neoconf.json) go to .bak too
(cd "$REPO/config" && find . -mindepth 1 -maxdepth 1 -type f) | while read -r f; do
	if [ -e "$T/$f" ] && [ ! -L "$T/$f" ]; then mv "$T/$f" "$T/$f.bak"; fi
done
stow -d "$REPO" -t "$T" -R config
# Omarchy's theme link now lives inside the repo's lua/plugins (gitignored); absolute, since it's no longer at
# ~/.config/nvim/lua/plugins on disk (Omarchy's migrations accept either)
theme="$HOME/.local/state/omarchy/current/theme/neovim.lua"
[ -e "$theme" ] && ln -sfn "$theme" "$T/lua/plugins/theme.lua"
echo "==> nvim: done"
