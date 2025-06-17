-- disable netrw
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- highlight cursor line
vim.o.cursorline = true
vim.cmd([[
  highlight CursorLine guibg=#ff0000 guifg=NONE
]])

require("achal.core")
require("achal.lazy")
require("achal.yank_highlight")
