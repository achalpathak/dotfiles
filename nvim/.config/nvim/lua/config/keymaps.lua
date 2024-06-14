local opts = { noremap = true, silent = true }
local map = vim.keymap.set
-- For tmux navigation
vim.keymap.set("n", "<C-h>", "<Cmd>NvimTmuxNavigateLeft<CR>", { silent = true })
vim.keymap.set("n", "<C-j>", "<Cmd>NvimTmuxNavigateDown<CR>", { silent = true })
vim.keymap.set("n", "<C-k>", "<Cmd>NvimTmuxNavigateUp<CR>", { silent = true })
vim.keymap.set("n", "<C-l>", "<Cmd>NvimTmuxNavigateRight<CR>", { silent = true })
vim.keymap.set("n", "<C-\\>", "<Cmd>NvimTmuxNavigateLastActive<CR>", { silent = true })
vim.keymap.set("n", "<C-Space>", "<Cmd>NvimTmuxNavigateNavigateNext<CR>", { silent = true })

-- LSP
vim.keymap.set("n", "<leader>gh", "<cmd>lua vim.lsp.buf.hover()<CR>")

-- Diff keymaps
vim.keymap.set("n", "<leader>cc", ":diffput<CR>") -- put diff from current to other during diff
vim.keymap.set("n", "<leader>cj", ":diffget 1<CR>") -- get diff from left (local) during merge
vim.keymap.set("n", "<leader>ck", ":diffget 3<CR>") -- get diff from right (remote) during merge
vim.keymap.set("n", "<leader>cn", "]c") -- next diff hunk
vim.keymap.set("n", "<leader>cp", "[c") -- previous diff hunk

-- Move selected line/block of text up and down in visual mode
map("v", "J", ":m '>+1<CR>gv=gv", opts)
map("v", "K", ":m '<-2<CR>gv=gv", opts)

-- Select all
map("n", "<C-a>", "ggVG", opts)

-- inoremap <C-h> <Left>
-- inoremap <C-j> <Down>
-- inoremap <C-k> <Up>
-- inoremap <C-l> <Right>
-- cnoremap <C-h> <Left>
-- cnoremap <C-j> <Down>
-- cnoremap <C-k> <Up>
-- cnoremap <C-l> <Right>

-- Makes code format (also works in Visual mode)
map({ "n", "v" }, "<leader>mp", function()
  local conform = require("conform")
  conform.format({
    lsp_fallback = true,
    async = false,
    timeout_ms = 500,
  })
end, { desc = "Format file or range (in visual mode)" })
