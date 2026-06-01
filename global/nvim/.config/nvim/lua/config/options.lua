-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua

-- mine
vim.opt.clipboard = "unnamedplus" -- copies the nvim buffer to the clipboard ("wl-copy" needed atleast on wayland)
vim.opt.fillchars = { eob = " " } -- hides the "~" on blank lines
vim.opt.cmdheight = 0 -- disables the cmd status line

vim.opt.spell = true
vim.opt.spelllang = "en_us"

vim.opt.cursorline = true

vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.softtabstop = 4

vim.opt.number = true -- show line numbers
vim.opt.relativenumber = true -- show relative numbers
