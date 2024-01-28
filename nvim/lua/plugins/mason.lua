return {
    "williamboman/mason.nvim",
    autoformat = false,
    opts = {
      ensure_installed = {
        "glopls",
        "pyright",
        "stylua",
        "flake8",
      },
    },
  }
