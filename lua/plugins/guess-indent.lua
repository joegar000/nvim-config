return {
  {
    "nmac427/guess-indent.nvim",
    event = "VeryLazy",
    keys = { "<leader>>", "<cmd>GuessIndent<CR>", desc = "Guess indentation" },
    config = function()
      require("guess-indent").setup()
    end,
  },
}
