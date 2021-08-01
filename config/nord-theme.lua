local dpi = require("beautiful.xresources").apply_dpi
local theme = {}
theme.font            = "Roboto Mono Nerd Font 11"

theme.red         = "#BF616A"
theme.orange      = "#D08770"
theme.yellow      = "#EBCB8B"
theme.green       = "#A3BE8C"
theme.aqua        = "#88C0D0"
theme.blue        = "#5E81AC"
theme.purple      = "#B48EAD"
theme.fg0         = "#D8DEE9"
theme.fg1         = "#E5E9F0"
theme.fg2         = "#ECEFF4"
theme.fg3         = "#ECEFF4"
theme.fg4         = "#ECEFF4"
theme.bg4         = "#2E3440"
theme.bg3         = "#3B4252"
theme.bg2         = "#434C5E"
theme.bg1         = "#4C566A"
theme.bg0         = "#4C566A"

theme.icon_color  = theme.fg_0
theme.useless_gap = 0
-- Widgets
theme.battery = theme.yellow
theme.brightness = theme.green
theme.clock = theme.orange
theme.volume = theme.purple
theme.widget_color = theme.aqua
theme.widget_text_color = theme.fg0

--  Borders
theme.gap_single_client = false
theme.border_width      = dpi(1)
theme.border_normal     = theme.bg0_h
theme.border_focus      = theme.aqua
theme.border_marked     = theme.lightpurple

-- Titlebars
theme.titlebar_bg_focus  = theme.bg0_s
theme.titlebar_fg_focus  = theme.bg0_s
theme.titlebar_fg_normal = theme.bg0_s
theme.titlebar_bg_normal = theme.bg0_s

-- Custom sizes
theme.small_gap        = dpi(2)
theme.gap              = dpi(4)
theme.big_gap          = dpi(14)
theme.negative_gap     = dpi(-6)
theme.big_negative_gap = dpi(-10)
theme.wibar_height     = dpi(21)
theme.titlebar_height  = dpi(20)

return theme
