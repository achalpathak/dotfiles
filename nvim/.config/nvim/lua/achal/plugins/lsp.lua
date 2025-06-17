return {
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		dependencies = {
			"williamboman/mason.nvim",
			"neovim/nvim-lspconfig",
		},
		config = function()
			local lspconfig = require("lspconfig")
			local mason_lspconfig = require("mason-lspconfig")

			-- Enable the following language servers
			local servers = { "lua_ls", "cssmodules_ls", "cssls", "ts_ls", "gopls", "ruff" }
			mason_lspconfig.setup({
				ensure_installed = servers,
				automatic_installation = true,
			})

			local capabilities = vim.lsp.protocol.make_client_capabilities()
			capabilities.textDocument.completion.completionItem.snippetSupport = true

			mason_lspconfig.setup({
				ensure_installed = servers,
				automatic_installation = true,
				handlers = {
					function(server_name)
						lspconfig[server_name].setup({
							capabilities = capabilities,
						})
					end,
				},
			})
		end,
	},
	{
		"rachartier/tiny-inline-diagnostic.nvim",
		event = "VeryLazy", -- Or `LspAttach`
		priority = 1000, -- needs to be loaded in first
		config = function()
			require("tiny-inline-diagnostic").setup({
				signs = {
					left = "",
					right = "",
					diag = "●",
					arrow = "    ",
					up_arrow = "    ",
					vertical = " │",
					vertical_end = " └",
				},
				blend = {
					factor = 0.22,
				},
			})
			vim.diagnostic.config({ virtual_text = false }) -- Only if needed in your configuration, if you already have native LSP diagnostics
		end,
	},
	{
		"neovim/nvim-lspconfig",
		opts = {
			diagnostics = {
				signs = {
					text = {
						[vim.diagnostic.severity.ERROR] = "",
						[vim.diagnostic.severity.WARN] = "",
						[vim.diagnostic.severity.INFO] = "",
						[vim.diagnostic.severity.HINT] = "",
					},
				},
			},
		},
		config = function()
			local lspconfig = require("lspconfig")

			local capabilities = vim.lsp.protocol.make_client_capabilities()
			capabilities.textDocument.completion.completionItem.snippetSupport = true

			vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "Hover Documentation" })
			vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "Jump to Definition" })
			vim.keymap.set(
				"n",
				"gr",
				require("telescope.builtin").lsp_references,
				{ desc = "Show References", noremap = true, silent = true }
			)

			vim.keymap.set("n", "gs", vim.lsp.buf.signature_help, { desc = "Signature Documentation" })
			vim.keymap.set("n", "gR", vim.lsp.buf.rename, { desc = "LSP Rename across project" })
			vim.keymap.set("n", "ga", vim.lsp.buf.code_action, { desc = "Code Actions" })
			-- vim.keymap.set("n", "gl", vim.diagnostic.open_float, { desc = "Open Diagnostic Float" })

			-- Change LSP diagnostic icons in the sign gutter
			vim.fn.sign_define("DiagnosticSignError", { text = "", texthl = "DiagnosticSignError" })
			vim.fn.sign_define("DiagnosticSignWarn", { text = "", texthl = "DiagnosticSignWarn" })
			vim.fn.sign_define("DiagnosticSignInfo", { text = "", texthl = "DiagnosticSignInfo" })
			vim.fn.sign_define("DiagnosticSignHint", { text = "", texthl = "DiagnosticSignHint" })
		end,
	},
	{
		"folke/trouble.nvim",
		opts = {}, -- for default options, refer to the configuration section for custom setup.
		cmd = "Trouble",
		keys = {
			{
				"<leader>xX",
				"<cmd>Trouble diagnostics toggle<cr>",
				desc = "Diagnostics (Trouble)",
			},
			{
				"<leader>xx",
				"<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
				desc = "Buffer Diagnostics (Trouble)",
			},
		},
	},
}
