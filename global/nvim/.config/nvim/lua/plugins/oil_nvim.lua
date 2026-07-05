return {
  {
    "stevearc/oil.nvim",
    ---@module 'oil'
    ---@type oil.SetupOpts
    opts = {
      delete_to_trash = true,
      view_options = {
        show_hidden = true,
      },
      columns = {
        "icon",
        "permissions",
        "size",
        -- "mtime",
      },

      float = {
        padding = 5,
        max_width = 1280,
        max_height = 720,
        border = "rounded",
        win_options = {
          winblend = 0,
        },
        -- optionally override the oil buffers window title with custom function: fun(winid: integer): string
        get_win_title = nil,
        -- preview_split: Split direction: "auto", "left", "right", "above", "below".
        preview_split = "right",
        -- This is the config that will be passed to nvim_open_win.
        -- Change values here to customize the layout
        override = function(conf)
          return conf
        end,
      },
    },

    lazy = false,

    keys = function()
      vim.keymap.set("n", "<leader>o", "<CMD>Oil --float<CR>", { desc = "Open parent directory" })
    end,
  },
}
