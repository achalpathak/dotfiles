return {
  'moozd/aidoc.nvim',
   config=function ()
        require('aidoc').setup({
          email = "",
          width = 65,
          keymap = "<leader>d",
        })
    end,
}
