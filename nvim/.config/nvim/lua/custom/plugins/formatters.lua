-- Autoformat
return {
  {
    'stevearc/conform.nvim',
    event = { 'BufWritePre' },
    cmd = { 'ConformInfo' },
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
}
