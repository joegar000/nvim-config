require("jester").setup({
  path_to_jest_run = 'npx jest',
  cmd = "npm test $file -- -t '$result'"
})
