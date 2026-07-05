return {

  {
    "mason-org/mason.nvim",
    dependencies = {
      -- lsp
      "mason-org/mason-lspconfig.nvim",
      -- formatters/linters
      "WhoIsSethDaniel/mason-tool-installer.nvim",
    },
    config = function()
      require("mason").setup({
        ui = {
          icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗",
          },
        },
      })

      require("mason-lspconfig").setup({
        ensure_installed = {
          "jsonls",
          "tailwindcss",
          "ts_ls",
          "cssls",
          "lua_ls",
          "clangd",
          "pyright",
          "gopls",
          "postgres_lsp",
          "svelte",
          "laravel_ls",
        },
      })

      require("mason-tool-installer").setup({
        ensure_installed = {
          --shell
          "shellcheck",
          "shfmt",

          --lua
          "stylua",

          --json
          "jq",

          --c/c++
          "clang-format",

          --python
          "black",

          -- go
          "goimports",
          "gofumpt",

          --make
          "checkmake",

          --psql
          "pgformatter",
        },
      })
    end,
  },
}
