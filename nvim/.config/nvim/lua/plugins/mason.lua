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
        },
      })

      require("mason-tool-installer").setup({
        ensure_installed = {
          "shellcheck",
          "shfmt",
          "stylua",
          "jq",
          "clang-format",
        },
      })
    end,
  },
}
