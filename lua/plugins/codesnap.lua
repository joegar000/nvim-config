if not IsWindows then
  return {
    "mistricky/codesnap.nvim",
    build = "make build_generator",
    keys = {
      { "<leader>cs", "<cmd>CodeSnap<cr>", mode = "x", desc = "Save selected code snapshot into clipboard" },
      { "<leader>cp", "<cmd>CodeSnapSave<cr>", mode = "x", desc = "Save selected code snapshot in ~/Pictures" },
    },
    opts = {
      has_breadcrumbs = true,
      bg_color = "#535c68",
      watermark = "",
      mac_window_bar = false
    }
  }
else
  return {}
end
