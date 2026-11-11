-- ryha theme (github.com/RyanAHayden/omarchy-ryha-theme), same colors as Ghostty's palette. Only when nothing has
-- linked a theme in as plugins/theme.lua: Omarchy links its current theme, hypr-mac's theme script (macOS) the one
-- it set, and both are hot-reloaded (omarchy-theme-hotreload.lua).
if vim.uv.fs_stat(vim.fn.expand("~/.local/share/omarchy")) or vim.uv.fs_stat(vim.fn.stdpath("config") .. "/lua/plugins/theme.lua") then
  return {}
end

return {
  { "LazyVim/LazyVim", opts = { colorscheme = "aether" } },
  {
    "omacom/aether.nvim",
    name = "aether",
    branch = "v3",
    priority = 1000,
    opts = {
      colors = {
        bg = "#000000", dark_bg = "#000000", darker_bg = "#000000", lighter_bg = "#1a1a1a",
        fg = "#e5e5e5", dark_fg = "#737373", light_fg = "#e5e5e5", bright_fg = "#ffffff", muted = "#737373",
        red = "#ef4444", yellow = "#f59e0b", orange = "#f97316", green = "#22c55e", cyan = "#06b6d4",
        blue = "#3b82f6", purple = "#a855f7", brown = "#7b4f06",
        bright_red = "#f87171", bright_yellow = "#fbbf24", bright_green = "#4ade80", bright_cyan = "#22d3ee",
        bright_blue = "#60a5fa", bright_purple = "#c084fc",
        accent = "#e5e5e5", cursor = "#ffffff", foreground = "#e5e5e5", background = "#000000",
        selection = "#3a3a3a", selection_foreground = "#ffffff", selection_background = "#3a3a3a",
      },
    },
  },
}
