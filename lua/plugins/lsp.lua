
return {
  {
    "folke/neodev.nvim",
    opts = {}
  },
  {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v3.x',
    lazy = false,
    keys = {
      { "gd", function() require("telescope.builtin").lsp_definitions({ reuse_win = true }) end, desc = "Goto Definition" },
      { "gD", vim.lsp.buf.declaration, desc = "Goto Declaration" },
      { "gI", function() require("telescope.builtin").lsp_implementations({ reuse_win = true }) end, desc = "Goto Implementation" },
      { "gy", function() require("telescope.builtin").lsp_type_definitions({ reuse_win = true }) end, desc = "Goto T[y]pe Definition" },
      { 'K', vim.lsp.buf.hover, desc = 'Hover' },
      { 'gK', vim.lsp.buf.signature_help, desc = 'Signature help' },
      { '<C-k>', vim.lsp.buf.signature_help, desc = 'Signature help', mode = 'i' },
      { '<leader>vws', vim.lsp.buf.workspace_symbol, desc = 'Workspace symbols' },
      -- { '<leader>vd', vim.definition.open_float, desc = 'Open float' },
      { '[d', vim.diagnostic.goto_next, desc = 'Go to next diagnostic' },
      { ']d', vim.diagnostic.goto_prev, desc = 'Go to previous diagnostic' },
      { '<leader>ca', vim.lsp.buf.code_action, desc = 'Code action' },
      { '<leader>gr', vim.lsp.buf.references, desc = 'References' },
      { '<leader>cr', vim.lsp.buf.rename, desc = 'Rename' },
      { 'gI', function() require('telescope.builtin').lsp_implementations({ reuse_win = true }) end, desc = 'Goto Implementation' },
      { 'gy', function() require('telescope.builtin').lsp_type_definitions({ reuse_win = true }) end, desc = 'Goto T[y]pe Definition' },
      {
        "<leader>cA",
        function()
          vim.lsp.buf.code_action({
            context = {
              only = {
                "source",
              },
              diagnostics = {},
            },
          })
        end,
        desc = "Source Action",
      },
      { "<leader>cc", vim.lsp.codelens.run, desc = "Run Codelens", mode = { "n", "v" } },
      { "<leader>cC", vim.lsp.codelens.refresh, desc = "Refresh & Display Codelens", mode = { "n" } }
    },
    config = function()
      require('neodev').setup() -- Load neodev before any other lsp plugins
      local lsp_zero = require('lsp-zero')
      lsp_zero.extend_lspconfig()
    end,
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
  {
    'williamboman/mason.nvim',
    keys = {
      { '<leader>m', '<cmd>Mason<CR>', desc = 'Open Mason' }
    }
  },
  {'williamboman/mason-lspconfig.nvim'},
  {'neovim/nvim-lspconfig'},
  {'hrsh7th/cmp-nvim-lsp'},
  {
    'hrsh7th/nvim-cmp',
  },
  {'L3MON4D3/LuaSnip'},
}

