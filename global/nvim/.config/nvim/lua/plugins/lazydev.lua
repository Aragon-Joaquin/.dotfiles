return {
  {
    "folke/lazydev.nvim",
    ft = "lua", -- only load on lua files
    opts = {
      library = {
        { path = "${3rd}/luvit/library", words = { "vim%.uv" } },
        { path = "snacks.nvim", words = { "Snacks", "snacks" } },
      },
    },
  },
}
