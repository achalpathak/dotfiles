


-- For tmux navigation
vim.keymap.set("n", "<C-h>", "<Cmd>NvimTmuxNavigateLeft<CR>", { silent = true })
vim.keymap.set("n", "<C-j>", "<Cmd>NvimTmuxNavigateDown<CR>", { silent = true })
vim.keymap.set("n", "<C-k>", "<Cmd>NvimTmuxNavigateUp<CR>", { silent = true })
vim.keymap.set("n", "<C-l>", "<Cmd>NvimTmuxNavigateRight<CR>", { silent = true })
vim.keymap.set("n", "<C-\\>", "<Cmd>NvimTmuxNavigateLastActive<CR>", { silent = true })
vim.keymap.set("n", "<C-Space>", "<Cmd>NvimTmuxNavigateNavigateNext<CR>", { silent = true })


-- LSP
vim.keymap.set('n', '<leader>gh', '<cmd>lua vim.lsp.buf.hover()<CR>')

-- Diff keymaps
vim.keymap.set("n", "<leader>cc", ":diffput<CR>") -- put diff from current to other during diff
vim.keymap.set("n", "<leader>cj", ":diffget 1<CR>") -- get diff from left (local) during merge
vim.keymap.set("n", "<leader>ck", ":diffget 3<CR>") -- get diff from right (remote) during merge
vim.keymap.set("n", "<leader>cn", "]c") -- next diff hunk
vim.keymap.set("n", "<leader>cp", "[c") -- previous diff hunk
