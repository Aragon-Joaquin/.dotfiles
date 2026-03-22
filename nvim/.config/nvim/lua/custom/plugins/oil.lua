return {
  {
    'stevearc/oil.nvim',
    opts = {
      delete_to_trash = true,
      view_options = {
        show_hidden = true,
      },
      columns = {
        'icon',
        -- 'permissions',
        'size',
        -- 'mtime',
      },
    },
    -- Optional dependencies
    --    dependencies = { { 'echasnovski/mini.icons', opts = {} } },
    --  dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if you prefer nvim-web-devicons
    -- Lazy loading is not recommended because it is very tricky to make it work correctly in all situations.
    lazy = false,
    keys = {
      { '-', '<CMD>Oil<CR>', desc = 'Open Oil (parent dir)' },
      { '<leader>o', '<CMD>Oil --float<CR>', desc = 'Open Oil (floating)' },
    },
  },
}
