--NOTE: i tried to make it work, sadly i cant fix whats the error since the log files wont give any useful message
-- still does not work
return {
  {
    'ThePrimeagen/99',
    enabled = false,
    config = function()
      local _99 = require '99'

      local cwd = vim.uv.cwd()
      local basename = vim.fs.basename(cwd)
      _99.setup {
        provider = _99.Providers.OpenCodeProvider,
        model = 'big-pickle',
        logger = {
          level = _99.DEBUG,
          type = 'print',
          path = '/tmp/' .. basename .. '.99.debug',
          print_on_error = true,
        },
        tmp_dir = './tmp',

        completion = {
          -- cursor_rules = "<custom path to cursor rules>"

          --- A list of folders where you have your own SKILL.md
          --- Expected format:
          --- /path/to/dir/<skill_name>/SKILL.md
          ---
          --- Example:
          --- Input Path:
          --- "scratch/custom_rules/"
          ---
          --- Output Rules:
          --- {path = "scratch/custom_rules/vim/SKILL.md", name = "vim"},
          --- ... the other rules in that dir ...
          ---
          custom_rules = {
            'scratch/custom_rules/',
          },

          --- Configure @file completion (all fields optional, sensible defaults)
          files = {
            enabled = true,
            -- max_file_size = 102400,     -- bytes, skip files larger than this
            -- max_files = 5000,            -- cap on total discovered files
            exclude = { '.env', '.env.*', 'node_modules', '.git' },
          },
          source = 'native',
        },

        --- assuming that /foo is project root (based on cwd)
        md_files = {
          'AGENT.md',
        },
      }

      vim.keymap.set('v', '<leader>9v', function()
        _99.visual()
      end)

      --- if you have a request you dont want to make any changes, just cancel it
      vim.keymap.set('n', '<leader>9x', function()
        _99.stop_all_requests()
      end)

      vim.keymap.set('n', '<leader>9s', function()
        _99.search()
      end)

      vim.keymap.set('n', '<leader>9l', function()
        _99.view_logs()
      end)

      vim.keymap.set('n', '<leader>9o', function()
        _99.open()
      end)
    end,
  },
}
