-- here only goes packages that only requires a easy setup
return {
  --{ 'akinsho/bufferline.nvim', version = '*', dependencies = 'nvim-tree/nvim-web-devicons' },
  {
    'tris203/precognition.nvim',
    --event = "VeryLazy",
    opts = {
      startVisible = true,
      showBlankVirtLine = true,
      -- highlightColor = { link = "Comment" },
    },
  },
  {
    'rebelot/kanagawa.nvim',
    opts = {
      transparent = false,
    },
  },
}
