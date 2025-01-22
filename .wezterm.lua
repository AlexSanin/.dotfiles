
-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices
config.font = wezterm.font 'FiraCode Nerd Font'
config.hide_tab_bar_if_only_one_tab = true

config.font_size = 16.0
config.window_background_opacity = 0.9
-- and finally, return the configuration to wezterm
--config.color_scheme = 'Matrix (terminal.sexy)'
--config.color_scheme = 'Tokyo Night Day'
--config.color_scheme = 'iTerm2 Light Background'
return config
