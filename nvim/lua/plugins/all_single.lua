return {
  -- css color value
  {
  "norcalli/nvim-colorizer.lua",
    config= function()
    require("colorizer").setup({
       })
  end,
  },

  -- catppuccin theme
  {
  "catppuccin/nvim",
    priority = 1000,
    transparent_background = true,
    config = function()
      -- load the colorscheme here
      vim.cmd([[colorscheme catppuccin]])
    end,

  },

}
