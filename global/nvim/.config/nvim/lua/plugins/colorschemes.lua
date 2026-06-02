return {
  {
    "bluz71/vim-moonfly-colors",
    name = "moonfly",
    lazy = false,
    priority = 1000,
    config = function()
      vim.g.moonflyTransparent = true
      vim.cmd([[colorscheme vague]]) -- testing!
    end,
  },
  {
    "vague-theme/vague.nvim",
    config = {
      transparent = true,
    },
  },
}
