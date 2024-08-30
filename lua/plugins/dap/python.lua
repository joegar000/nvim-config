return {
  -- https://github.com/mfussenegger/nvim-dap-python
  'mfussenegger/nvim-dap-python',
  ft = 'python',
  dependencies = {
    -- https://github.com/mfussenegger/nvim-dap
    'mfussenegger/nvim-dap',
  },
  config = function ()
    -- Update the path passed to setup to point to your system or virtual env python binary
    -- local path = vim.fn.exepath('python')
    require('dap-python').setup('python')
  end
}
