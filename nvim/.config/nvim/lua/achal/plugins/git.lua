return {
	{
		"lewis6991/gitsigns.nvim",
		event = "VeryLazy",
		config = function()
			require("gitsigns").setup()
		end,
	},
	{
		"f-person/git-blame.nvim",
		-- load the plugin at startup
		event = "VeryLazy",
		opts = {
			enabled = true,
			message_template = " <summary> • <date> • <author>",
			date_format = "%d-%b-%Y %I:%M %p",
			virtual_text_column = 2,
			message_when_not_committed = "",
		},
		-- Lazy git
		{
			"kdheepak/lazygit.nvim",
			enabled = true,
			cmd = {
				"LazyGit",
				"LazyGitConfig",
				"LazyGitCurrentFile",
				"LazyGitFilter",
				"LazyGitFilterCurrentFile",
			},
			-- window border thing
			dependencies = {
				"nvim-lua/plenary.nvim",
			},
			-- setting up with keys={} allows plugin to load when command runs at the start
			keys = {
				{ "<leader>gg", "<cmd>LazyGit<cr>", desc = "Open lazy git" },
			},
		},
	},
}
