return {
  {
    "kylechui/nvim-surround",
    keys = {
      { "ysiw", desc = "Surround inner word" },
      { "ysaw", desc = "Surround outer word" },
      { "ds", desc = "Delete surrounding char" },
      { "cs", desc = "Change surrounding char to new char" },
    },
    config = function()
      require("nvim-surround").setup()
    end,
  },
}
