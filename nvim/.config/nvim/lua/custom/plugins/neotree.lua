--NOTE: it wasn't that bad at the end. i didn't use it as i thought i would

return {
  'nvim-neo-tree/neo-tree.nvim',
  version = '*',
  branch = 'v3.x',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'MunifTanjim/nui.nvim',
  },
  lazy = false,
  keys = {
    { '<leader>ee', ':Neotree toggle right<CR>', desc = 'NeoTree toggle', silent = true },
    { '<leader>ef', ':Neotree float<CR>', desc = 'NeoTree float' },
  },
  opts = {
    filesystem = {
      filtered_items = {
        visible = true,
        hide_dotfiles = false,
        hide_gitignored = true,
      },
    },
  },
}
