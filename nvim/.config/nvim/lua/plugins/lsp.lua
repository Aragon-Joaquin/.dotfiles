return {
  {
    "neovim/nvim-lspconfig",
    keys = {
      { "gd", "<cmd>Telescope lsp_definitions<CR>", desc = "Goto Definition" },
      {
        "gi",
        "<cmd>Telescope lsp_implementations<CR>",
        desc = "Goto Implementation",
      },
      {
        "gy",
        "<cmd>Telescope lsp_type_definitions<CR>",
        desc = "Goto T[y]pe Definition",
      },
      { "gD", vim.lsp.buf.declaration, desc = "Goto Declaration" },
      { "K", vim.lsp.buf.hover, desc = "Hover" },
      { "gK", vim.lsp.buf.signature_help, desc = "Signature Help" },
    },
    event = { "BufReadPre", "BufNewFile" },
    opts = {
      ---@type vim.diagnostic.Opts
      diagnostics = {
        virtual_text = {
          spacing = 4,
          source = "if_many",
        },
        severity_sort = true,
        signs = {
          text = {
            [vim.diagnostic.severity.ERROR] = "E",
            [vim.diagnostic.severity.WARN] = "W",
            [vim.diagnostic.severity.INFO] = "I",
            [vim.diagnostic.severity.HINT] = "H",
          },
        },
      },
      servers = {
        clangd = {
          -- Fix clangd offset encoding
          capabilities = { offsetEncoding = { "utf-16" } },
          cmd = {
            "clangd",
            "--clang-tidy",
            "--fallback-style=Google",
            "--completion-style=detailed",
            "--function-arg-placeholders",
            "--header-insertion=iwyu",
          },
          init_options = {
            usePlaceholders = true,
            completeUnimported = true,
            clangdFileStatus = true,
          },
        },
        lua_ls = {
          log_level = 0,
          settings = {
            Lua = {
              runtime = {
                version = "LuaJIT",
                path = {
                  "lua/?.lua",
                  "lua/?/init.lua",
                },
              },
              workspace = {
                checkThirdParty = false,
                library = {
                  vim.env.VIMRUNTIME,
                },
              },
              completion = { callSnippet = "Replace" },
              doc = {
                privateName = { "^_" },
              },
              hint = {
                enable = true,
                arrrayIndex = "Disable",
              },
            },
          },
        },
        rumdl = {},
        bashls = { filetypes = { "sh", "zsh", "bash" } },
        tombi = {},
        pyright = {},
        gopls = {},
      },
    },
    config = function(_, opts)
      for server, config in pairs(opts.servers) do
        config.capabilities = require("blink.cmp").get_lsp_capabilities(config.capabilities)
        vim.lsp.enable(server)

        vim.lsp.config(server, config)
      end

      vim.diagnostic.config(vim.deepcopy(opts.diagnostics))
    end,
  },
}
