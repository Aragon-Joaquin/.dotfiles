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
    'OXY2DEV/markview.nvim',
    lazy = false,
    -- For `nvim-treesitter` users.
    priority = 49,

    preview = {
      icon_provider = 'devicons',
    },
    keys = {
      { '<leader>mv', '<cmd>Markview splitOpen<CR>', desc = 'Open Markview Split' },
      { '<leader>mc', '<cmd>Markview splitClose<CR>', desc = 'Close Markview Split' },
    },

    config = function()
      require('markview').setup {
        -- This option controls whether to conceal text marks like `*` for bold, `_` for italics, etc.
        conceal_text_marks = false,

        -- This option controls whether to conceal hyperlink labels and show an icon instead.
        conceal_hyperlink_labels = false,

        -- This option controls whether to conceal image links.
        conceal_image_links = false,

        -- You can also turn off the live preview/hybrid mode
        hybrid = true,

        -- The default behavior is to render. We want to start in a raw state.
        disable_on_startup = true,
      }
    end,
  },
}
