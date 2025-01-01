require("achal.core")
require("achal.lazy")

-- Highlight on Yank
-- -- Define a custom highlight color
vim.api.nvim_set_hl(0, "YankHighlight", { bg = "#8a739a", fg = "Black" })

vim.api.nvim_create_autocmd("TextYankPost", {
	group = vim.api.nvim_create_augroup("highlight_yank", {}),
	desc = "Hightlight selection on yank",
	pattern = "*",
	callback = function()
		vim.highlight.on_yank({ higroup = "YankHighlight", timeout = 200 })
	end,
})
