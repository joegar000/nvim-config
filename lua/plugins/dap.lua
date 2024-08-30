-- Credit to https://github.com/gonstoll/dotfiles/blob/fd67b4bb508c66a10121482ca9002ad3bf735329/nvim/.config/nvim/lua/plugins/dap.lua
local js_based_languages = {'typescript', 'javascript', 'typescriptreact', 'javascriptreact'}

---@param config {args?:string[]|fun():string[]?}
local function get_args(config)
  local args = type(config.args) == 'function' and (config.args() or {}) or config.args or {}
  config = vim.deepcopy(config)

  ---@cast args string[]
  config.args = function()
    ---@diagnostic disable-next-line: redundant-parameter
    local new_args = vim.fn.input('Run with args: ', table.concat(args, ' ')) --[[@as string]]
    return vim.split(vim.fn.expand(new_args) --[[@as string]], ' ')
  end

  return config
end

return {
  'mfussenegger/nvim-dap',
  dependencies = {
    {'stevearc/overseer.nvim', opts = {dap = false}},
    {
      'rcarriga/nvim-dap-ui',
      dependencies = {
        'nvim-neotest/nvim-nio'
      },
      keys = {
        {'<leader>du', function() require('dapui').toggle({}) end, desc = 'Dap UI'},
        {'<leader>de', function() require('dapui').eval() end, desc = 'Eval', mode = {'n', 'v'}},
      },
      opts = {
        layouts = {
          {
            elements = {
              {id = 'scopes', size = 0.25},
              {id = 'breakpoints', size = 0.25},
              {id = 'stacks', size = 0.25},
              {id = 'watches', size = 0.25}
            },
            position = 'left',
            size = 40
          },
          {
            elements = {
              {id = 'console', size = 1}
            },
            position = 'bottom',
            size = 10,
          }
        },
      },
    },
    -- vscode-js-debug adapter
    {
      'microsoft/vscode-js-debug',
      build = 'npm i && npm run compile vsDebugServerBundle && rm -rf out && mv -f dist out',
    },
    {
      'mfussenegger/nvim-dap-python',
      dependencies = {
        "jay-babu/mason-nvim-dap.nvim",
        'williamboman/mason.nvim',
        {
          "linux-cultist/venv-selector.nvim",
          dependencies = {
            "neovim/nvim-lspconfig",
            "mfussenegger/nvim-dap",
            "mfussenegger/nvim-dap-python", --optional
            { "nvim-telescope/telescope.nvim", branch = "0.1.x", dependencies = { "nvim-lua/plenary.nvim" } },
          },
          lazy = false,
          branch = "regexp", -- This is the regexp branch, use this for the new version
          config = function()
            require('venv-selector').setup({
              pipenv_path = IsWindows and '~\\.virtualenvs\\' or '~/.local/share/virtualenvs/',
              dap_enabled = true
            })
          end,
          keys = {
            -- Keymap to open VenvSelector to pick a venv.
            { '<leader>vs', '<cmd>VenvSelect<cr>' },
          }
        }
      }
    },
    {
      'mxsdev/nvim-dap-vscode-js',
      opts = {
        debugger_path = vim.fn.resolve(vim.fn.stdpath('data') .. '/lazy/vscode-js-debug'),
        adapters = {'pwa-node', 'pwa-chrome', 'pwa-msedge', 'node-terminal', 'pwa-extensionHost'},
      }
    },
    {'theHamsta/nvim-dap-virtual-text', opts = {}},
    -- Lua adapter
    {
      'jbyuki/one-small-step-for-vimkind',
      keys = {
        {'<leader>dL', function() require('osv').launch({port = 8086}) end, desc = 'Launch Lua adapter'},
        {'<leader>dT', function() require('osv').run_this() end, desc = 'Lua adapter: Run this'},
      },
    },
  },
  keys = {
    {'<leader>Td', function() require('neotest').run.run({strategy = 'dap'}) end, desc = 'Debug Nearest'},
    {'<leader>dB', function() require('dap').set_breakpoint(vim.fn.input('Breakpoint condition: ')) end, desc = 'Breakpoint Condition'},
    {'<leader>db', function() require('dap').toggle_breakpoint() end, desc = 'Toggle Breakpoint'},
    {'<leader>dc', function() require('dap').continue() end, desc = 'Continue'},
    {'<leader>dC', function() require('dap').run_to_cursor() end, desc = 'Run to Cursor'},
    {'<leader>dg', function() require('dap').goto_() end, desc = 'Go to line (no execute)'},
    {'<leader>dj', function() require('dap').down() end, desc = 'Down'},
    {'<leader>dk', function() require('dap').up() end, desc = 'Up'},
    {'<leader>dl', function() require('dap').run_last() end, desc = 'Run Last'},
    {'<leader>di', function() require('dap').step_into() end, desc = 'Step Into'},
    {'<leader>dO', function() require('dap').step_out() end, desc = 'Step Out'},
    {'<leader>do', function() require('dap').step_over() end, desc = 'Step Over'},
    {'<leader>dp', function() require('dap').pause() end, desc = 'Pause'},
    {'<leader>dr', function() require('dap').repl.toggle() end, desc = 'Toggle REPL'},
    {'<leader>ds', function() require('dap').session() end, desc = 'Session'},
    {'<leader>dt', function() require('dap').terminate() end, desc = 'Terminate'},
    {'<leader>dh', function() require('dap.ui.widgets').hover() end, desc = 'Widgets'},
    {
      '<leader>da',
      function()
        if vim.fn.filereadable('.vscode/launch.json') then
          local dap_vscode = require('dap.ext.vscode')
          dap_vscode.json_decode = require('overseer.json').decode
          dap_vscode.load_launchjs(nil, {
            ['chrome'] = js_based_languages,
            ['node'] = js_based_languages,
            ['pwa-node'] = js_based_languages,
            ['pwa-chrome'] = js_based_languages,
            ['node-terminal'] = js_based_languages,
          })
        end
        require('dap').continue({before = get_args})
      end,
      desc = 'Run with Args',
    }
  },
  config = function()
    local dap = require('dap')
    local dapui = require('dapui')
    local icons = require('utils.icons')

    dap.listeners.after.event_initialized['dapui_config'] = function() dapui.open({}) end
    dap.listeners.before.event_terminated['dapui_config'] = function() dapui.close({}) end
    dap.listeners.before.event_exited['dapui_config'] = function() dapui.close({}) end

    vim.api.nvim_set_hl(0, 'DapStoppedLine', {default = true, link = 'Visual'})

    for name, sign in pairs(icons.dap) do
      sign = type(sign) == 'table' and sign or {sign}
      vim.fn.sign_define(
        'Dap' .. name,
        {text = sign[1], texthl = sign[2] or 'DiagnosticInfo', linehl = sign[3], numhl = sign[3]}
      )
    end

    -- Use overseer for running preLaunchTask and postDebugTask.
    require('overseer').patch_dap(true)

    for _, language in ipairs(js_based_languages) do
      dap.configurations[language] = {
        -- Debug single nodejs files
        {
          name = 'Launch file',
          type = 'pwa-node',
          request = 'launch',
          program = '${file}',
          cwd = '${workspaceFolder}',
          args = {'${file}'},
          sourceMaps = true,
          sourceMapPathOverrides = {
            ['./*'] = '${workspaceFolder}/src/*',
          },
          localRoot = '${workspaceFolder}',
          remoteRoot = "/usr/src/app"
        },
        -- Debug nodejs processes (make sure to add --inspect when you run the process)
        {
          name = 'Attach',
          type = 'pwa-node',
          request = 'attach',
          processId = require('dap.utils').pick_process,
          cwd = '${workspaceFolder}',
          sourceMaps = true,
          localRoot = '${workspaceFolder}',
          remoteRoot = "/usr/src/app"
        },
        {
          name = 'Debug Jest Tests',
          type = 'pwa-node',
          request = 'launch',
          runtimeExecutable = 'node',
          runtimeArgs = {'${workspaceFolder}/node_modules/.bin/jest', '--runInBand'},
          rootPath = '${workspaceFolder}',
          cwd = '${workspaceFolder}',
          console = 'integratedTerminal',
          internalConsoleOptions = 'neverOpen',
          localRoot = '${workspaceFolder}',
          remoteRoot = "/usr/src/app"
          -- args = {'${file}', '--coverage', 'false'},
          -- sourceMaps = true,
          -- skipFiles = {'<node_internals>/**', 'node_modules/**'},
        },
        {
          name = 'Debug Vitest Tests',
          type = 'pwa-node',
          request = 'launch',
          cwd = vim.fn.getcwd(),
          program = '${workspaceFolder}/node_modules/vitest/vitest.mjs',
          args = {'run', '${file}'},
          autoAttachChildProcesses = true,
          smartStep = true,
          skipFiles = {'<node_internals>/**', 'node_modules/**'},
          localRoot = '${workspaceFolder}',
          remoteRoot = "/usr/src/app"
        },
        -- Debug web applications (client side)
        {
          name = 'Launch & Debug Chrome',
          type = 'pwa-chrome',
          request = 'launch',
          url = function()
            local co = coroutine.running()
            return coroutine.create(function()
              vim.ui.input({prompt = 'Enter URL: ', default = 'http://localhost:3000'}, function(url)
                if url == nil or url == '' then
                  return
                else
                  coroutine.resume(co, url)
                end
              end)
            end)
          end,
          webRoot = vim.fn.getcwd(),
          protocol = 'inspector',
          sourceMaps = true,
          userDataDir = false,
          resolveSourceMapLocations = {
            '${workspaceFolder}/**',
            '!**/node_modules/**',
          },

          -- From https://github.com/lukas-reineke/dotfiles/blob/master/vim/lua/plugins/dap.lua
          -- To test how it behaves
          rootPath = '${workspaceFolder}',
          cwd = '${workspaceFolder}',
          console = 'integratedTerminal',
          internalConsoleOptions = 'neverOpen',
          sourceMapPathOverrides = {
            ['./*'] = '${workspaceFolder}/src/*',
          },
        },
        -- Divider for the launch.json derived configs
        {
          name = '----- ↓ launch.json configs (if available) ↓ -----',
          type = '',
          request = 'launch',
        },
      }
    end

    require('dap-python').test_runner = 'pytest'
    local slash = IsWindows and '\\' or '/'
    require('dap-python').setup(vim.fn.stdpath('data') .. ('/mason/packages/debugpy/venv/bin/python'):gsub('/', slash):gsub('bin', IsWindows and 'Scripts' or 'bin'))
    require('dap-python').resolve_python = function()
      return io.popen('pipenv --venv'):read("*a")
    end

    require('mason-nvim-dap').setup({
        automatic_installation = true,
        handlers = {
            function(config)
              -- all sources with no handler get passed here

              -- Keep original functionality
              require('mason-nvim-dap').default_setup(config)
            end,
            -- python = function(config)
            --     config.adapters = {
            --      type = "executable",
            --       command = "/usr/bin/python3",
            --       args = {
            --         "-m",
            --         "debugpy.adapter",
            --       },
            --     }
            --     require('mason-nvim-dap').default_setup(config) -- don't forget this!
            -- end,
        },
    })


    -- Lua configurations.
    dap.adapters.nlua = function(callback, config)
      callback({type = 'server', host = config.host or '127.0.0.1', port = config.port or 8086})
    end

    dap.configurations['lua'] = {
      {
        type = 'nlua',
        request = 'attach',
        name = 'Attach to running Neovim instance',
        host = '127.0.0.1',
      },
    }
  end
}

-- return {
--   "mfussenegger/nvim-dap",
--   recommended = true,
--   desc = "Debugging support. Requires language specific adapters to be configured. (see lang extras)",
--
--   dependencies = {
--     {
--       "rcarriga/nvim-dap-ui",
--       dependencies = { "nvim-neotest/nvim-nio" },
--       -- stylua: ignore
--       keys = {
--         { "<leader>du", function() require("dapui").toggle({ }) end, desc = "Dap UI" },
--         { "<leader>de", function() require("dapui").eval() end, desc = "Eval", mode = {"n", "v"} },
--       },
--       opts = {},
--       config = function(_, opts)
--         local dap = require("dap")
--         local dapui = require("dapui")
--         dapui.setup(opts)
--         dap.listeners.after.event_initialized["dapui_config"] = function()
--           dapui.open({})
--         end
--         dap.listeners.before.event_terminated["dapui_config"] = function()
--           dapui.close({})
--         end
--         dap.listeners.before.event_exited["dapui_config"] = function()
--           dapui.close({})
--         end
--       end,
--     },
--     -- virtual text for the debugger
--     {
--       "theHamsta/nvim-dap-virtual-text",
--       opts = {},
--     },
--   },
--
--   -- stylua: ignore
--   keys = {
--     { "<leader>d", "", desc = "+debug", mode = {"n", "v"} },
--     { "<leader>dB", function() require("dap").set_breakpoint(vim.fn.input('Breakpoint condition: ')) end, desc = "Breakpoint Condition" },
--     { "<leader>db", function() require("dap").toggle_breakpoint() end, desc = "Toggle Breakpoint" },
--     { "<leader>dc", function() require("dap").continue() end, desc = "Continue" },
--     { "<leader>da", function() require("dap").continue({ before = get_args }) end, desc = "Run with Args" },
--     { "<leader>dC", function() require("dap").run_to_cursor() end, desc = "Run to Cursor" },
--     { "<leader>dg", function() require("dap").goto_() end, desc = "Go to Line (No Execute)" },
--     { "<leader>di", function() require("dap").step_into() end, desc = "Step Into" },
--     { "<leader>dj", function() require("dap").down() end, desc = "Down" },
--     { "<leader>dk", function() require("dap").up() end, desc = "Up" },
--     { "<leader>dl", function() require("dap").run_last() end, desc = "Run Last" },
--     { "<leader>do", function() require("dap").step_out() end, desc = "Step Out" },
--     { "<leader>dO", function() require("dap").step_over() end, desc = "Step Over" },
--     { "<leader>dp", function() require("dap").pause() end, desc = "Pause" },
--     { "<leader>dr", function() require("dap").repl.toggle() end, desc = "Toggle REPL" },
--     { "<leader>ds", function() require("dap").session() end, desc = "Session" },
--     { "<leader>dt", function() require("dap").terminate() end, desc = "Terminate" },
--     { "<leader>dw", function() require("dap.ui.widgets").hover() end, desc = "Widgets" },
--   },
--
--   config = function()
--     -- load mason-nvim-dap here, after all adapters have been setup
--     require("mason-nvim-dap").setup(LazyVim.opts("mason-nvim-dap.nvim"))
--
--     vim.api.nvim_set_hl(0, "DapStoppedLine", { default = true, link = "Visual" })
--
--     for name, sign in pairs(LazyVim.config.icons.dap) do
--       sign = type(sign) == "table" and sign or { sign }
--       vim.fn.sign_define(
--         "Dap" .. name,
--         { text = sign[1], texthl = sign[2] or "DiagnosticInfo", linehl = sign[3], numhl = sign[3] }
--       )
--     end
--
--     -- setup dap config by VsCode launch.json file
--     local vscode = require("dap.ext.vscode")
--     local json = require("plenary.json")
--     vscode.json_decode = function(str)
--       return vim.json.decode(json.json_strip_comments(str))
--     end
--   end,
-- }

