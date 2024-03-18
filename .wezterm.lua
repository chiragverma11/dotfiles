local wezterm = require 'wezterm'
local config = wezterm.config_builder()
config.color_scheme = 'Catppuccin Mocha'
config.font = wezterm.font 'JetBrains Mono'
config.window_decorations = "NONE"
config.tab_bar_at_bottom = true
return config
