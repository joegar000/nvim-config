return {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.6', -- or, branch = '0.1.x',
    dependencies = { {'nvim-lua/plenary.nvim'} },
    keys = {
        { '<leader>ff', '<cmd>Telescope find_files<CR>', desc = 'Find files' },
        { '<leader>gf', '<cmd>Telescope git_files<CR>', desc = 'Git files' },
        { '<leader>lg', '<cmd>Telescope live_grep<CR>', desc = 'Live grep' }
    },
    cmd = 'Telescope',
    config = true
}
