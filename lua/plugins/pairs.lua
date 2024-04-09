return {
  "echasnovski/mini.pairs",
  event = "VeryLazy",
  opts = {},
  keys = {
    {
      "<leader>up",
      function()
        vim.g.minipairs_disable = not vim.g.minipairs_disable
        local notify = require('notify').notify
        if vim.g.minipairs_disable then
          notify("Disabled auto pairs", vim.log.levels.WARN, { title = 'mini.pairs' })
        else
          notify("Enabled auto pairs", vim.log.levels.INFO, { title = 'mini.pairs' })
        end
      end,
      desc = "Toggle Auto Pairs",
    },
  },
}
