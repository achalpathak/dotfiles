-- This is used to disable the mini animate which is causing a weird black background
-- when toggling neo-tree.
-- https://www.reddit.com/r/neovim/comments/1ayc1vq/background_flashes_black_sometimes_when/
-- https://github.com/LazyVim/LazyVim/issues/2262

return {
  {
    "echasnovski/mini.animate",
    opts = {
      open = {
        enable = false,
      },
      close = {
        enable = false,
      },
    },
  },
}
