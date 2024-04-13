-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
require("notify").setup({
  background_colour = "#000000",
})
vim.g.codeium_disable_bindings = 1
vim.g.autoformat = false
-- vim.cmd('hi Normal guibg=NONE')
-- vim.cmd('hi NormalNC guibg=NONE')
-- vim.cmd('hi LineNr guibg=NONE')
-- vim.cmd('hi Folded guibg=NONE')
-- -- vim.cmd('hi NonText guibg=NONE')
-- vim.cmd('hi SpecialKey guibg=NONE')
-- vim.cmd('hi VertSplit guibg=NONE')
-- vim.cmd('hi SignColumn guibg=NONE')
-- vim.cmd('hi EndOfBuffer guibg=NONE')
