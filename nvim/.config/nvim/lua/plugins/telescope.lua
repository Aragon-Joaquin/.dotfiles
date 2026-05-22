return {
  {
    "nvim-telescope/telescope.nvim",
    version = "*",
    dependencies = {
      "nvim-lua/plenary.nvim",
      { "nvim-tree/nvim-web-devicons", opts = {} },
      { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    },

    keys = function()
      local builtin = require("telescope.builtin")
      vim.keymap.set("n", "<leader>sf", builtin.find_files, { desc = "Telescope find files" })
      vim.keymap.set("n", "<leader>sg", builtin.live_grep, { desc = "Telescope live grep" })
      vim.keymap.set("n", "<leader>sb", builtin.buffers, { desc = "Telescope buffers" })
      vim.keymap.set("n", "<leader>sh", builtin.help_tags, { desc = "Telescope help tags" })

      vim.keymap.set("n", "<leader>sm", "<cmd>Telescope man_pages<cr>", { desc = "Telescope help tags" })

      vim.keymap.set("n", "<leader>sn", function()
        builtin.find_files({ cwd = "~/.config/nvim" })
      end, { desc = "Telescope nvim .files" })
    end,
  },
}
