return {
    'mbbill/undotree',
    keys = { { '<leader>ut', vim.cmd.UndoTreeToggle, desc = 'Toggle Undotree' } },
    init = function()
    vim.opt.swapfile = false
        vim.opt.backup = false
        vim.opt.undodir = (os.getenv('HOME') or (os.getenv('HOMEDRIVE')) .. os.getenv('HOMEPATH')) .. "/.vim/undodir"
        vim.opt.undofile = true
    end,
    opts = {}
}
