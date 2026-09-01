return {
  "ptdewey/pendulum-nvim",
  config = function()
    require("pendulum").setup({
      gen_reports = true,
      timeout_len = 300, -- afk in 5 minutes
      timer_len = 60, -- check activity each 1 minute
      time_zone = "America/Argentina/Buenos_Aires",
      report_excludes = {
        branch = {},
        directory = {},
        file = {
          "oil://*",
        },
        filetype = {},
        project = {
          "unknown_project", -- Exclude unknown (non-git) projects
        },
      },
    })
  end,
}
