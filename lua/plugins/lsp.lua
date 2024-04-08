
return {
  {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v3.x',
    init = function()
      local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
      vim.opt.rtp:prepend(lazypath)

      vim.cmd.colorscheme('habamax')

      local lsp_zero = require('lsp-zero')

      lsp_zero.on_attach(function(client, bufnr)
        -- see :help lsp-zero-keybindings
        -- to learn the available actions
        lsp_zero.default_keymaps({buffer = bufnr})
      end)

      -- to learn how to use mason.nvim with lsp-zero
      -- read this: https://github.com/VonHeikemen/lsp-zero.nvim/blob/v3.x/doc/md/guides/integrate-with-mason-nvim.md
      require('mason').setup({})
      require('mason-lspconfig').setup({
        handlers = {
          lsp_zero.default_setup,
        }
      })
    end
  },
  {'williamboman/mason.nvim'},
  {'williamboman/mason-lspconfig.nvim'},
  {'neovim/nvim-lspconfig'},
  {'hrsh7th/cmp-nvim-lsp'},
  {'hrsh7th/nvim-cmp'},
  {'L3MON4D3/LuaSnip'},
}

