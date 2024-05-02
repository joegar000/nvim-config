
local remaps = {
    ['J'] = { ":m '>+1<CR>gv=gv", desc = "Move line down", mode = "v" },
    ['K'] = { ":m '<-2<CR>gv=gv", desc = "Move line up", mode = "v" },
    ['<C-k>'] = { ":wincmd k<CR>", desc = "Move to pane above", mode = "n" },
    ['<C-j>'] = { ":wincmd j<CR>", desc = "Move to pane below", mode = "n" },
    ['<C-h>'] = { ":wincmd h<CR>", desc = "Move to left pane", mode = "n" },
    ['<C-l>'] = { ":wincmd l<CR>", desc = "Move to right pane", mode = "n" }
}


-- Keeps cursor in same position when appending lines to current lines when using J
vim.keymap.set("n", "J", "mzJ`z")

-- Keeps cursor in center of screen when using C-d or C-u
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- Keeps cursor in center of screen when using search
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- Don't know why, but primeagen doesn't like capital q
vim.keymap.set("n", "Q", "<nop>")

return remaps
