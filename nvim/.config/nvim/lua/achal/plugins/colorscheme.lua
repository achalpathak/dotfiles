return {
	{
		"rose-pine/neovim",
		config = function()
			-- vim.cmd.colorscheme("rose-pine")
		end,
	},
	{
		"rebelot/kanagawa.nvim",
		config = function()
			require("kanagawa").setup({ transparent = true })
			vim.cmd.colorscheme("kanagawa")
		end,
	},
}
