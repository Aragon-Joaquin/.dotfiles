return {
  "sindrets/diffview.nvim",
  cmd = { "DiffviewOpen", "DiffviewClose", "DiffviewToggleFiles", "DiffviewFocusFiles" },
  keys = {
    { "<leader>do", "<cmd>DiffviewOpen<cr>", desc = "Open Diffview" },
    { "<leader>dc", "<cmd>DiffviewClose<cr>", desc = "Close Diffview" },
    { "<leader>dh", "<cmd>DiffviewFileHistory %<cr>", desc = "Current File History" },
    { "<leader>dH", "<cmd>DiffviewFileHistory<cr>", desc = "Branch File History" },
    { "<leader>dt", "<cmd>DiffviewToggleFiles<cr>", desc = "Toggle File Panel" },
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
