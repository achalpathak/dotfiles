local wezterm = require("wezterm")
local config = wezterm.config_builder()

config.font = wezterm.font("Dank Mono", { weight = "Regular", italic = false })
config.font_size = 17
config.window_decorations = "RESIZE"
config.enable_wayland = false

-- coolnight colorscheme
-- config.colors = {
-- 	foreground = "#CBE0F0",
-- 	background = "#011423",
-- 	cursor_bg = "#47FF9C",
-- 	cursor_border = "#47FF9C",
-- 	cursor_fg = "#011423",
-- 	selection_bg = "#033259",
-- 	selection_fg = "#CBE0F0",
-- 	ansi = { "#214969", "#E52E2E", "#44FFB1", "#FFE073", "#0FC5ED", "#a277ff", "#24EAF7", "#24EAF7" },
-- 	brights = { "#214969", "#E52E2E", "#44FFB1", "#FFE073", "#A277FF", "#a277ff", "#24EAF7", "#24EAF7" },
-- }

config.color_scheme = "Catppuccin Mocha"

config.window_background_opacity = 0.2
config.macos_window_background_blur = 10
config.exit_behavior = "Close"
config.scrollback_lines = 50000
config.enable_tab_bar = true
config.hide_tab_bar_if_only_one_tab = true
config.use_fancy_tab_bar = true
config.window_close_confirmation = "NeverPrompt"
config.use_resize_increments = true

config.leader = { key = "a", mods = "CTRL", timeout_milliseconds = 1000 }
config.keys = {
	{ key = "c", mods = "CTRL|SHIFT", action = wezterm.action({ CopyTo = "ClipboardAndPrimarySelection" }) },
	{ key = "v", mods = "CTRL|SHIFT", action = wezterm.action({ PasteFrom = "Clipboard" }) },
	{ key = "y", mods = "LEADER", action = "ActivateCopyMode" },
	{ key = "s", mods = "LEADER", action = wezterm.action({ Search = { CaseInSensitiveString = "" } }) },
	{ key = "F11", action = wezterm.action.ToggleFullScreen },
}
config.window_padding = {
	left = 5,
	right = 5,
	top = 0,
	bottom = 0,
}

return config
