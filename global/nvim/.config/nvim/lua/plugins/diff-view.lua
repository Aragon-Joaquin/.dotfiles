return {
  "sindrets/diffview.nvim",
  cmd = { "DiffviewOpen", "DiffviewClose", "DiffviewToggleFiles", "DiffviewFocusFiles" },
  keys = {
    { "<leader>gg", "<cmd>DiffviewOpen<cr>", desc = "Open Diffview" },
    { "<leader>gc", "<cmd>DiffviewClose<cr>", desc = "Close Diffview" },
    { "<leader>gh", "<cmd>DiffviewFileHistory %<cr>", desc = "Current File History" },
    { "<leader>gH", "<cmd>DiffviewFileHistory<cr>", desc = "Branch File History" },
    { "<leader>gt", "<cmd>DiffviewToggleFiles<cr>", desc = "Toggle File Panel" },
  },
  opts = {
    enhanced_diff_hl = true,
    use_icons = true,
    icons = {
      folder_closed = "",
      folder_open = "",
    },
    hooks = {},
    keymaps = {
      disable_defaults = false,
    },
  },
}
