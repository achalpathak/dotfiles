return {
	-- {
	-- 	"christoomey/vim-tmux-navigator",
	-- },

	-- animations
	{
		"echasnovski/mini.animate",
		event = "VeryLazy",
		opts = function(_, opts)
			opts.scroll = {
				enable = false,
			}
		end,
	},
	-- which key
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		init = function()
			vim.o.timeout = true
			vim.o.timeoutlen = 500
		end,
		keys = {
			{
				"<leader>?",
				function()
					require("which-key").show({ global = false })
				end,
				desc = "Buffer Local Keymaps (which-key)",
			},
		},
	},
	{
		"echasnovski/mini.surround",
		opts = {
			custom_surroundings = nil,
			highlight_duration = 500,
			mappings = {
				add = "sa", -- Add surrounding in Normal and Visual modes
				delete = "sd", -- Delete surrounding
				find = "sf", -- Find surrounding (to the right)
				find_left = "sF", -- Find surrounding (to the left)
				highlight = "sh", -- Highlight surrounding
				replace = "sr", -- Replace surrounding
				update_n_lines = "sn", -- Update `n_lines`

				suffix_last = "l", -- Suffix to search with "prev" method
				suffix_next = "n", -- Suffix to search with "next" method
			},
			n_lines = 20,
			respect_selection_type = false,
			search_method = "cover",
			silent = false,
		},
	},
	{
		"xiyaowong/transparent.nvim",
	},
	-- filename
	{
		"b0o/incline.nvim",
		dependencies = {},
		event = "BufReadPre",
		priority = 1200,
		config = function()
			local helpers = require("incline.helpers")
			require("incline").setup({
				window = {
					padding = 0,
					margin = { horizontal = 0 },
				},
				render = function(props)
					local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(props.buf), ":t")
					local ft_icon, ft_color = require("nvim-web-devicons").get_icon_color(filename)
					local modified = vim.bo[props.buf].modified
					local buffer = {
						ft_icon and { " ", ft_icon, " ", guibg = ft_color, guifg = helpers.contrast_color(ft_color) }
							or "",
						" ",
						{ filename, gui = modified and "bold,italic" or "bold" },
						" ",
						guibg = "#363944",
					}
					return buffer
				end,
			})
		end,
	},
	{
		"sphamba/smear-cursor.nvim",
		opts = {
			legacy_computing_symbols_support = false,
		},
	},
	{
		"mbbill/undotree",
		config = function()
			vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle, { desc = "Show Undo Tree" })
		end,
		-- Comments
		{
			"echasnovski/mini.comment",
			version = false,
			dependencies = {
				"JoosepAlviste/nvim-ts-context-commentstring",
			},
			config = function()
				-- disable the autocommand from ts-context-commentstring
				require("ts_context_commentstring").setup({
					enable_autocmd = false,
				})

				require("mini.comment").setup({
					-- tsx, jsx, html , svelte comment support
					options = {
						custom_commentstring = function()
							return require("ts_context_commentstring.internal").calculate_commentstring({
								key = "commentstring",
							}) or vim.bo.commentstring
						end,
					},
				})
			end,
		},
	},
	-- {
	-- 	"mrjones2014/smart-splits.nvim",
	--
	-- 	lazy = false,
	-- 	priority = 1000,
	-- 	config = function()
	-- 		require("smart-splits").setup({
	-- 			-- These are the defaults, customize if needed
	-- 			-- See plugin docs for more options
	-- 			-- ignored_buftypes = { "nofile", "quickfix", "prompt" },
	-- 			-- ignored_filetypes = { "NvimTree" },
	-- 			-- default_amount = 3,
	-- 			-- at_edge = "wrap", -- wrap to the other side of split
	-- 			-- move_cursor_same_row = false,
	-- 			multiplexer_integration = "wezterm", -- auto-detected, but can force 'wezterm'
	-- 		})
	--
	-- 		vim.keymap.set("n", "<C-h>", "<cmd>lua require('smart-splits').move_cursor_left()<CR>")
	-- 		vim.keymap.set("n", "<C-j>", "<cmd>lua require('smart-splits').move_cursor_down()<CR>")
	-- 		vim.keymap.set("n", "<C-k>", "<cmd>lua require('smart-splits').move_cursor_up()<CR>")
	-- 		vim.keymap.set("n", "<C-l>", "<cmd>lua require('smart-splits').move_cursor_right()<CR>")
	-- 		vim.keymap.set("n", "<C-\\>", "<cmd>lua require('smart-splits').move_cursor_previous()<CR>")
	--
	-- 		vim.keymap.set("n", "<C-h>", function()
	-- 			vim.cmd("SmartCursorMoveLeft")
	-- 		end)
	-- 		-- vim.keymap.set("n", "<C-j>", function()
	-- 		-- 	print("CTRL+J pressed - executing SmartCursorMoveDown")
	-- 		-- 	vim.notify("CTRL+J pressed - executing SmartCursorMoveDown")
	-- 		-- 	vim.cmd("SmartCursorMoveDown")
	-- 		-- end)
	-- 		vim.keymap.set("n", "<C-k>", function()
	-- 			vim.cmd("SmartCursorMoveUp")
	-- 		end)
	-- 		vim.keymap.set("n", "<C-l>", function()
	-- 			vim.cmd("SmartCursorMoveRight")
	-- 		end)
	-- 		vim.keymap.set("n", "<C-\\>", function()
	-- 			vim.cmd("SmartCursorMovePrevious")
	-- 		end)
	--
	-- 		vim.keymap.set("n", "<A-h>", function()
	-- 			vim.cmd("SmartResizeLeft")
	-- 		end)
	-- 		vim.keymap.set("n", "<A-j>", function()
	-- 			vim.cmd("SmartResizeDown")
	-- 		end)
	-- 		vim.keymap.set("n", "<A-k>", function()
	-- 			vim.cmd("SmartResizeUp")
	-- 		end)
	-- 		vim.keymap.set("n", "<A-l>", function()
	-- 			vim.cmd("SmartResizeRight")
	-- 		end)
	-- 	end,
	-- },

	{
		"letieu/wezterm-move.nvim",
		keys = {
			{
				"<C-h>",
				function()
					require("wezterm-move").move("h")
				end,
			},
			{
				"<C-j>",
				function()
					require("wezterm-move").move("j")
				end,
			},
			{
				"<C-k>",
				function()
					require("wezterm-move").move("k")
				end,
			},
			{
				"<C-l>",
				function()
					require("wezterm-move").move("l")
				end,
			},
		},
	},
}
