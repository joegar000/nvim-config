
-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'
  -- Plugins go here


  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.4',
    -- or, branch = '0.1.x',
    requires = { {'nvim-lua/plenary.nvim'} }
  }

  use 'Mofiqul/vscode.nvim'


  use {
    'nvim-treesitter/nvim-treesitter',
    run = function()
      local ts_update = require('nvim-treesitter.install').update({with_sync = true})
      ts_update()
    end
  }

  use('nvim-treesitter/playground')

  use('theprimeagen/harpoon')

  use('mbbill/undotree')

  use('tpope/vim-fugitive')

  use {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v3.x',
    requires = {
      --- Uncomment these if you want to manage LSP servers from neovim
      {'williamboman/mason.nvim'},
      {'williamboman/mason-lspconfig.nvim'},

      -- LSP Support
      {'neovim/nvim-lspconfig'},
      -- Autocompletion
      {'hrsh7th/nvim-cmp'},
      {'hrsh7th/cmp-nvim-lsp'},
      {'L3MON4D3/LuaSnip'},
    }
  }

  use('kylechui/nvim-surround')

  use('jiangmiao/auto-pairs')

  use('nvim-tree/nvim-tree.lua')
  use('nvim-tree/nvim-web-devicons')

  use('yuezk/vim-js')
  use('HerringtonDarkholme/yats.vim')
  use('maxmellon/vim-jsx-pretty')

  use('preservim/nerdcommenter')

  use ('nmac427/guess-indent.nvim')

  use {
    'nvimdev/dashboard-nvim',
    event = 'VimEnter',
    config = function()
      require('dashboard').setup {
        -- config
      }
    end,
    requires = {'nvim-tree/nvim-web-devicons'}
  }


  use 'mfussenegger/nvim-dap'

  use { "rcarriga/nvim-dap-ui", requires = {"mfussenegger/nvim-dap"} }

  use 'folke/neodev.nvim'

  use 'David-Kunz/jester'

  use 'karb94/neoscroll.nvim'

  use 'xiyaowong/transparent.nvim'

  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'nvim-tree/nvim-web-devicons', opt = true }
  }

  -- Plugins end here
end)

