return {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v3.x',
    lazy = false,
    keys = {
      { 'gd', function() vim.lsp.buf.definition() end, desc = 'Go to definition' },
      { 'K', function() vim.lsp.buf.hover() end, desc = 'Hover' },
      { '<leader>vws', function() vim.lsp.buf.workspace_symbol() end, desc = 'Workspace symbol' },
      { '<leader>vd', function() vim.diagnostic.open_float() end, desc = 'Show diagnostics' },
      { '[d', function() vim.diagnostic.goto_next() end, desc = 'Go to next diagnostic' },
      { ']d', function() vim.diagnostic.goto_prev() end, desc = 'Go to previous diagnostic' },
      { '<leader>ca', function() vim.lsp.buf.code_action() end, desc = 'Code action' },
      { '<leader>rn', function() vim.lsp.buf.rename() end, desc = 'Rename' },
      { 'gK', function() vim.lsp.buf.signature_help() end, desc = 'Signature help' }
    },
    dependencies = {
      {
        'williamboman/mason.nvim',
        lazy = false,
        opts = {},
        keys = { { '<leader>m', '<cmd>Mason<CR>', desc = 'Open Mason' } }
      },
      {
        'williamboman/mason-lspconfig.nvim',
        lazy = false,
        opts = {}
      },

      -- LSP Support
      { 'neovim/nvim-lspconfig' },
      -- Autocompletion
      { 'hrsh7th/nvim-cmp' },
      { 'hrsh7th/cmp-nvim-lsp' },
      { 'L3MON4D3/LuaSnip' },
    },
    opts = {}
  }

