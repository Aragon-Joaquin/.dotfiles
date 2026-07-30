return {
  --NOTE: framework for taking notes with cli integration
  {
    "zk-org/zk-nvim",
    name = "zk",
		-- stylua: ignore
		keys = {
			{ '<leader>zn', "<Cmd>ZkNew { title = vim.fn.input('Title: ') }<CR>", desc = 'Zk New' },
			{ '<leader>zo', "<Cmd>ZkNotes { sort = { 'modified' } }<CR>", desc = 'Zk Notes' },
			{ '<leader>zt', '<Cmd>ZkTags<CR>', desc = 'Zk Tags' },
			{ '<leader>zf', "<Cmd>ZkNotes { sort = { 'modified' } }<CR>", desc = 'Zk Search' },
			{ '<leader>zg', ":'<,'>ZkMatch<CR>", mode = 'x', desc = 'Zk Match' },
			{ '<leader>zb', '<Cmd>ZkBacklinks<CR>', desc = 'Zk Backlinks' },
      { '<leader>zl', '<Cmd>ZkLinks<CR>', desc = 'Zk Links' },
		},
    opts = {
      picker = "telescope",
    },
  },
  --NOTE: useful for checklists
  {
    "bngarren/checkmate.nvim",
    ft = "markdown",
    opts = {
      files = {
        "todo.md",
        "TODO.md",
        "*.todo",
        "*.todo.md",
      },
      keys = {
        ["<leader>tt"] = {
          rhs = "<cmd>Checkmate toggle<CR>",
          desc = "Toggle todo item",
          modes = { "n", "v" },
        },
        ["<leader>tc"] = {
          rhs = "<cmd>Checkmate check<CR>",
          desc = "Set todo item as checked (done)",
          modes = { "n", "v" },
        },
        ["<leader>tu"] = {
          rhs = "<cmd>Checkmate uncheck<CR>",
          desc = "Set todo item as unchecked (not done)",
          modes = { "n", "v" },
        },
        ["<leader>t="] = {
          rhs = "<cmd>Checkmate cycle_next<CR>",
          desc = "Cycle todo item(s) to the next state",
          modes = { "n", "v" },
        },
        ["<leader>t-"] = {
          rhs = "<cmd>Checkmate cycle_previous<CR>",
          desc = "Cycle todo item(s) to the previous state",
          modes = { "n", "v" },
        },
        ["<leader>tn"] = {
          rhs = "<cmd>Checkmate create<CR>",
          desc = "Create todo item",
          modes = { "n", "v" },
        },
        ["<leader>tr"] = {
          rhs = "<cmd>Checkmate remove<CR>",
          desc = "Remove todo marker (convert to text)",
          modes = { "n", "v" },
        },
        ["<leader>tR"] = {
          rhs = "<cmd>Checkmate remove_all_metadata<CR>",
          desc = "Remove all metadata from a todo item",
          modes = { "n", "v" },
        },
        ["<leader>ta"] = {
          rhs = "<cmd>Checkmate archive<CR>",
          desc = "Archive checked/completed todo items (move to bottom section)",
          modes = { "n" },
        },
        ["<leader>tF"] = {
          rhs = "<cmd>Checkmate select_todo<CR>",
          desc = "Open a picker to select a todo from the current buffer",
          modes = { "n" },
        },
        ["<leader>tv"] = {
          rhs = "<cmd>Checkmate metadata select_value<CR>",
          desc = "Update the value of a metadata tag under the cursor",
          modes = { "n" },
        },
        ["<leader>t]"] = {
          rhs = "<cmd>Checkmate metadata jump_next<CR>",
          desc = "Move cursor to next metadata tag",
          modes = { "n" },
        },
        ["<leader>t["] = {
          rhs = "<cmd>Checkmate metadata jump_previous<CR>",
          desc = "Move cursor to previous metadata tag",
          modes = { "n" },
        },
      },

      style = {
        CheckmateOnHoldMarker = { fg = "#737aa2", bold = true },
        CheckmateOnHoldMainContent = { fg = "#737aa2", strikethrough = true },
      },

      todo_states = {
        -- we don't need to set the `markdown` field for `unchecked` and `checked` as these can't be overriden
        unchecked = { marker = "□", order = 1 },
        checked = { marker = "✔", order = 2 },
        in_progress = {
          marker = "◐",
          markdown = ".",
          type = "incomplete", -- Counts as "not done"
          order = 50,
        },
        on_hold = {
          marker = "",
          markdown = "?", -- Saved as `- [?]`
          type = "inactive",
          order = 100,
        },
      },

      metadata = {
        -- Example: A @priority tag that has dynamic color based on the priority value
        priority = {
          style = function(context)
            local value = context.value:lower()
            if value == "high" then
              return { fg = "#ff5555", bold = true }
            elseif value == "medium" then
              return { fg = "#ffb86c" }
            elseif value == "low" then
              return { fg = "#8be9fd" }
            else -- fallback
              return { fg = "#8be9fd" }
            end
          end,
          get_value = function()
            return "medium" -- Default priority
          end,
          choices = function()
            return { "low", "medium", "high" }
          end,
          key = "<leader>t1",
          sort_order = 10,
          jump_to_on_insert = "value",
          select_on_insert = true,
        },
        -- Example: A @started tag that uses a default date/time string when added
        started = {
          aliases = { "init" },
          style = { fg = "#9fd6d5" },
          get_value = function()
            return tostring(os.date("%m/%d/%y %H:%M"))
          end,
          key = "<leader>t2",
          sort_order = 20,
        }, -- Example: A @done tag that also sets the todo item state when it is added and removed
        done = {
          aliases = { "completed", "finished" },
          style = { fg = "#96de7a" },
          get_value = function()
            return tostring(os.date("%m/%d/%y %H:%M"))
          end,
          key = "<leader>t3",
          on_add = function(todo)
            require("checkmate").set_todo_state(todo, "checked")
          end,
          on_remove = function(todo)
            require("checkmate").set_todo_state(todo, "unchecked")
          end,
          sort_order = 30,
        },
        -- WARN: custom!
        vague = {
          aliases = { "refine", "clarify" },
          style = { fg = "#b91aec" },
          get_value = function()
            return tostring(os.date("%m/%d/%y %H:%M"))
          end,
          key = "<leader>t4",
          sort_order = 40,
        },
        shelved = {
          aliases = { "deprecated", "discarded", "paused" },
          style = { fg = "#6272a4", bold = true, strikethrough = false }, -- does not work :C
          get_value = function()
            return 'Reason: ""'
          end,
          key = "<leader>t5",
          sort_order = 50,
          select_on_insert = true,

          on_add = function(todo)
            require("checkmate").set_todo_state(todo, "on_hold")
          end,
          on_remove = function(todo)
            require("checkmate").set_todo_state(todo, "unchecked")
          end,
        },
      },
    },
  },
}
