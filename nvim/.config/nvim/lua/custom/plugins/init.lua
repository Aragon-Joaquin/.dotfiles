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
    'pmizio/typescript-tools.nvim',
    dependencies = { 'nvim-lua/plenary.nvim', 'neovim/nvim-lspconfig' },

    config = function()
      require('typescript-tools').setup {
        settings = {
          expose_as_code_action = 'all',
          tsserver_file_preferences = {
            includeCompletionsForModuleExports = true,

            unusedVariablesAlphaFade = true,
          },
        },
        on_attach = function(_, bufnr)
          vim.api.nvim_create_autocmd('BufWritePre', {
            buffer = bufnr,
            callback = function()
              vim.cmd 'TSToolsOrganizeImports'
            end,
          })
        end,
      }
    end,
    opts = {},
  },
}
