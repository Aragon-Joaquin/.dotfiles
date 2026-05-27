-- just to flex to the world that i use nvim btw (probably discarding this soon)

return {
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
