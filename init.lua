local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

IsWindows = package.config:sub(1,1) == '\\'
InNeovide = vim.g.neovide

vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

vim.keymap.set('n', '<leader>l', ':Lazy<CR>')

require("config")
require("lazy").setup("plugins")

local wk = require("which-key")
local maps = require("config.remap")
wk.register(maps)

