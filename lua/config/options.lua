-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

vim.opt.listchars:append({ space = "·", trail = "·", tab = "<->" })
vim.opt.list = true

vim.opt.scrolloff = 4

vim.opt.colorcolumn = "120"

vim.opt.undodir = (os.getenv("HOME") or (os.getenv("HOMEDRIVE")) .. os.getenv("HOMEPATH")) .. "/.vim/undodir"

local isWindows = package.config:sub(1, 1) == "\\"

if vim.g.neovide and isWindows then
  vim.g.neovide_scale_factor = 0.85
end
