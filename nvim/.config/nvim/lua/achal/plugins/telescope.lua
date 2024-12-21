return {
  "nvim-telescope/telescope.nvim",
  tag = "0.1.5",
  dependencies = { "nvim-lua/plenary.nvim",
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    "nvim-tree/nvim-web-devicons" },
  config = function()
    local telescope = require("telescope")
    local builtin = require("telescope.builtin")
    local actions = require("telescope.actions")

    telescope.setup({
      defaults = {
        path_display = { "smart" },
      }
    })
    telescope.load_extension("fzf")

    vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = "Find Files" })
    vim.keymap.set('n', '<leader>fg', builtin.git_files, { desc = "Find Git Files" })
    vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = "Find Buffers" })
    vim.keymap.set('n', '<leader>ss', builtin.live_grep, { desc = "Find word in project" })
    vim.keymap.set('n', '<leader>sb', builtin.current_buffer_fuzzy_find, { desc = "Find word in current buffer" })
    vim.keymap.set('n', '<leader>scs', builtin.grep_string, { desc = "Find word under cursor in project" })
  end
}
