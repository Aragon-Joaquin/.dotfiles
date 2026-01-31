--NOTE: colorschemes.
return {

  { 'EdenEast/nightfox.nvim', enable = false }, -- only carbonfox is good
  {
    'scottmckendry/cyberdream.nvim',
    enable = false,
    lazy = false,
    priority = 1000,
    config = {
      transparent = true,
      saturation = 0.9,
    },
  },
  {
    'bluz71/vim-moonfly-colors',
    name = 'moonfly',
    lazy = false,
    priority = 1000,
    config = function()
      -- colorscheme
      vim.cmd.colorscheme 'moonfly'
    end,
  },
  {
    'slugbyte/lackluster.nvim',
    enable = false,
    lazy = false,
    priority = 1000,
    init = function()
      --vim.cmd.colorscheme 'lackluster'
      vim.cmd.colorscheme 'lackluster-night' -- my favorite, or *-dark
      -- vim.cmd.colorscheme("lackluster-mint")
    end,
  },
}
