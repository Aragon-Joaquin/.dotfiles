return {
  {
    "MeanderingProgrammer/render-markdown.nvim",
    -- dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-mini/mini.nvim" },
    -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-mini/mini.icons' },
    dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons" },
    ---@module 'render-markdown'
    ---@type render.md.UserConfig
    opts = {
      code = {
        render_modes = true,
        disable_background = true,
        border = "thin",
        language_border = ">",
        language_right = " ",
        above = ">",
        below = "<",
      },
    },
  },
}
