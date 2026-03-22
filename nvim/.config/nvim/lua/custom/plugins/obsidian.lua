return {
  'obsidian-nvim/obsidian.nvim',
  version = '*', -- recommended, use latest release instead of latest commit
  lazy = false,
  enabled = function()
    -- Disable Obsidian when running from Oil Simple (to avoid path issues in Zed context)
    return not vim.g.disable_obsidian
  end,
  dependencies = {
    -- Required.
    'nvim-lua/plenary.nvim',
  },
  opts = {
    ui = { enable = false },
    legacy_commands = false,
    workspaces = {
      {
        name = 'Notes', -- Name of the workspace
        path = os.getenv 'HOME' .. '/notes', -- Path to the notes directory
      },
    },
    completion = {
      cmp = true,
    },
    picker = {
      -- Set your preferred picker. Can be one of 'telescope.nvim', 'fzf-lua', 'mini.pick' or 'snacks.pick'.
      name = 'telescope.nvim',
    },

    -- Settings for templates
    templates = {
      subdir = 'templates', -- Subdirectory for templates
      date_format = '%Y-%m-%d-%a', -- Date format for templates
      -- gtime_format = '%H:%M', -- Time format for templates
      time_format = '%H:%M',
      tags = '', -- Default tags for templates
    },
  },
  keys = function()
    -- Open the Workspace folder in a File Browser (Oil or Netrw)
    vim.keymap.set('n', '<leader>so', function()
      vim.cmd('edit ' .. os.getenv 'HOME' .. '/notes')
    end, { desc = 'Browse Notes Folder' })

    vim.keymap.set('n', '<leader>O', '<cmd>Obsidian<cr>', { desc = '<O>bsidian' })
  end,
}
