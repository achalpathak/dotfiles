return {
  "stevearc/conform.nvim",
  opts = function()
    local opts = {
      formatters_by_ft = {
        javascript = { "prettier" },
        typescript = { "prettier" },
        javascriptreact = { "prettier" },
        typescriptreact = { "prettier" },
        svelte = { "prettier" },
        css = { "prettier" },
        html = { "prettier" },
        json = { "prettier" },
        yaml = { "prettier" },
        markdown = { "prettier" },
        graphql = { "prettier" },
        lua = { "stylua" },
        python = { "isort", "black" },
      },
      -- format = {
      --   timeout_ms = 3000,
      --   async = false, -- not recommended to change
      --   quiet = false, -- not recommended to change
      --   lsp_fallback = true, -- not recommended to change
      -- },
    }
    return opts
  end,
}
