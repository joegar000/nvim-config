require("jester").setup({
  dap = {
    console = "externalTerminal",
    cmd = "npm test $file -- -t '$result'",
    path_to_jest_run = 'npm test'
  }
})
