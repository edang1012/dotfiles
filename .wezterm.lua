-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices

config.font = wezterm.font("MesloLGS Nerd Font Mono")
config.font_size = 14
config.color_scheme = "nord"

config.window_decorations = "TITLE | RESIZE"
config.window_background_opacity = 0.9
config.macos_window_background_blur = 15

config.enable_tab_bar = false
config.use_fancy_tab_bar = false
config.tab_bar_at_bottom = false
config.window_close_confirmation = "NeverPrompt"

config.window_padding = {
	left = "1.0cell",
	right = "0.5cell",
	top = "0.4cell",
	bottom = "0cell",
}

return config
