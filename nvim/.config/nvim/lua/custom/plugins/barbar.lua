-- tabs in neovim, just like vscode... i just wanna get used to nvim....
return {
  {
    'romgrk/barbar.nvim',
    dependencies = {
      'lewis6991/gitsigns.nvim', -- OPTIONAL: for git status
      'nvim-tree/nvim-web-devicons', -- OPTIONAL: for file icons
    },
    init = function()
      vim.g.barbar_auto_setup = false
    end,
    opts = {},
    version = '^1.0.0', -- optional: only update when a new 1.x version is released

    keys = {
      { '<leader>bd', '<Cmd>BufferClose<CR>', desc = 'Close current buffer' },
      { '<leader>bk', '<Cmd>BufferNext<CR>', desc = 'Go to next buffer' },
      { '<leader>bj', '<Cmd>BufferPrevious<CR>', desc = 'Go to previous buffer' },
      { '<leader>b1', '<Cmd>BufferGoto 1<CR>', desc = 'Go to buffer 1' },
      { '<leader>b2', '<Cmd>BufferGoto 2<CR>', desc = 'Go to buffer 2' },
      { '<leader>b3', '<Cmd>BufferGoto 3<CR>', desc = 'Go to buffer 3' },
      { '<leader>b0', '<Cmd>BufferLast<CR>', desc = 'Go to last buffer' },
    },
  },
}
