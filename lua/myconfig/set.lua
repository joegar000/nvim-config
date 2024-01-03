vim.opt.listchars:append({ space = '·', trail = '·', tab = '<->' })
vim.opt.list = true

vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.ignorecase = true

-- Determines how many spaces a tab is
vim.opt.softtabstop = 4

vim.opt.smartindent = true

vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = (os.getenv('HOME') or (os.getenv('HOMEDRIVE')) .. os.getenv('HOMEPATH')) .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50
vim.opt.colorcolumn = "80"

vim.g.mapleader = " "

