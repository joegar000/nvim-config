return {
  'mfussenegger/nvim-dap-python',
  dependencies = { 'mfussenegger/nvim-dap' },
  enabled = true,
  lazy = false,
  ft = { 'python' },
  config = function()
    local status, dap = pcall(require, 'dap')
    if not status then
      return
    end
    local dappython
    status, dappython = pcall(require, 'dap-python')
    if not status then
      return
    end
    dap.configurations.python = {
      {
        type = 'python',
        request = 'launch',
        name = 'Launch file (justMyCode = false)',
        program = '${file}',
        justMyCode = false,
      },
      {
        type = 'python',
        request = 'launch',
        name = 'Launch file with arguments (justMyCode = false)',
        program = '${file}',
        justMyCode = false,
        args = function()
          local args_string = vim.fn.input('Arguments: ')
          return vim.split(args_string, ' +')
        end,
      },
      {
        type = 'python',
        request = 'launch',
        name = 'Launch file (console = integratedTerminal, justMyCode = false)',
        program = '${file}',
        console = 'integratedTerminal',
        justMyCode = false,
        -- pythonPath = opts.pythonPath,
      },
      {
        type = 'python',
        request = 'launch',
        name = 'Launch file with arguments (console = integratedTerminal, justMyCode = false)',
        program = '${file}',
        console = 'integratedTerminal',
        justMyCode = false,
        -- pythonPath = opts.pythonPath,
        args = function()
          local args_string = vim.fn.input('Arguments: ')
          return vim.split(args_string, ' +')
        end,
      },
    }
    local path = require('mason-registry').get_package('debugpy'):get_install_path() .. '/venv/Scripts/python'
    local venv = vim.fn.expand(path)

    if vim.fn.filereadable(venv) == 0 then
      vim.schedule(function()
        vim.api.nvim_notify('missing venv: ' .. venv, vim.log.levels.WARN, {})
        -- vim.api.nvim_notify(
        --   'try: mkdir -p ~/.virtualenvs && cd ~/.virtualenvs && python -m venv debugpy && pip install --no-cache-dir --upgrade debugpy',
        --   vim.log.levels.WARN,
        --   {}
        -- )
      end)
    end
    dappython.setup(path, {
      include_configs = true,
      console = 'integratedTerminal',
      pythonPath = nil,
    })
  end,
}
