return {
  {
    'williamboman/mason.nvim',
    keys = {
      { '<leader>m', '<cmd>Mason<CR>', desc = 'Open Mason' },
      { '<leader>jq', '<cmd>%!jq<CR>', desc = 'Format JSON' }
    },
    config = function()
      require('mason').setup({
        ui = {
          border = 'rounded'
        }
      })
    end
  },
  {
    'williamboman/mason-lspconfig.nvim',
  }
}
