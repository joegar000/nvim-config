-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.keymap.set("n", "<leader>>", ":GuessIndent<CR>")

-- Allows J and K to shift lines around when in visual or visual line mode
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Keeps cursor in same position when appending lines to current lines when using J
vim.keymap.set("n", "J", "mzJ`z")

-- Keeps cursor in center of screen when using search
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- Preserves paste when pasting over selected text
vim.keymap.set("x", "<leader>p", '"_dP')

-- Paste from system clipboard
vim.keymap.set("n", "<leader>p", '"+p')
vim.keymap.set("n", "<leader>P", '"+P')

-- Allows <leader>y and <leader>Y to copy into system clipboard
vim.keymap.set("n", "<leader>y", '"+y')
vim.keymap.set("v", "<leader>y", '"+y')
vim.keymap.set("n", "<leader>Y", '"+Y')

-- Don't know why, but primeagen doesn't like capital q
vim.keymap.set("n", "Q", "<nop>")
