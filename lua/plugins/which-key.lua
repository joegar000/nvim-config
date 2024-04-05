return {
  {
    "folke/which-key.nvim",
    opts = function(_, opts)
      opts.defaults["ys"] = { name = "+surround" }
      opts.defaults["gs"] = nil
    end,
  },
}
