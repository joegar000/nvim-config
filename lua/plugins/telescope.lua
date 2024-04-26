return {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.6', -- or, branch = '0.1.x',
    dependencies = { {'nvim-lua/plenary.nvim'} },
    keys = {
        { '<leader>tf', '<cmd>Telescope find_files<CR>', desc = 'Find files' },
        { '<leader>tg', '<cmd>Telescope git_files<CR>', desc = 'Git files' },
        { '<leader>tlg', '<cmd>Telescope live_grep<CR>', desc = 'Live grep' },
        { '<leader>tk', '<cmd>Telescope keymaps', desc = 'Keymaps' }
    },
    cmd = 'Telescope',
    config = true
}
