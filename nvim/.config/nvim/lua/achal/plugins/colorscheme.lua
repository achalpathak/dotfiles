local function enable_transparency()
	vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
	vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
	vim.api.nvim_set_hl(0, "LineNr", { bg = "none" })
end

return {
	{
		"rose-pine/neovim",
		config = function()
			-- vim.cmd.colorscheme("rose-pine")
		end,
	},
	{
		"RRethy/base16-nvim",
		config = function()
			-- To use this theme, set wezterm config.colors{background="black"} and config.window_background_opacity=1
			vim.cmd.colorscheme("base16-black-metal-gorgoroth")
			enable_transparency()
		end,
	},
	{
		"rebelot/kanagawa.nvim",
		config = function()
			require("kanagawa").setup({ transparent = true })
			-- vim.cmd.colorscheme("kanagawa-wave")
			enable_transparency()
		end,
	},
	{
		"vague2k/vague.nvim",
		config = function()
			require("vague").setup({
				-- optional configuration here
				transparent = true,
				style = {
					-- "none" is the same thing as default. But "italic" and "bold" are also valid options
					boolean = "none",
					number = "none",
					float = "none",
					error = "none",
					comments = "none",
					conditionals = "none",
					functions = "none",
					headings = "bold",
					operators = "none",
					strings = "none",
					variables = "none",

					-- keywords
					keywords = "none",
					keyword_return = "none",
					keywords_loop = "none",
					keywords_label = "none",
					keywords_exception = "none",

					-- builtin
					builtin_constants = "none",
					builtin_functions = "none",
					builtin_types = "none",
					builtin_variables = "none",
				},
				colors = {
					func = "#bc96b0",
					keyword = "#787bab",
					-- string = "#d4bd98",
					string = "#8a739a",
					-- string = "#f2e6ff",
					-- number = "#f2e6ff",
					-- string = "#d8d5b1",
					number = "#8f729e",
					-- type = "#dcaed7",
				},
			})
			-- vim.cmd.colorscheme("vague")
		end,
	},
}
