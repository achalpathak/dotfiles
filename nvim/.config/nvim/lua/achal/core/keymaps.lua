vim.g.mapleader = " "

local keymap = vim.keymap

keymap.set("i", "jk", "<ESC>", { desc = "Exit insert mode with jk" })

-- Center screen when jumping
keymap.set("n", "n", "nzzzv", { desc = "Next search result (centered)" })
keymap.set("n", "N", "Nzzzv", { desc = "Previous search result (centered)" })
keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Half page down (centered)" })
keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Half page up (centered)" })

-- window management
keymap.set("n", "<leader>wv", "<C-w>v", { desc = "Split window vertically" })
keymap.set("n", "<leader>wh", "<C-w>s", { desc = "Split window horizontally" })
keymap.set("n", "<leader>we", "<C-w>=", { desc = "Make splits equal size" })
keymap.set("n", "<leader>wc", "<cmd>close<CR>", { desc = "Close current split" })
keymap.set("n", "<C-Up>", ":resize +2<CR>", { desc = "Increase window height" })
keymap.set("n", "<C-Down>", ":resize -2<CR>", { desc = "Decrease window height" })
keymap.set("n", "<C-Left>", ":vertical resize -2<CR>", { desc = "Decrease window width" })
keymap.set("n", "<C-Right>", ":vertical resize +2<CR>", { desc = "Increase window width" })

-- tab management
keymap.set("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "Open new tab" })
keymap.set("n", "<leader>tf", "<cmd>tabnew %<CR>", { desc = "Open current buffer in new tab" })

-- buffer management
keymap.set("n", "<leader>c", "<cmd>bdelete<CR>", { desc = "Close current buffer" })
keymap.set("n", "<S-L>", "<cmd>bn<CR>", { desc = "Go to next buffer" })
keymap.set("n", "<S-H>", "<cmd>bp<CR>", { desc = "Go to previours buffer" })

-- move highlighted lines up and down
keymap.set("v", "J", ":m '>+1<CR>gv=gv")
keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- clipboard management
keymap.set("x", "<leader>p", [["dP"]], { desc = "Paste without replacing register" })
keymap.set("v", "p", '"_dp', { noremap = true, silent = true, desc = "Paste without replacing register" })
keymap.set({ "n", "v" }, "<leader>d", [["_d]])
keymap.set(
	{ "n", "x" },
	"x",
	'"_x',
	{ noremap = true, silent = true, desc = "Delete characters without replacing register" }
)
