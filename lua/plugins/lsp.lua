return {
  {
    "neovim/nvim-lspconfig",
    init = function()
      local keys = require("lazyvim.plugins.lsp.keymaps").get()

      keys[#keys + 1] = {
        "<leader>vca",
        vim.lsp.buf.code_action,
        desc = "Code Action",
      }

      keys[#keys + 1] = {
        "<leader>vrr",
        vim.lsp.buf.references,
        desc = "References",
      }

      keys[#keys + 1] = {
        "<leader>vrn",
        vim.lsp.buf.rename,
        desc = "Rename",
      }
    end,
  },
}
