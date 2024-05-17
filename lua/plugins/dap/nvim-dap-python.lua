return {
  {
    'mfussenegger/nvim-dap-python',
    config = function()
      require('dap-python').test_runner = 'pytest'
      require('dap-python').setup()
    end
  },
  {
    "jay-babu/mason-nvim-dap.nvim",
    dependencies = {
      'williamboman/mason.nvim'
    },
    config = function()
      require('mason-nvim-dap').setup({
          ensure_installed = {'stylua', 'jq'},
          handlers = {
              function(config)
                -- all sources with no handler get passed here

                -- Keep original functionality
                require('mason-nvim-dap').default_setup(config)
              end,
              python = function(config)
                  config.adapters = {
                   type = "executable",
                    command = "/usr/bin/python3",
                    args = {
                      "-m",
                      "debugpy.adapter",
                    },
                  }
                  require('mason-nvim-dap').default_setup(config) -- don't forget this!
              end,
          },
      })
    end
  },
  {
    'linux-cultist/venv-selector.nvim',
    dependencies = { 'neovim/nvim-lspconfig', 'nvim-telescope/telescope.nvim', 'mfussenegger/nvim-dap-python' },
    opts = {
      dap_enabled = true
    },
    event = 'VeryLazy', -- Optional: needed only if you want to type `:VenvSelect` without a keymapping
    keys = {
      -- Keymap to open VenvSelector to pick a venv.
      { '<leader>vs', '<cmd>VenvSelect<cr>' },
      -- Keymap to retrieve the venv from a cache (the one previously used for the same project directory).
      { '<leader>vc', '<cmd>VenvSelectCached<cr>' },
    },
  }
}
