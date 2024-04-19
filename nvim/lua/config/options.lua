-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
--
--

-- Case insensitive searching UNLESS /C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true
vim.opt.clipboard = "unnamedplus"               -- allows neovim to access the system clipboard

vim.opt.updatetime = 100                        -- faster completion (4000ms default)
vim.opt.swapfile = false                        -- creates a swapfile
vim.opt.smartindent = true                      -- make indenting smarter again
-- Set completeopt to have a better completion experience
vim.o.completeopt = 'menuone,noselect'
