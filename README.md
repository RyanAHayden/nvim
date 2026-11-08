# nvim

One LazyVim config shared by macOS ([hypr-mac](https://github.com/RyanAHayden/hypr-mac)) and Linux ([dotfiles](https://github.com/RyanAHayden/dotfiles)), both of which clone this to `~/nvim` and run `setup.sh`. Taken from omarchy-desktop (dotfiles' config plus Omarchy's starter files).

`setup.sh` stows `config/` into `~/.config/nvim` with `--no-folding`: real directories with linked files, so `lazy-lock.json` and Omarchy's `lua/plugins/theme.lua` link stay local. Old links into hypr-mac's or dotfiles' `.config/nvim` are removed, and real files in the way (Omarchy's starter config) are moved to `.bak`.

Theme:
- with Omarchy (`~/.local/share/omarchy`): Omarchy's current theme, hot-reloaded when it changes (`omarchy-theme-hotreload.lua`, every theme plugin available via `all-themes.lua`)
- without (macOS): `ryha-theme.lua`, aether in the [ryha](https://github.com/RyanAHayden/omarchy-ryha-theme) colors

Backgrounds are transparent (`plugin/after/transparency.lua`), so the terminal's shows through.
