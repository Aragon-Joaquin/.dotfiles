-- here only goes packages that only requires an easy setup
return {
  {
    'tris203/precognition.nvim',
    --event = "VeryLazy",
    opts = {
      startVisible = true,
      showBlankVirtLine = true,
      -- highlightColor = { link = "Comment" },
    },
  },

  --NOTE: discord rich presence
  {
    'vyfor/cord.nvim',
    build = ':Cord update',
    -- opts = {}
  },

  --NOTE: copilot chatpgt ahhh
  {
    'github/copilot.vim',
    enabled = false,
    init = function()
      vim.g.copilot_enabled = false
    end,
  },

  --NOTE: focuses scoped blocks for better demostration/visualization
  {
    'folke/twilight.nvim',
    opts = {},
    keys = {
      { '<leader>tt', '<cmd>Twilight<cr>', desc = 'Toggle Twilight' },
    },
  },

  --NOTE: autocloses brackets, parentheses, qoutes and more, qoutes and more
  {
    'windwp/nvim-autopairs',
    event = 'InsertEnter',
    opts = {},
  },

  --NOTE: vertical indentation, maybe disable?
  {
    'lukas-reineke/indent-blankline.nvim',
    main = 'ibl',
    ---@module "ibl"
    ---@type ibl.config
    opts = {},
  },
}
