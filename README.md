# nvim

One LazyVim config shared by macOS ([hypr-mac](https://github.com/RyanAHayden/hypr-mac)) and Linux ([dotfiles](https://github.com/RyanAHayden/dotfiles)), both of which clone this to `~/nvim` and run `setup.sh`. Taken from omarchy-desktop (dotfiles' config plus Omarchy's starter files).

`setup.sh` stows `config/` into `~/.config/nvim`: `lua/` and `plugin/` become links to the repo's folders, the top-level files are linked one by one, and `lazy-lock.json` stays local. Old links into hypr-mac's or dotfiles' `.config/nvim` are removed; Omarchy's starter files in the way go to `.bak` (`lua.bak` keeps its `example.lua` and anything else that was local).

Adding a plugin: create `lua/plugins/<name>.lua` (in `~/nvim/config` or `~/.config/nvim`, it's the same folder), commit and push. On the other machines `git -C ~/nvim pull`, and Lazy installs it the next time nvim starts. Extras toggled with `:LazyExtras` are saved in `lazyvim.json`, which is linked too.

Theme:
- with Omarchy (`~/.local/share/omarchy`): Omarchy's current theme (`setup.sh` links it in as `lua/plugins/theme.lua`, gitignored), hot-reloaded when it changes (`omarchy-theme-hotreload.lua`, every theme plugin available via `all-themes.lua`)
- without (macOS): `ryha-theme.lua`, aether in the [ryha](https://github.com/RyanAHayden/omarchy-ryha-theme) colors

Backgrounds are transparent (`plugin/after/transparency.lua`), so the terminal's shows through.
