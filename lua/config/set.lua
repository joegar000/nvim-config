vim.opt.listchars:append({ space = '·', trail = '·', tab = '<->' })
vim.opt.list = true

vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.ignorecase = true

-- Determines how many spaces a tab is
vim.opt.softtabstop = 4

vim.opt.smartindent = true

vim.opt.wrap = false

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50
vim.opt.colorcolumn = "80"

vim.g.mapleader = " "

vim.opt.colorcolumn = "120"

if isNeovide and isWindows then
  vim.g.neovide_scale_factor = 0.85
end
