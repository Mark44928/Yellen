-- Yellen Dark — warm golden theme for WezTerm
-- Install: cp extras/wezterm.lua ~/.config/wezterm/yellen.lua
--   then in ~/.wezterm.lua:
--     local yellen = require("yellen")
--     yellen.apply(config)

local M = {}

local dark = {
  background = "#171408",
  foreground = "#F3E8B8",
  cursor_bg = "#F2D14E",
  cursor_fg = "#171408",
  selection_bg = "#3A3114",
  selection_fg = "#F7EDC4",
  ansi = {
    "#2A2612", "#C76A52", "#A9B85A", "#F2D14E",
    "#D6A843", "#C6986A", "#D8B85A", "#E6D7A4",
  },
  brights = {
    "#745F2B", "#E08A6A", "#C2D26A", "#F7DE72",
    "#E8BD54", "#D8AD70", "#F0CB68", "#FBF1C7",
  },
}

local light = {
  background = "#FBF6DE",
  foreground = "#332A0D",
  cursor_bg = "#8B6E15",
  cursor_fg = "#FBF6DE",
  selection_bg = "#EFE4B9",
  selection_fg = "#332A0D",
  ansi = {
    "#EFE7C4", "#A4442D", "#66721F", "#8A6B11",
    "#8B6A12", "#8A5F36", "#7A5C13", "#D3C48E",
  },
  brights = {
    "#75673C", "#B65C43", "#7A8829", "#A37E18",
    "#A77A1A", "#A06E42", "#927018", "#FFFDF5",
  },
}

function M.apply(config, variant)
  local theme = (variant == "light") and light or dark
  config.colors = {
    background = theme.background,
    foreground = theme.foreground,
    cursor_bg = theme.cursor_bg,
    cursor_fg = theme.cursor_fg,
    selection_bg = theme.selection_bg,
    selection_fg = theme.selection_fg,
    ansi = theme.ansi,
    brights = theme.brights,
  }
  config.color_scheme = nil
  config.color_schemes = nil
end

return M
