local actions = require("telescope.actions")
-- TODO: Make <C-c> not close telescope yet
return {
  {
    "nvim-telescope/telescope.nvim",
    event = "VeryLazy",
    opts = {
      mappings = {
        i = {
          ["<C-c>"] = false,
        },
        n = {
          ["<C-c>"] = actions.close,
        },
      },
    },
  },
}
