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
  { 'EdenEast/nightfox.nvim' }, --NOTE: colorscheme
  {
    'vyfor/cord.nvim',
    build = ':Cord update',
    -- opts = {}
  }, --NOTE: discord rich presence
  { 'github/copilot.vim' }, --NOTE: copilot chatpgt ahhh
  { 'folke/twilight.nvim', opts = {}, keys = {
    { '<leader>tt', '<cmd>Twilight<cr>', desc = 'Toggle Twilight' },
  } },
}
