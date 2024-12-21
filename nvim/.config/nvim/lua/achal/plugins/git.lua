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
			virtual_text_column = 1,
		},
	},
}
