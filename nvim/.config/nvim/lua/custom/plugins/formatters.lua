-- Autoformat
return {
  {
    'stevearc/conform.nvim',
    event = { 'BufWritePre' },
    cmd = { 'ConformInfo' },
    enabled = true,
    keys = {
      {
        '<leader>f',
        function()
          require('conform').format { async = true, lsp_format = 'fallback' }
        end,
        mode = '',
        desc = '[F]ormat buffer',
      },
    },
    -- opts = {
    --    notify_on_error = false,
    --  },

    config = function()
      local conform = require 'conform'
      local prettier = { 'prettier', stop_after_first = true }

      conform.setup {
        format_on_save = function(bufnr)
          local disable_filetypes = {} --  c = true, cpp = true ... Disable autoformat
          if disable_filetypes[vim.bo[bufnr].filetype] then
            return nil
          else
            return {
              timeout_ms = 500,
              lsp_format = 'fallback',
            }
          end
        end,

        default_format_opts = {
          lsp_format = 'fallback',
        },
        formatters_by_ft = {
          lua = { 'stylua' },

          html = prettier,
          css = { 'cssls', 'prettier', stop_after_first = true },
          javascript = prettier,
          javascriptreact = prettier,
          typescript = prettier,
          typescriptreact = prettier,

          c = { 'clang-format' },
          cmake = { 'cmake-format' },

          cpp = { 'clang-format' },

          java = { 'astyle' },

          python = { 'isort', 'black' },

          go = { 'goimports', 'gofumpt' },

          sh = { 'shfmt' },

          json = prettier,
          yaml = prettier,
        },
        formatters = {

          astyle = {
            command = 'astyle',
            prepend_args = { '-s2', '-c', '-J', '-n', '-q', '-z2', '-xC80' },
          },
          ['clang-format'] = {
            command = 'clang-format',
            prepend_args = { '--style=file', '-i' },
          },
          ['cmake-format'] = {
            command = 'cmake-format',
            prepend_args = { '-i' },
          },
          prettier = {
            command = 'prettier',
            prepend_args = {
              '--bracket-spacing',
              'true',
              '--print-width',
              '120',
              '--no-semi',
              '--single-quote',
              '--trailing-comma',
              'none',
              '--use-tabs',
            },
          },
          shfmt = {
            command = 'shfmt',
            prepend_args = { '-i', '0', '-sr', '-kp' },
          },
        },
      }
    end,
  },

  -- TODO: use none-ls instead of conform.nvim.
  -- for now, im using it as a linter
  {
    'nvimtools/none-ls.nvim',
    dependencies = {
      --  'nvimtools/none-ls-extras.nvim',
      'jayp0521/mason-null-ls.nvim', -- ensure dependencies are installed
    },

    config = function()
      local null_ls = require 'null-ls'
      local formatting = null_ls.builtins.formatting -- to setup formatters
      local diagnostics = null_ls.builtins.diagnostics -- to setup linters

      -- list of formatters & linters for mason to install
      require('mason-null-ls').setup {
        ensure_installed = {
          'checkmake',
          'prettier',
          'shfmt',
          'actionlint',
          'goimports',
          'gofumpt',
          'golangci-lint',
        },

        automatic_installation = false,
      }

      local sources = {
        diagnostics.checkmake,
        formatting.prettier.with { filetypes = { 'html', 'json', 'yaml', 'markdown' } },
        formatting.stylua,
        formatting.shfmt.with { args = { '-i', '4' } },
        formatting.gofumpt,
        formatting.goimports,

        diagnostics.actionlint,
        diagnostics.golangci_lint,

        -- formatting.terraform_fmt,
        -- require('none-ls.formatting.ruff').with { extra_args = { '--extend-select', 'I' } },
        -- require 'none-ls.formatting.ruff_format',
      }

      local augroup = vim.api.nvim_create_augroup('LspFormatting', {})
      null_ls.setup {
        -- debug = true, -- Enable debug mode. Inspect logs with :NullLsLog.
        sources = sources,
        -- you can reuse a shared lspconfig on_attach callback here
        on_attach = function(client, bufnr)
          if client.supports_method 'textDocument/formatting' then
            vim.api.nvim_clear_autocmds { group = augroup, buffer = bufnr }
            vim.api.nvim_create_autocmd('BufWritePre', {
              group = augroup,
              buffer = bufnr,
              callback = function()
                vim.lsp.buf.format { async = false }
              end,
            })
          end
        end,
      }
    end,
  },
}
