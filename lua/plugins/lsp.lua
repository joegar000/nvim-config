
return {
  {
    "folke/neodev.nvim",
    lazy = false,
    config = function()
      require('neodev').setup()
    end
  },
  {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v3.x',
    lazy = true,
    config = false,
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
    init = function()
      vim.g.lsp_zero_extend_cmp = 0
      vim.g.lsp_zero_extend_lspconfig = 0
    end
  },
  {
    'williamboman/mason.nvim',
    lazy = false,
    config = true,
    keys = {
      { '<leader>m', '<cmd>Mason<CR>', desc = 'Open Mason' }
    }
  },
  {
    'hrsh7th/nvim-cmp',
    event = 'InsertEnter',
    dependencies = {
      {'L3MON4D3/LuaSnip'},
    },
    config = function()
      local lsp = require('lsp-zero')
      lsp.extend_cmp()

      local cmp = require('cmp')
      local cmp_select = {behavior = cmp.SelectBehavior.Select}
      local cmp_action = lsp.cmp_action()

      cmp.setup({
        sources = {
          {name = 'path'},
          {name = 'nvim_lsp'},
          {name = 'nvim_lua'},
        },
        formatting = lsp.cmp_format(),
        mapping = cmp.mapping.preset.insert({
          ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
          ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
          ['<C-u>'] = cmp.mapping.scroll_docs(-4),
          ['<C-d>'] = cmp.mapping.scroll_docs(4),
          ['<C-f>'] = cmp_action.luasnip_jump_forward(),
          ['<C-b>'] = cmp_action.luasnip_jump_backward(),
          ['<C-y>'] = cmp.mapping.confirm({ select = true }),
          ['<C-Space>'] = cmp.mapping.complete(),
        }),
        snippet = {
          expand = function(args)
            require('luasnip').lsp_expand(args.body)
          end,
        },
      })
    end
  },
  {
    'neovim/nvim-lspconfig',
    cmd = {'LspInfo', 'LspInstall', 'LspStart'},
    event = {'BufReadPre', 'BufNewFile'},
    dependencies = {
      {'hrsh7th/cmp-nvim-lsp'},
      {'williamboman/mason-lspconfig.nvim'},
    },
    config = function()
      local lsp_zero = require('lsp-zero')
      lsp_zero.extend_lspconfig()

      -- if you want to know more about mason.nvim
      -- read this: https://github.com/VonHeikemen/lsp-zero.nvim/blob/v3.x/doc/md/guides/integrate-with-mason-nvim.md
      lsp_zero.on_attach(function(client, bufnr)
        -- see :help lsp-zero-keybindings
        -- to learn the available actions
        lsp_zero.default_keymaps({buffer = bufnr})
      end)

      require('mason-lspconfig').setup({
        ensure_installed = {},
        handlers = {
          -- this first function is the "default handler"
          -- it applies to every language server without a "custom handler"
          function(server_name)
            require('lspconfig')[server_name].setup({})
          end,

          -- this is the "custom handler" for `lua_ls`
          lua_ls = function()
            -- (Optional) Configure lua language server for neovim
            local lua_opts = lsp_zero.nvim_lua_ls()
            require('lspconfig').lua_ls.setup(lua_opts)
          end,
        }
      })
    end
  }
}

