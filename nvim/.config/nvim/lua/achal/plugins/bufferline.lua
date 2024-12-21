return {
	"akinsho/bufferline.nvim",
	event = "VeryLazy",
	keys = {
		{ "<Tab>", "<Cmd>BufferLineCycleNext<CR>", desc = "Next tab" },
		{ "<S-Tab>", "<Cmd>BufferLineCyclePrev<CR>", desc = "Prev tab" },
	},
	opts = {
		options = {
			mode = "buffer",
			separator_style = "slant",
			show_buffer_close_icons = false,
			show_close_icon = false,
			diagnostics = "nvim_lsp",
			diagnostics_update_in_insert = false,
			diagnostics_indicator = function(count, level, diagnostics_dict, context)
				if context.buffer:current() then
					local s = " "
					for e, n in pairs(diagnostics_dict) do
						local sym = e == "error" and " " or (e == "warning" and " " or " ")
						s = s .. n .. sym
					end
					return s
				end

				return ""
			end,
			offsets = {
				{
					filetype = "undotree",
					text = "Undotree",
					highlight = "PanelHeading",
					padding = 1,
				},
				{
					filetype = "neo-tree",
					text = "File Explorer",
					highlight = "NeoTree",
					padding = 1,
				},
				{
					filetype = "NvimTree",
					text = "Explorer",
					highlight = "PanelHeading",
					padding = 1,
				},
				{
					filetype = "DiffviewFiles",
					text = "Diff View",
					highlight = "PanelHeading",
					padding = 1,
				},
				{
					filetype = "flutterToolsOutline",
					text = "Flutter Outline",
					highlight = "PanelHeading",
				},
				{
					filetype = "lazy",
					text = "Lazy",
					highlight = "PanelHeading",
					padding = 1,
				},
			},
		},
	},
}
