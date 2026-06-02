return {
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {
      ---@type false | "classic" | "modern" | "helix"
      preset = "modern",
      win = {
        no_overlap = true,
        -- width = 1,
        -- height = { min = 4, max = 25 },
        -- col = 0,
        -- row = math.huge,
        -- border = "none",
        padding = { 1, 2 },
        title = true,
        title_pos = "center",
        zindex = 1000,
        -- Additional vim.wo and vim.bo options
        bo = {},
        wo = {
          winblend = 0, -- value between 0-100 0 for fully opaque and 100 for fully transparent
        },
      },
      layout = {
        width = { min = 20 }, -- min and max width of the columns
        spacing = 3, -- spacing between columns
      },
      keys = {
        scroll_down = "<c-d>", -- binding to scroll down inside the popup
        scroll_up = "<c-u>", -- binding to scroll up inside the popup
      },
      show_help = true,
      show_keys = true,
    },
    keys = function()
      local wk = require("which-key")

      --telescope
      wk.add({
        { "<leader>s", group = "telescope", mode = { "n" } },
        { "<leader>h", group = "Harpoon", mode = { "n" } },
        { "<leader>x", group = "Trouble", mode = { "n" } },
        { "gr", group = "LSP Actions", mode = { "n" } },
      })
    end,
  },
}
