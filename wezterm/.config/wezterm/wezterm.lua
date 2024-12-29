local wezterm = require("wezterm")
local config = wezterm.config_builder()
local action = wezterm.action
local mux = wezterm.mux

-- config.font = wezterm.font("Dank Mono", { weight = "Regular", italic = false })
config.font = wezterm.font("Agave Nerd Font", { weight = "Regular", italic = false })
config.font_size = 17
config.window_decorations = "RESIZE"
config.enable_wayland = false
config.max_fps = 120
config.prefer_egl = true
config.adjust_window_size_when_changing_font_size = false

config.exit_behavior = "Close"
config.scrollback_lines = 50000
config.enable_tab_bar = true
config.hide_tab_bar_if_only_one_tab = true
config.use_fancy_tab_bar = true
config.window_close_confirmation = "NeverPrompt"
config.use_resize_increments = true

config.window_padding = {
	left = 5,
	right = 5,
	top = 0,
	bottom = 0,
}

-- Background Config
config.color_scheme = "Catppuccin Mocha"
config.window_background_opacity = 1
-- config.window_background_image = "bg-blurred.png"
config.window_background_image = wezterm.config_dir .. "/bg-blurred-darker.png"
config.macos_window_background_blur = 40

-- Maximize wezterm on startup
wezterm.on("gui-startup", function(cmd)
	local tab, pane, window = mux.spawn_window(cmd or {})
	window:gui_window():maximize()
end)

---- KEYMAPS ----
config.leader = { key = "a", mods = "CTRL", timeout_milliseconds = 1000 }
config.keys = {
	{ key = "c", mods = "CTRL|SHIFT", action = wezterm.action({ CopyTo = "ClipboardAndPrimarySelection" }) },
	{ key = "v", mods = "CTRL|SHIFT", action = wezterm.action({ PasteFrom = "Clipboard" }) },
	{ key = "y", mods = "LEADER", action = "ActivateCopyMode" },
	{ key = "s", mods = "LEADER", action = wezterm.action({ Search = { CaseInSensitiveString = "" } }) },
	{ key = "F11", action = wezterm.action.ToggleFullScreen },
	{
		key = "-",
		mods = "LEADER",
		action = action.SplitVertical({ domain = "CurrentPaneDomain" }),
	},

	{
		key = "|",
		mods = "LEADER",
		action = action.SplitHorizontal({ domain = "CurrentPaneDomain" }),
	},
	{
		key = "c",
		mods = "LEADER",
		action = action.SpawnTab("CurrentPaneDomain"),
	},
	{
		key = "x",
		mods = "LEADER",
		action = wezterm.action_callback(function(window, pane)
			-- Check the number of panes in the current tab
			local tab = window:active_tab()
			if tab and #tab:panes() > 1 then
				-- If more than one pane, close the current pane
				window:perform_action(wezterm.action.CloseCurrentPane({ confirm = true }), pane)
			else
				-- Otherwise, close the current tab
				window:perform_action(wezterm.action.CloseCurrentTab({ confirm = true }), pane)
			end
		end),
	},
	-- TABs navigation
	{
		key = "LeftArrow",
		mods = "LEADER",
		action = action.ActivateTabRelative(-1),
	},
	{
		key = "RightArrow",
		mods = "LEADER",
		action = action.ActivateTabRelative(1),
	},
	-- PANEs navigation
	{
		key = "h",
		mods = "LEADER",
		action = action.ActivatePaneDirection("Left"),
	},
	{
		key = "l",
		mods = "LEADER",
		action = action.ActivatePaneDirection("Right"),
	},
	{
		key = "k",
		mods = "LEADER",
		action = action.ActivatePaneDirection("Up"),
	},
	{
		key = "j",
		mods = "LEADER",
		action = action.ActivatePaneDirection("Down"),
	},
}
return config
