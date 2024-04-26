return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  init = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 300
  end,
  config = function(_, opts)
    local wk = require('which-key')
    wk.setup(opts)
    wk.register(opts.defaults)
  end,
  opts = {
    plugins = { spelling = true },
    defaults = {
      ['<leader>z'] = '+comment',
      ['g'] = '+goto',
      ['<leader>c'] = '+code',
      ['<leader>b'] = '+buffer',
      ['<leader>t'] = '+telescope',
      ['<leader>x'] = '+trouble'
    }
  }
}
