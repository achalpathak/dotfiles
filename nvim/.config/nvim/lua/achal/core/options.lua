vim.cmd("let g:netrw_liststyle = 3")
-- vim.cmd("let g:loaded_netrw = 0")
-- vim.cmd("let g:loaded_netrwPlugin = 0")

local opt = vim.opt

opt.termguicolors = true

opt.relativenumber = true
opt.number = true

opt.tabstop = 2
opt.softtabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.autoindent = true
opt.smartindent = true

opt.wrap = false

opt.ignorecase = true
opt.hlsearch = false
opt.incsearch = true
opt.smartcase = true

opt.cursorline = true

opt.termguicolors = true
opt.background = "dark"
opt.signcolumn = "yes"

opt.backspace = "indent,eol,start"

opt.clipboard:append("unnamedplus")

opt.splitright = true
opt.splitbelow = true

opt.swapfile = false
opt.backup = false
opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
-- opt.undodir = "~/.config/nvim/undodir"
opt.undofile = true

opt.scrolloff = 8
opt.isfname:append("@-@")
opt.updatetime = 50

-- opt.colorcolumn = "80"
