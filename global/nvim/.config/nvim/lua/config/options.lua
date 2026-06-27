-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua

-- etc
vim.opt.clipboard = "unnamedplus" -- copies the nvim buffer to the clipboard ("wl-copy" needed atleast on wayland)

-- spelling
vim.opt.spell = true
vim.opt.spelllang = "en_us"

--decorative
vim.opt.cursorline = true
vim.opt.termguicolors = true
vim.opt.winborder = "rounded"
vim.opt.wrap = true --textwrap
vim.opt.cmdheight = 0 -- disables the cmd status line
-- vim.opt.colorcolumn = "80"

-- recovery
vim.opt.undofile = true --WARN: this caused me the worst of all of my fears

--tabs & spaces
vim.opt.tabstop = 2 --before 4
vim.opt.shiftwidth = 2 --before 4
vim.opt.expandtab = true
vim.opt.softtabstop = 4

-- sidebar
vim.opt.number = true -- show line numbers
vim.opt.relativenumber = true -- show relative numbers
vim.opt.fillchars = { eob = " " } -- hides the "~" on blank lines
-- vim.opt.signcolumn = "yes"

-- programming experience???? utils bro
vim.opt.smartindent = true
vim.opt.autoindent = true
vim.opt.ignorecase = true
-- vim.opt.smartcase = true
vim.opt.scrolloff = 8 --keep the cursors 8 rows from top/bot
vim.lsp.inlay_hint.enable(true)

--auto read
vim.o.autoread = true
vim.api.nvim_create_autocmd({ "FocusGained", "BufEnter" }, {
  command = "if mode() != 'c' | checktime | endif",
  pattern = "*",
})
