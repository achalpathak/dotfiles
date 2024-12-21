return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
		"MunifTanjim/nui.nvim",
	},
	keys = function()
		local find_buffer_by_type = function(type)
			for _, buf in ipairs(vim.api.nvim_list_bufs()) do
				local ft = vim.api.nvim_buf_get_option(buf, "filetype")
				if ft == type then
					return buf
				end
			end
			return -1
		end
		local toggle_neotree = function(toggle_command)
			if find_buffer_by_type("neo-tree") > 0 then
				require("neo-tree.command").execute({ action = "close" })
			else
				toggle_command()
			end
		end

		return {
			{
				"<leader>e",
				function()
					toggle_neotree(function()
						require("neo-tree.command").execute({ action = "focus", reveal = true, dir = vim.uv.cwd() })
					end)
				end,
				desc = "Toggle Explorer (cwd)",
			},
			{
				"<leader>E",
				function()
					toggle_neotree(function()
						require("neo-tree.command").execute({ action = "focus", reveal = true })
					end)
				end,
				desc = "Toggle Explorer (root)",
			},
		}
	end,
	config = function()
		-- vim.keymap.set(
		-- 	"n",
		-- 	"<leader>e",
		-- 	-- ":Neotree filesystem toggle left<CR>",
		-- 	-- ":Neotree filesystem toggle float<CR>",
		-- 	":Neotree toggle<CR>",
		-- 	{ desc = "Toggle Neo-Tree", silent = true }
		-- )
		--
		vim.diagnostic.config({
			signs = {
				text = {
					[vim.diagnostic.severity.ERROR] = " ",
					[vim.diagnostic.severity.WARN] = " ",
					[vim.diagnostic.severity.INFO] = " ",
					[vim.diagnostic.severity.HINT] = "󰌵",
				},
				linehl = {
					[vim.diagnostic.severity.ERROR] = "ErrorMsg",
					[vim.diagnostic.severity.WARN] = "WarnMsg",
					[vim.diagnostic.severity.INFO] = "InfoMsg",
					[vim.diagnostic.severity.HINT] = "HintMsg",
				},
				numhl = {
					[vim.diagnostic.severity.ERROR] = "ErrorMsg",
					[vim.diagnostic.severity.WARN] = "WarningMsg",
					[vim.diagnostic.severity.INFO] = "InfoMsg",
					[vim.diagnostic.severity.HINT] = "HintMsg",
				},
			},
		})
		-- vim.fn.sign_define("DiagnosticSignError", { text = " ", texthl = "DiagnosticSignError" })
		-- vim.fn.sign_define("DiagnosticSignWarn", { text = " ", texthl = "DiagnosticSignWarn" })
		-- vim.fn.sign_define("DiagnosticSignInfo", { text = " ", texthl = "DiagnosticSignInfo" })
		-- vim.fn.sign_define("DiagnosticSignHint", { text = "󰌵", texthl = "DiagnosticSignHint" })

		require("neo-tree").setup({
			close_if_last_window = true,
			popup_border_style = "rounded",
			enable_git_status = true,
			enable_diagnostics = true,
			window = {
				position = "float",
				width = 40,
				mappings = {
					["l"] = "open",
					["h"] = "close_node",
				},
			},
			filesystem = {
				follow_current_file = {
					enabled = true,
				},
				use_libuv_file_watcher = true,
			},
			hijack_netrw_behavior = "open_default",
		})
	end,
}
