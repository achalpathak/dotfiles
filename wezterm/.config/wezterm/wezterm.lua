local wezterm = require("wezterm")
local config = wezterm.config_builder()
local action = wezterm.action

config.unix_domains = {
	{
		name = "unix",
	},
}

local mux = wezterm.mux

-- config.font = wezterm.font("Dank Mono", { weight = "Regular", italic = false })
-- config.font = wezterm.font("Agave Nerd Font", { weight = "Regular", italic = false })
-- config.font = wezterm.font("Iosevka", { weight = "Regular", italic = false })
config.font = wezterm.font("SeriousShanns Nerd Font", { weight = "Regular", italic = false })
config.font_size = 14
config.window_decorations = "RESIZE"
config.enable_wayland = false

config.tab_max_width = 32
config.max_fps = 240
config.prefer_egl = true
config.adjust_window_size_when_changing_font_size = false

config.exit_behavior = "Close"
config.scrollback_lines = 50000
config.enable_tab_bar = true
config.hide_tab_bar_if_only_one_tab = false
config.use_fancy_tab_bar = false
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
-- config.window_background_image = wezterm.config_dir .. "/bg-blurred-darker.png"
config.macos_window_background_blur = 40
config.colors = {
	split = "#444444",
	background = "black",
}

-- Inactive pane colors
config.inactive_pane_hsb = {
	saturation = 0.5,
	brightness = 0.3,
}

-- wezterm.on("gui-startup", function(cmd)
-- 	local tab, pane, window = mux.spawn_window(cmd or {})
-- 	window:gui_window():maximize()
-- end)
local function is_vim(pane)
	local process_info = pane:get_foreground_process_info()
	local process_name = process_info and process_info.name

	return process_name == "nvim" or process_name == "vim"
end

local direction_keys = {
	Left = "h",
	Down = "j",
	Up = "k",
	Right = "l",
	-- reverse lookup
	h = "Left",
	j = "Down",
	k = "Up",
	l = "Right",
}
local function split_nav(resize_or_move, key)
	local mods = (resize_or_move == "resize") and "META" or "CTRL"
	return {
		key = key,
		mods = mods,
		action = wezterm.action_callback(function(win, pane)
			wezterm.log_info(
				string.format("WezTerm sending key: %s with mods: %s, is_vim: %s", key, mods, tostring(is_vim(pane)))
			)
			if is_vim(pane) then
				win:perform_action({ SendKey = { key = key, mods = mods } }, pane)
			else
				if resize_or_move == "resize" then
					win:perform_action({ AdjustPaneSize = { direction_keys[key], 3 } }, pane)
				else
					win:perform_action({ ActivatePaneDirection = direction_keys[key] }, pane)
				end
			end
		end),
	}
end

-- local function is_vim(pane)
-- 	-- This is set by the nvim plugin, and unset on ExitPre in Neovim
-- 	-- return pane:get_user_vars().IS_NVIM == "true"
-- 	local is_nvim = pane:get_user_vars().IS_NVIM == "true"
-- 	wezterm.log_info("Pane IS_NVIM value: " .. tostring(pane:get_user_vars().IS_NVIM))
-- 	return is_nvim
-- end

-- local function split_nav(resize_or_move, key)
-- 	return {
-- 		key = key,
-- 		mods = resize_or_move == "resize" and "META" or "CTRL",
-- 		action = wezterm.action_callback(function(win, pane)
-- 			if is_vim(pane) then
-- 				win:perform_action({
-- 					SendKey = { key = key, mods = resize_or_move == "resize" and "META" or "CTRL" },
-- 				}, pane)
-- 			else
-- 				if resize_or_move == "resize" then
-- 					win:perform_action({ AdjustPaneSize = { direction_keys[key], 3 } }, pane)
-- 				else
-- 					win:perform_action({ ActivatePaneDirection = direction_keys[key] }, pane)
-- 				end
-- 			end
-- 		end),
-- 	}
-- end

-- local function split_nav(resize_or_move, key)
-- 	return {
-- 		key = key,
-- 		mods = resize_or_move == "resize" and "META" or "CTRL",
-- 		action = wezterm.action_callback(function(win, pane)
-- 			local check = is_vim(pane)
-- 			wezterm.log_info("Navigating key " .. key .. ", is_vim: " .. tostring(check))
-- 			if check then
-- 				win:perform_action({
-- 					SendKey = { key = key, mods = resize_or_move == "resize" and "META" or "CTRL" },
-- 				}, pane)
-- 			else
-- 				if resize_or_move == "resize" then
-- 					wezterm.log_info("Resizing pane direction: " .. key)
-- 					win:perform_action({ AdjustPaneSize = { direction_keys[key], 3 } }, pane)
-- 				else
-- 					wezterm.log_info("Activating pane direction: " .. key)
-- 					win:perform_action({ ActivatePaneDirection = direction_keys[key] }, pane)
-- 				end
-- 			end
-- 		end),
-- 	}
-- end

wezterm.on("update-status", function(window, pane)
	-- Get current workspace name
	local mux_window = window:mux_window()
	local workspace = mux_window and mux_window:get_workspace() or ""
	local SOLID_LEFT_ARROW = utf8.char(0xe0b2) -- Unicode character for solid left arrow
	-- Simple styling: background color + workspace name
	local status = wezterm.format({
		{ Background = { Color = "none" } }, -- Change color if desired
		{ Foreground = { Color = "#2aa198" } },
		{ Text = SOLID_LEFT_ARROW }, -- Solid left arrow
		{ Background = { Color = "#2aa198" } }, -- Change color if desired
		{ Foreground = { Color = "#ffffff" } },
		{ Text = "   " .. workspace .. " " },

		-- Reset to default colors
		{ Background = { Color = "default" } },
		{ Foreground = { Color = "default" } },
	})

	window:set_right_status(status)
end)
---- KEYMAPS ----
config.leader = { key = "Space", mods = "CTRL", timeout_milliseconds = 1000 }
config.keys = {
	-- Attach to muxer
	{
		key = "a",
		mods = "LEADER",
		action = wezterm.action.AttachDomain("unix"),
	},

	-- Detach from muxer
	{
		key = "d",
		mods = "LEADER",
		action = wezterm.action.DetachDomain({ DomainName = "unix" }),
	},
	-- Rename current session; analagous to command in tmux
	{
		key = "$",
		mods = "LEADER|SHIFT",
		action = wezterm.action.PromptInputLine({
			description = "Enter new name for session",
			action = wezterm.action_callback(function(window, pane, line)
				if line then
					mux.rename_workspace(window:mux_window():get_workspace(), line)
				end
			end),
		}),
	},
	-- Show list of workspaces
	{
		key = "s",
		mods = "LEADER",
		action = wezterm.action.ShowLauncherArgs({ flags = "WORKSPACES" }),
	},
	{
		key = "n",
		mods = "LEADER",
		action = wezterm.action.PromptInputLine({
			description = "Enter name of workspace to switch/create",
			action = wezterm.action_callback(function(window, pane, line)
				if line then
					window:perform_action(wezterm.action.SwitchToWorkspace({ name = line }), pane)
				end
			end),
		}),
	},

	split_nav("move", "h"),
	split_nav("move", "j"),
	split_nav("move", "k"),
	split_nav("move", "l"),
	split_nav("resize", "h"),
	split_nav("resize", "j"),
	split_nav("resize", "k"),
	split_nav("resize", "l"),
	{ key = "c", mods = "CTRL|SHIFT", action = wezterm.action({ CopyTo = "ClipboardAndPrimarySelection" }) },
	{ key = "v", mods = "CTRL|SHIFT", action = wezterm.action({ PasteFrom = "Clipboard" }) },
	{ key = "y", mods = "LEADER", action = "ActivateCopyMode" },
	{ key = "/", mods = "LEADER", action = wezterm.action({ Search = { CaseInSensitiveString = "" } }) },
	{ key = "F11", action = wezterm.action.ToggleFullScreen },
	{
		key = "v",
		mods = "LEADER",
		action = action.SplitHorizontal({ domain = "CurrentPaneDomain" }), -- splits into left/right
	},

	{
		key = "h",
		mods = "LEADER",
		action = action.SplitVertical({ domain = "CurrentPaneDomain" }), -- splits into top/bottom
	},

	-- Rename window
	{
		key = ",",
		mods = "LEADER",
		action = action.PromptInputLine({
			description = "Enter new name for window:",
			action = wezterm.action_callback(function(window, pane, line)
				if line then
					wezterm.on("format-window-title", function()
						return line
					end)
				end
			end),
		}),
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

	{
		mods = "LEADER",
		key = "m",
		action = wezterm.action.TogglePaneZoomState,
	},
	-- TABs navigation
	{
		key = "LeftArrow",
		mods = "SHIFT",
		action = action.ActivateTabRelative(-1),
	},
	{
		key = "RightArrow",
		mods = "SHIFT",
		action = action.ActivateTabRelative(1),
	},
	-- TABs reordering
	{
		key = "RightArrow",
		mods = "ALT",
		action = wezterm.action.MoveTabRelative(1),
	},
	{
		key = "LeftArrow",
		mods = "ALT",
		action = wezterm.action.MoveTabRelative(-1),
	},
	-- PANEs navigation
	-- {
	-- 	key = "h",
	-- 	mods = "CTRL",
	-- 	action = action.ActivatePaneDirection("Left"),
	-- },
	-- {
	-- 	key = "l",
	-- 	mods = "CTRL",
	-- 	action = action.ActivatePaneDirection("Right"),
	-- },
	-- {
	-- 	key = "k",
	-- 	mods = "CTRL",
	-- 	action = action.ActivatePaneDirection("Up"),
	-- },
	-- {
	-- 	key = "j",
	-- 	mods = "CTRL",
	-- 	action = action.ActivatePaneDirection("Down"),
	-- },

	-- PANEs resizing
	-- {
	-- 	key = "LeftArrow",
	-- 	mods = "CTRL|SHIFT",
	-- 	action = action.AdjustPaneSize({ "Left", 5 }),
	-- },
	-- {
	-- 	key = "RightArrow",
	-- 	mods = "CTRL|SHIFT",
	-- 	action = action.AdjustPaneSize({ "Right", 5 }),
	-- },
	-- {
	-- 	key = "UpArrow",
	-- 	mods = "CTRL|SHIFT",
	-- 	action = action.AdjustPaneSize({ "Up", 5 }),
	-- },
	-- {
	-- 	key = "DownArrow",
	-- 	mods = "CTRL|SHIFT",
	-- 	action = action.AdjustPaneSize({ "Down", 5 }),
	-- },
}

return config
