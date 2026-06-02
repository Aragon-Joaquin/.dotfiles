--NOTE: plugins that dont do anything important, just for silly ocasions or some specific
-- case

return {
  {
    "NStefan002/screenkey.nvim", -- :Screenkey toggle
    enabled = false,
    lazy = false,
    version = "*",
    ---@module "screenkey"
    ---@type screenkey.config
    opts = {
      winblend = 30,
    },
  },

  -- discord
  {
    "vyfor/cord.nvim",
    enabled = false,
    opts = {
      text = {
        editing = "Editing ${filename}",
        file_browser = "Browsing files in ${tooltip}",
      },
      variables = true, -- Enable string templates
    },
  },
}
