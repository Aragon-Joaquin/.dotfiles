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
  {
    'vyfor/cord.nvim',
    build = ':Cord update',
    -- opts = {}
  }, --NOTE: discord rich presence
  {
    'github/copilot.vim',
    enabled = false,
    init = function()
      vim.g.copilot_enabled = false
    end,
  }, --NOTE: copilot chatpgt ahhh
  { 'folke/twilight.nvim', opts = {}, keys = {
    { '<leader>tt', '<cmd>Twilight<cr>', desc = 'Toggle Twilight' },
  } },
  {
    -- vim plugin that allows multiple cursors for simultaneous editing.
    'mg979/vim-visual-multi',
  },
}
