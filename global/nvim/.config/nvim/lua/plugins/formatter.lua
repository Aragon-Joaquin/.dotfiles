return {
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        lua = { "stylua" },
        json = { "jq" },
        sql = { "pg_format", "pg_formatter" },
        nix = { "nixfmt" },
        javascript = { "oxfmt", "prettier" },
        typescript = { "oxfmt", "prettier" },
        javascriptreact = { "oxfmt", "prettier" },
        typescriptreact = { "oxfmt", "prettier" },
        html = { "oxfmt", "prettier" },
        css = { "oxfmt", "prettier" },
        markdown = {},
      },
      format_on_save = {
        timeout_ms = 500,
        lsp_format = "fallback",
      },
    },
  },
}
