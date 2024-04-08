return {
    'karb94/neoscroll.nvim',
    config = function()
        require('neoscroll').setup()
    end,
    enabled = function()
        return not InNeovide
    end
}
