return {
  { --NOTE: Autocompletion
    'saghen/blink.cmp',
    event = 'VimEnter',
    enabled = true,
    version = '1.*',
    dependencies = {
      --NOTE: snippets for autocomplete for various languages
      {
        'L3MON4D3/LuaSnip',
        version = '2.*',
        build = (function()
          -- Remove the below condition to re-enable on windows.
          if vim.fn.has 'win32' == 1 or vim.fn.executable 'make' == 0 then
            return
          end
          return 'make install_jsregexp'
        end)(),
        opts = {},
        dependencies = {
          {
            --NOTE: config exclusive for luaSnip
            'rafamadriz/friendly-snippets',
            config = function()
              require('luasnip.loaders.from_vscode').load()
            end,
          },
        },
      },
      'folke/lazydev.nvim',
    },
    --- @module 'blink.cmp'
    opts = {
      keymap = { --   <c-y> to accept ([y]es) the completion.
        --    This will auto-import if your LSP supports it.
        --    This will expand snippets if the LSP sent a snippet.
        -- 'super-tab' for tab to accept
        -- 'enter' for enter to accept
        -- 'none' for no mappings
        --
        -- All presets have the following mappings:
        -- <tab>/<s-tab>: move to right/left of your snippet expansion
        -- <c-space>: Open menu or open docs if already open
        -- <c-n>/<c-p> or <up>/<down>: Select next/previous item
        -- <c-e>: Hide menu
        -- <c-k>: Toggle signature help
        preset = 'default',
      },

      appearance = {
        nerd_font_variant = 'mono',
      },

      completion = {
        -- By default, you may press `<c-space>` to show the documentation.
        documentation = { auto_show = true, auto_show_delay_ms = 200 },
      },

      sources = {
        default = { 'lsp', 'path', 'snippets', 'lazydev' },
        providers = {
          lazydev = { module = 'lazydev.integrations.blink', score_offset = 100 },
        },
      },

      snippets = { preset = 'luasnip' },
      -- rust implementation via `'prefer_rust_with_warning'`
      fuzzy = { implementation = 'lua' },

      -- function signature menu
      signature = { enabled = true },
    },
  },
  --NOTE: secondary autocomplete, only keep one active
  {
    'hrsh7th/nvim-cmp',
    enabled = false,
    event = 'InsertEnter',
    dependencies = {
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      'saadparwaiz1/cmp_luasnip',
      'L3MON4D3/LuaSnip', -- Required for snippets
    },
    config = function()
      local cmp = require 'cmp'
      local luasnip = require 'luasnip'

      cmp.setup {
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        },
        sources = {
          { name = 'nvim_lsp' },
          { name = 'luasnip' },
          { name = 'buffer' },
          { name = 'path' },
          { name = '99' },
        },
      }
    end,
  },
}
