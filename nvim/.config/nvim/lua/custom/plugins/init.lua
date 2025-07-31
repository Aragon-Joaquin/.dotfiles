-- here only goes packages that only requires a easy setup
return {
  --{ 'akinsho/bufferline.nvim', version = '*', dependencies = 'nvim-tree/nvim-web-devicons' },
  {
    'tris203/precognition.nvim',
    --event = "VeryLazy",
    opts = {
      startVisible = true,
      showBlankVirtLine = true,
      -- highlightColor = { link = "Comment" },
    },
  },
  { 'EdenEast/nightfox.nvim' }, -- colorscheme
  {
    'nvim-treesitter/nvim-treesitter',
    dependencies = { 'OXY2DEV/markview.nvim' },
    lazy = false,
    preview = {
      icon_provider = 'devicons', -- "mini" or "devicons"
    },
    -- For `nvim-treesitter` users.
    priority = 49,
    keys = {
      { '<leader>mv', '<cmd>Markview splitOpen<CR>', desc = 'Open Markview Split' },
      { '<leader>mc', '<cmd>Markview splitClose<CR>', desc = 'Close Markview Split' },
    },
  },
}
