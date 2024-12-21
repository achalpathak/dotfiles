return {
  "nvim-treesitter/nvim-treesitter",
  version = false,
  build = ":TSUpdate",
  event = { "BufReadPost", "BufNewFile" },
  config = function()
    require("nvim-treesitter.configs").setup({
      ensure_installed = { "c",
        "lua",
        "vim",
        "vimdoc",
        "query",
        "markdown",
        "markdown_inline",
        "bash",
        "dockerfile",
        "gitignore",
        "html",
        "css",
        "scss",
        "json",
        "yaml",
        "toml",
        "javascript",
        "typescript",
        "rust",
        "go",
        "python" },

      sync_install = false,

      auto_install = true,


      highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
      },
    })
  end
}
