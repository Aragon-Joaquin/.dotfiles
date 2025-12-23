return {
  {
    'folke/trouble.nvim',
    opts = {}, -- for default options, refer to the configuration section for custom setup.
    cmd = 'Trouble',
    keys = {
      {
        '<leader>xt',
        '<cmd>Trouble diagnostics toggle focus=true filter.buf=0<cr>',
        desc = 'trouble diagnostics',
      },
      {
        '<leader>xT',
        '<cmd>Trouble diagnostics toggle focus=true<cr>',
        desc = 'project diagnostics',
      },
      {
        '<leader>xs',
        '<cmd>Trouble symbols toggle focus=true<cr>',
        desc = 'symbols',
      },
    },
  },
}
