-- i can test plugins here
-- just enable the NOTE: {imports: 'testing/'} in the init.lua
return {
  {
    'Julian/lean.nvim',
    event = { 'BufReadPre *.lean', 'BufNewFile *.lean' },

    dependencies = {
      'nvim-lua/plenary.nvim',

      -- 'andrewradev/switch.vim',        -- for switch support
    },

    opts = { -- see below for full configuration options
      mappings = true,
    },
  },
}
