return {
  'hrsh7th/nvim-cmp',
  event = 'InsertEnter',
  dependencies = {
    {
      { 'L3MON4D3/LuaSnip' },
      { 'hrsh7th/cmp-nvim-lsp' },
      { 'saadparwaiz1/cmp_luasnip' },
      { 'rafamadriz/friendly-snippets' }
    }
  },
  config = function()
    require("luasnip.loaders.from_vscode").lazy_load()

    local cmp = require('cmp')
    cmp.setup({
      mapping = cmp.mapping.preset.insert({
        ['<C-p>'] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }),
        ['<C-n>'] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }),
        ['<C-u>'] = cmp.mapping.scroll_docs(-4),
        ['<C-d>'] = cmp.mapping.scroll_docs(4),
        ['<C-y>'] = cmp.mapping.confirm({ select = true }),
        ['<C-Space>'] = cmp.mapping.complete(),
      }),
      snippet = {
        expand = function(args)
          require('luasnip').lsp_expand(args.body)
        end,
      },
      sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'luasnip' },
      }, {
        { name = 'buffer' }
      })
    })
  end
}
