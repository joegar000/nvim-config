
local builtin = require('telescope.builtin')
local actions = require('telescope.actions')

vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>gf', builtin.git_files, {})
vim.keymap.set('n', '<leader>ps', function()
	builtin.grep_string({ search = vim.fn.input("Grep > ") });
end)

require("telescope").setup{
	defaults = {
		mappings = {
			i = {
				['<C-c>'] = false
			},
			n = {
				['<C-c>'] = actions.close
			}
		}
	}
}

