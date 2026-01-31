-- TEST:  old tree:
return {
  'nvim-tree/nvim-tree.lua',
  version = '*',
  lazy = false,
  dependencies = {
    'nvim-tree/nvim-web-devicons',
  },
  config = function()
    require('nvim-tree').setup {
      view = {
        side = 'right',
      },
      renderer = {
        highlight_git = true,
        highlight_opened_files = 'all',
      },
    }
  end,

  keys = {
    -- Keybinding to toggle the tree view
    {
      '<leader>ee',
      '<cmd>NvimTreeToggle<cr>',
      desc = 'Toggle NvimTree',
    },
    -- Keybinding to collapse the tree recursively
    {
      '<leader>ec',
      '<cmd>NvimTreeCollapse<cr>',
      desc = 'Collapse NvimTree',
    },
  },
}
