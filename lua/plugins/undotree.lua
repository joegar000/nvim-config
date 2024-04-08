return {
    'mbbill/undotree',
    keys = { { '<leader>ut', '<cmd>UndoTreeToggle<CR>', desc = 'Toggle Undotree' } },
    init = function()
        vim.opt.undodir = (os.getenv('HOME') or (os.getenv('HOMEDRIVE')) .. os.getenv('HOMEPATH')) .. "/.vim/undodir"
        vim.opt.undofile = true
    end,
    opts = {}
}
