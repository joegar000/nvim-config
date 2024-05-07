local lspconfig = {
  {
    'neovim/nvim-lspconfig',
    cmd = { 'LspInfo', 'LspInstall', 'LspStart' },
    event = { 'BufReadPre', 'BufNewFile' },
    keys = {
      { 'gd', function() require("telescope.builtin").lsp_definitions({ reuse_win = true }) end, desc = "Goto Definition" },
      { 'gD', vim.lsp.buf.declaration, desc = "Goto Declaration" },
      { 'gI', function() require("telescope.builtin").lsp_implementations({ reuse_win = true }) end, desc = "Goto Implementation" },
      { 'gy', function() require("telescope.builtin").lsp_type_definitions({ reuse_win = true }) end, desc = "Goto T[y]pe Definition" },
      { 'gr', function() require("telescope.builtin").lsp_references({ reuse_win = true }) end, desc = 'References' },
      { 'K', vim.lsp.buf.hover, desc = 'Hover' },
      { 'gK', vim.lsp.buf.signature_help, desc = 'Signature help' },
      { '<C-k>', vim.lsp.buf.signature_help, desc = 'Signature help', mode = 'i' },
      { '<leader>cws', vim.lsp.buf.workspace_symbol, desc = 'Workspace symbols' },
      { '<leader>cop', vim.diagnostic.open_float, desc = 'Open diagnostic float' },
      { '<leader>ca', vim.lsp.buf.code_action, desc = 'Code action' },
      { '<leader>cr', vim.lsp.buf.rename, desc = 'Rename' },
      { ']d', vim.diagnostic.goto_next, desc = 'Go to next diagnostic' },
      { '[d', vim.diagnostic.goto_prev, desc = 'Go to previous diagnostic' },
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
    dependencies = {
      { 'hrsh7th/nvim-cmp' },
      { 'L3MON4D3/LuaSnip' },
      { 'hrsh7th/cmp-nvim-lsp' },
      { 'saadparwaiz1/cmp_luasnip' },
      { 'rafamadriz/friendly-snippets' },
      { 'williamboman/mason.nvim' },
      { 'folke/neodev.nvim' },
      {
        'folke/which-key.nvim',
        optional = true,
        opts = {
          defaults = {
            ['<leader>c'] = { name = '+code' },
            ['g'] = { name = '+goto' }
          }
        }
      }
    },
    config = function()
      require('neodev').setup()
      local lsp = require('lspconfig')
      local default_capabilities = require('cmp_nvim_lsp').default_capabilities()
      local lsp_defaults = lsp.util.default_config
      lsp_defaults.capabilties = vim.tbl_deep_extend(
        'force',
        lsp_defaults.capabilities,
        default_capabilities
      )

      require('mason').setup()
      require('mason-lspconfig').setup({
        ensure_installed = {
          'lua_ls',
          'basedpyright',
          'tsserver'
        },
        handlers = {
          -- this first function is the "default handler"
          -- it applies to every language server without a "custom handler"
          function(server_name)
            require('lspconfig')[server_name].setup({
              capabilities = default_capabilities
            })
          end
        }
      })

      lsp['basedpyright'].setup({
        capabilities = default_capabilities,
        settings = {
          basedpyright = {
            typeCheckingMode = 'standard'
          }
        }
      })
    end
  }
}

local completions = require('plugins.lsp.completions')
local mason = require('plugins.lsp.mason')
return { unpack(lspconfig), completions, mason }
